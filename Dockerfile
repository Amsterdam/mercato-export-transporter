FROM debian:stretch
MAINTAINER datapunt@amsterdam.nl

RUN ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

ARG DEBIAN_FRONTEND=noninteractive
ARG SWIFT_AUTH_URL
ARG SWIFT_REGION
ARG SWIFT_PROJECT_ID
ARG SWIFT_DOMAIN_ID
ARG SWIFT_USER_NAME
ARG MERCATO_CONTAINER
ARG MAKKELIJKEMARKT_CONTAINER
ARG BRIEVENBUS_SERVER
ARG BRIEVENBUS_USERNAME
ARG GPG_PUBLIC_BASE64
ARG GPG_PRIVATE_BASE65


RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y clean \
 && apt-get -y autoremove

RUN apt-get -y install sshpass curl unzip gpg python-swiftclient

COPY app /app

WORKDIR /app

