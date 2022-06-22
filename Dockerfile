ARG ALPINE_VERSION='3.16.0'
ARG BIND_VERSION='=9.16.29-r0'

FROM alpine:${ALPINE_VERSION}
LABEL org.opencontainers.image.authors="ddgorczynski@gmail.com"
ARG BIND_VERSION

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bind${BIND_VERSION} && \
    rm -rf /var/cache/apk/*

ADD ./conf/named.conf /etc/bind/

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]