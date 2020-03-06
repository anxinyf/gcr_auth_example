#!/usr/bin/env bash

GCP_PROJECT_ID=...
MY_IMAGE=...

USERNAME=_json_key
PASSWORD=$(cat keyfile.json)

TOKEN=$(echo "$USERNAME:$PASSWORD" | base64)

RESPONSE=$(curl --header "Authorization: Basic $TOKEN" "https://gcr.io/v2/token?service=gcr.io&scope=registry:$GCP_PROJECT_ID/$MY_IMAGE:*")

REGISTRY_TOKEN=$(echo $RESPONSE | jq -r '.token')

echo "Registry token: $REGISTRY_TOKEN"
curl --header "Authorization: Bearer $REGISTRY_TOKEN" "https://gcr.io/v2/$GCP_PROJECT_ID/$MY_IMAGE/manifests/latest"
echo
