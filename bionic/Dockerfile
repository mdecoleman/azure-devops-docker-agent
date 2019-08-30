FROM mcr.microsoft.com/dotnet/core/sdk:2.2-bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update && \
        apt-get install --no-install-recommends \
        apt-utils \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        netcat \
        zip \
        unzip \
        python3.7 \
        python-pip \
        apt-transport-https \
        gnupg2 \
        software-properties-common

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
        apt-get update && apt-get install --no-install-recommends \
        docker-ce docker-ce-cli containerd.io

# Install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add - && \
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list && \
        apt-get update && apt-get install kubectl
        
# Install nodejs
RUN curl -sL "https://deb.nodesource.com/setup_10.x" | bash && \
        apt-get install nodejs

# Install AWS SDK
RUN pip install --upgrade --user setuptools wheel && \
        pip install awscli --upgrade

RUN echo "--------------------" && \
        echo "Installed Versions" && \
        echo "node version: $(node --version)" && \
        docker --version && \
        echo "kubectl $(kubectl version --client=true --short=true)" && \
        echo "--------------------"

WORKDIR /azp

COPY ./entry-point.sh .
RUN chmod +x entry-point.sh

CMD ["./entry-point.sh"]