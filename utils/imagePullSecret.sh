#!/bin/bash
kubectl create secret generic private-registry \
    --from-file=.dockerconfigjson=${HOME}/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson