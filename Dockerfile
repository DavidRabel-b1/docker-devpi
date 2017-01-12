FROM python:2.7
MAINTAINER Betacloud Solutions GmbH (https://www.betacloud-solutions.de)

ENV DEBIAN_FRONTEND noninteractive
ENV DEVPI_SERVER_VERSION 4.2.1
ENV DEVPI_CLIENT_VERSION 2.7.0

RUN apt-get update \
    && apt-get upgrade -y \
    && pip install -q -U "devpi-server==$DEVPI_SERVER_VERSION" \
    && pip install -q -U "devpi-client==$DEVPI_CLIENT_VERSION"

COPY files/start.sh /start.sh
ENTRYPOINT ["/start.sh"]
EXPOSE 3141
