#!/bin/bash

docker run -d --privileged -e AZP_URL=$AZP_URL \
    -e AZP_TOKEN=$AZP_TOKEN \
    -e AZP_POOL="$AZP_POOL" \
    -e AZP_AGENT_NAME=$AZP_AGENT_NAME \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):/bin/docker \
    mdecoleman/azure-devops-agent:bionic