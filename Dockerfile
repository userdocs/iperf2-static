FROM alpine:latest@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6 AS builder

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
