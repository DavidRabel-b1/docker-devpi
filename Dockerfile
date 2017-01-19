FROM python:2.7
MAINTAINER Betacloud Solutions GmbH (https://www.betacloud-solutions.de)

ENV DEVPI_SERVER_VERSION 4.2.1
ENV DEVPI_CLIENT_VERSION 2.7.0

ENV DEVPI_HOST 0.0.0.0
ENV DEVPI_PORT 3141

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && pip install -q -U "devpi-server==$DEVPI_SERVER_VERSION" \
    && pip install -q -U "devpi-client==$DEVPI_CLIENT_VERSION" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY files/start.sh /start.sh
ENTRYPOINT ["/start.sh"]
EXPOSE 3141
