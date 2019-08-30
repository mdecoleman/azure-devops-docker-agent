FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && \
        apt-get install --no-install-recommends \
        ca-certificates \
        wget \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        libssl1.0.0 \
        netcat \
        zip \
        unzip \
        apt-transport-https \
        gnupg-agent \
        software-properties-common

# Install dotnetcore 2.2
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
        dpkg -i packages-microsoft-prod.deb && \
        add-apt-repository universe && \
        apt-get update && \
        apt-get install aspnetcore-runtime-2.2

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
        apt-get update && apt-get install --no-install-recommends \
        docker-ce docker-ce-cli containerd.io

# Install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add - && \
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list && \
        apt-get update && apt-get install kubectl

WORKDIR /azp

COPY ./entry-point.sh .
RUN chmod +x entry-point.sh

RUN echo "--------------------" && \
        echo "Installed Packages" && \
        docker --version && \
        echo "kubectl $(kubectl version --client=true --short=true)" && \
        echo "--------------------"

CMD ["./entry-point.sh"]