FROM ubuntu:26.04

ARG MEDIATOR_VERSION=0.16.7

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://fpp.ic3.dev/mediator-k8s/${MEDIATOR_VERSION}/mediator" -o /usr/local/bin/mediator && \
    curl -fsSL "https://fpp.ic3.dev/mediator-k8s/${MEDIATOR_VERSION}/mediator-setup" -o /usr/local/bin/mediator-setup && \
    chmod 0755 /usr/local/bin/mediator /usr/local/bin/mediator-setup

WORKDIR /app/mediator

ENTRYPOINT ["mediator"]
