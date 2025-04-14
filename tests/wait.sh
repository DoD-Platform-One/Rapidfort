#!/bin/bash

wait_project() {
    echo "This is test function....."
    kubectl get pods -n rapidfort
    kubectl logs -l app.kubernetes.io/name=backend -n rapidfort || true
    kubectl logs -l app.kubernetes.io/name=backend -n rapidfort || true
}

wait_project