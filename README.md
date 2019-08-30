# Azure Devops Docker Agent

![Build status](https://mdec.visualstudio.com/azure-devops-docker-agent/_apis/build/status/mdecoleman.azure-devops-docker-agent)

## Supported tags

* **[18.04, bionic, latest](./bionic/Dockerfile)**

## What's in the image?
The image can be used to run your own self hosted Azure Devops Build Agents.

### Capabilities
* docker
* kubectl
* nodejs

## Docker in Docker

When run in privileged mode and the docker host socket mounted, the agent can be used to run docker builds.

## Getting Started

### Environment setup
* **AZP_URL**
* **AZP_TOKEN** - PAT token
* **AZP_POOL** - Agent pool to register with
* **AZP_AGENT_NAME** - Name of registered agent in the pool

### Starting the agent

``` bash
docker run -d --privileged \
    -e AZP_URL=$AZP_URL \
    -e AZP_TOKEN=$AZP_TOKEN \
    -e AZP_POOL="$AZP_POOL" \
    -e AZP_AGENT_NAME=$AZP_AGENT_NAME \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):/bin/docker \
    mdecoleman/azure-devops-agent:latest
```