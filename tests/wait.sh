#!/bin/bash


set -x
echo "This is test from rapidfort."

kubectl get deploy -n rapidfort

kubectl get pods -n rapidfort

kubectl get NetworkPolicy -n rapidfort || true

kubectl get DestinationRule -n rapidfort || true

kubectl get ServiceEntry -n rapidfort || true

kubectl get PeerAuthentication -n rapidfort || true

kubectl get VirtualService -n rapidfort || true

kubectl describe pod -n rapidfort mysql-0
set +x

wait_project() {
    echo "This is temp function....."
}