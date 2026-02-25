#!/usr/bin/env sh
set -eu
IFS=$(printf ' \n\t')

echo "In the test wait function....."

# Exit event handler
on_exit() {
  rc=$?   # capture exit code immediately

  if [ "$rc" -eq 1 ]; then
    echo "Script failed with exit code 1 — dumping diagnostics..."

    echo "pods:"
    kubectl -n "$NS" get pods -o wide || true
    echo ""
    echo "events:"
    kubectl -n "$NS" get events --sort-by=.lastTimestamp || true

    echo ""
    echo "logs:"
    # dump logs for all pods
    kubectl -n "$NS" get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' |
    while IFS= read -r pod
    do
      [ -z "$pod" ] && continue
      echo "===== Logs for $pod ====="
      kubectl -n "$NS" logs "$pod" --all-containers=true --ignore-errors=true || true
      kubectl -n "$NS" logs "$pod" --all-containers=true -p --ignore-errors=true || true
    done
  else
    kubectl get pods -n rapidfort
  fi

  exit "$rc"   # preserve original exit code
}

# Register exit event handler.
trap on_exit EXIT

NS="rapidfort"
RF_TIMEOUT="${RF_TIMEOUT:-600}"

start_time=$(date +%s)
deadline=$((start_time + RF_TIMEOUT))

echo "Waiting for all pods in namespace '$NS' to be Ready (timeout $RF_TIMEOUT)..."

kubectl -n "$NS" get pods \
  -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.deletionTimestamp}{"\t"}{.status.phase}{"\t"}{.status.conditions[?(@.type=="Ready")].status}{"\n"}{end}'

echo "waiting on any pods that are not ready..."

while :; do
  now=$(date +%s)
  remaining=$((deadline - now))

  if [ "$remaining" -le 0 ]; then
    echo "Global timeout exceeded"
    exit 1
  fi

  # Get only pods that:
  # - are not terminating
  # - are not Succeeded/Failed
  not_ready=$(
    kubectl -n "$NS" get pods \
      -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.deletionTimestamp}{"\t"}{.status.phase}{"\t"}{.status.conditions[?(@.type=="Ready")].status}{"\n"}{end}' |
    awk -F '\t' '
      $2 == "" && $3 != "Succeeded" && $3 != "Failed" && $4 != "True" { print $1 }
    '
  )

  echo "pods not ready: $not_ready"

  if [ -z "$not_ready" ]; then
    echo "All non-terminating pods are Ready"
    exit 0
  fi

  sleep 5
done
