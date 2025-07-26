FROM alpine:latest AS builder

ARG ARCH="amd64"
ARG REPO="userdocs/iperf2-static"

RUN apk update \
	&& apk upgrade \
	&& apk add sudo \
	&& adduser -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github

ADD --chown=username:username --chmod=700 "https://github.com/${REPO}/releases/latest/download/iperf-${ARCH}" /usr/local/bin/iperf

USER username

WORKDIR /home/username
