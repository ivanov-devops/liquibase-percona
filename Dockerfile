FROM alpine

RUN apk update && \
    apk add --update curl ca-certificates maven mysql-client && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing percona-toolkit && \
    rm -rf /var/cache/apk/*

COPY pom.xml /liquibase

WORKDIR /liquibase
ONBUILD VOLUME /liquibase
