FROM alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659 AS builder

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
