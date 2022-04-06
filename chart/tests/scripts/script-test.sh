#!/bin/bash
set -ex

echo "-----------------------------------------"
echo "BEGIN rapidfort jwt test"
echo "-----------------------------------------"
TOKEN=$(curl -sd 'test' ${URL}/token | jq -r .token) &&
curl -sH "Authorization: Bearer ${TOKEN}" ${URL}/token/validate | grep test
echo "-----------------------------------------"
echo "END rapidfort jwt test"
echo "-----------------------------------------"
