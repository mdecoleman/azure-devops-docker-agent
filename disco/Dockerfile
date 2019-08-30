FROM ubuntu:19.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && \
    apt-get install --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    git \
    iputils-ping \
    libcurl4 \
    libicu63 \
    libunwind8 \
    netcat \
    zip \
    unzip \
    apt-transport-https \
    gnupg-agent \
    software-properties-common

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    containerd.io

WORKDIR /azp

COPY ./entry-point.sh .
RUN chmod +x entry-point.sh

RUN echo "--------------------" && \
    echo "Installed Packages" && \
    docker --version && \
    echo "--------------------"

CMD ["./entry-point.sh"]