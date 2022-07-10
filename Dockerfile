FROM alpine

RUN apk add --no-cache \
    curl \
    git openssh-client

ADD *.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
