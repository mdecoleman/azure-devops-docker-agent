#!/bin/bash

REGISTRY_URL=mdecoleman
REPOSITORY_NAME="azure-devops-agent"

docker build -t $REPOSITORY_NAME .
docker tag $REPOSITORY_NAME "${REGISTRY_URL}/${REPOSITORY_NAME}:latest"
docker tag $REPOSITORY_NAME "${REGISTRY_URL}/${REPOSITORY_NAME}:18.04"
docker tag $REPOSITORY_NAME "${REGISTRY_URL}/${REPOSITORY_NAME}:bionic"
docker push "${REGISTRY_URL}/${REPOSITORY_NAME}:latest"
docker push "${REGISTRY_URL}/${REPOSITORY_NAME}:18.04"
docker push "${REGISTRY_URL}/${REPOSITORY_NAME}:bionic"