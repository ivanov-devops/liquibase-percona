FROM alpine

WORKDIR /liquibase

RUN apk update && \
    apk add --update curl ca-certificates maven mysql-client && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing percona-toolkit && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY src/main /liquibase
COPY pom.xml /liquibase

ENTRYPOINT ["/entrypoint.sh"]
ONBUILD VOLUME /liquibase
