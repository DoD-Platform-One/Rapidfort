#!/bin/bash

wait_project() {
    echo "This is test function....."
    kubectl get pods -n rapidfort
    echo "logs from backend"
    kubectl logs -l app.kubernetes.io/name=backend -n rapidfort

}

wait_project