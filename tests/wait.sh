#!/bin/bash

wait_project() {
    echo "This is test function....."
    kubectl get pods -n rapidfort
}

wait_project