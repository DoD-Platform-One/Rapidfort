#!/bin/bash


set -x
echo "This is test from rapidfort."

kubectl get deploy -n rapidfort

kubectl get pods -n rapidfort

kubectl get NetworkPolicy -n rapidfort

kubectl get DestinationRule -n rapidfort

kubectl get ServiceEntry -n rapidfort

kubectl get PeerAuthentication -n rapidfort

kubectl get VirtualService -n rapidfort

kubectl describe pod -n rapidfort mysql-0
set +x