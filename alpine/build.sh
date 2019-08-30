#!/bin/bash

REGISTRY_URL=mdecoleman
REPOSITORY_NAME="azure-devops-agent"

docker build -t $REPOSITORY_NAME .
docker tag $REPOSITORY_NAME "${REGISTRY_URL}/${REPOSITORY_NAME}:alpine"
docker push "${REGISTRY_URL}/${REPOSITORY_NAME}:alpine"