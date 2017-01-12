#!/usr/bin/env bash
set -x

export DEVPI_SERVERDIR=/data/server
export DEVPI_CLIENTDIR=/data/client

mkdir -p $DEVPI_SERVERDIR
mkdir -p $DEVPI_CLIENTDIR

devpi-server --init
devpi-server --start
devpi login root --password=''
devpi user -m root password="secret"
devpi index -y -c public pypi_whitelist='*'
devpi-server --stop
devpi-server --host 0.0.0.0 --port 3141
