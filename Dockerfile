FROM alpine:latest

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash curl wget tor \
    && mkdir -p /onion-auth /etc/tor \
    && echo "SocksPort 0.0.0.0:9050" > /etc/tor/torrc \
    && echo "ClientOnionAuthDir /onion-auth" >> /etc/tor/torrc

ENTRYPOINT  [ "tor" ]
