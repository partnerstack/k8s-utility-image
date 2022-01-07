# k8s-utility-image

![Issues](https://img.shields.io/github/issues/partnerstack/k8s-utility-image?&style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/partnerstack/k8s-utility-image?&style=plastic)
![Build](https://img.shields.io/github/workflow/status/partnerstack/k8s-utility-image/build-and-publish/main?&style=plastic)
![Secrets](https://img.shields.io/github/workflow/status/partnerstack/k8s-utility-image/gitguardian-secret-scan/main?label=Secrets%20Check&style=plastic)

## About

Image dedicated to troubleshoot kubernetes clusters by creating an ephemeral container

## Example

### Creating container in cluster
```bash
kubectl config set-context ${CLUSTER}
kubectl run -i --rm --tty k8s-utility-image --image=ghcr.io/partnerstack/k8s-utility-image:latest --restart=Never
# OR for dockerhub repository
kubectl run -i --rm --tty k8s-utility-image --image=partnerstack/k8s-utility-image:latest --restart=Never
```

### Building image with custom build arguments
```bash
docker build -t partnerstack/k8s-utility-image:latest . --no-cache --build-arg KUBECTL_VERSION=1.23.1 
```

## Utilities or Packages installed:

* curl
* net-tools
* dnsutils
* telnet
* inetutils-ping
* postgresql-client
* git
* traceroute
* netcat
* apt-transport-https
* ca-certificates
* gnupg2
* redis-tools
* jq
* yq
* gcloud
* helm
* kubectl
* nmap
* vim

## Build Argument Options

| Option | Description | Default |
| --- | ----------- | ---- |
| `YQ_VERSION` | Yaml Query Version | v4.16.2 |
| `KUBECTL_VERSION` | Kubectl Version | v1.21.8 |
| `HELM_VERSION` | Helm Version | v3.7.2 |
| `GCLOUD_SDK_VERSION` | Google Cloud SDK Version | 367.0.0 |
