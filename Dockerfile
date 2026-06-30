FROM ubuntu:26.04

ARG MEDIATOR_VERSION=0.16.7

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://fpp.ic3.dev/mediator-k8s/${MEDIATOR_VERSION}/mediator" -o /usr/local/bin/mediator && \
    chmod 0755 /usr/local/bin/mediator

WORKDIR /app/mediator

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
