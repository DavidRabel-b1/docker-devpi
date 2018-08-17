FROM ubuntu:18.04
LABEL maintainer="Betacloud Solutions GmbH (https://www.betacloud-solutions.de)"

ENV DEBIAN_FRONTEND noninteractive
ARG VERSION
ENV VERSION ${VERSION:-4.6.0}

ARG VERSION_CLIENT
ENV VERSION_CLIENT ${VERSION_CLIENT:-4.0.3}

COPY files/run.sh /run.sh

RUN apt-get update \
    && apt-get install -y \
        python-dev \
        python-pip \
    && pip install -q -U "devpi-server==$VERSION" \
    && pip install -q -U "devpi-client==$VERSION_CLIENT" \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

EXPOSE 3141

CMD ["/run.sh"]
