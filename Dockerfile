FROM debian:bullseye-slim
ARG YQ_VERSION="v4.16.2" KUBECTL_VERSION="v1.21.8" HELM_VERSION="v3.7.2" GCLOUD_SDK_VERSION="367.0.0"

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        curl \
        python3 \
        net-tools \
        dnsutils \
        telnet \
        inetutils-ping \
        postgresql-client \
        git \
        traceroute \
        netcat \
        apt-transport-https \
        ca-certificates \
        gnupg2 \
        redis-tools \
        jq \
        nmap \
        vim

ENV YQ_VERSION=$YQ_VERSION
RUN curl -Lo /usr/bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" \
    && chmod +x /usr/bin/yq

ENV KUBECTL_VERSION=$KUBECTL_VERSION
RUN curl -Lo /usr/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x /usr/bin/kubectl

ENV HELM_VERSION=$HELM_VERSION
RUN curl -L -O "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" \
    && tar -xvf "helm-${HELM_VERSION}-linux-amd64.tar.gz" \
    && mv linux-amd64/helm /usr/bin/helm \
    && rm -rf linux-amd64 "helm-${HELM_VERSION}-linux-amd64.tar.gz"

ENV GCLOUD_SDK_VERSION=$GCLOUD_SDK_VERSION
ENV PATH /google-cloud-sdk/bin:$PATH
RUN curl -L -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && tar xzf "google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && rm "google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && ./google-cloud-sdk/install.sh --quiet \
    && gcloud config set core/disable_usage_reporting true \
    && gcloud config set component_manager/disable_update_check true

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
