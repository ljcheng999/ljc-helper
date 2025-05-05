FROM --platform=${TARGETOS}/${TARGETARCH} debian:stable-slim

MAINTAINER Lucious Johnny Cheng

USER root

ARG KUBE_VERSION
ARG HELM_VERSION
ARG TARGETOS
ARG TARGETARCH
ARG AWS_VERSION
ARG YQ_VERSION

RUN apt-get update && </dev/null DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg git curl wget gettext-base bash jq vim zip unzip \
    && curl -LO -k https://dl.k8s.io/release/v${KUBE_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && curl -O -k https://get.helm.sh/helm-v${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz && tar xvf helm-v${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz && mv ${TARGETOS}-${TARGETARCH}/helm /usr/local/bin \
    && curl "https://awscli.amazonaws.com/awscli-exe-${TARGETOS}-x86_64.zip" -o "${AWS_VERSION}.zip" \
    && curl -fL https://install-cli.jfrog.io | sh \
    && unzip ${AWS_VERSION}.zip \
    && rm helm-v${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz \
    && rm -rf ${TARGETOS}-${TARGETARCH} \
    && rm -rf /var/lib/apt/lists/* 

RUN ./aws/install -i /usr/local/aws-cli -b /usr/local/bin \
    && mkdir /tools \
    && chmod g+rwx /tools /root \
    && helm version \
    && kubectl version --client \
    && aws --version \
    && uname -a

WORKDIR /tools

ENTRYPOINT [""]