#!/usr/bin/env bash
set -x

# Available environment variables
#
# DEVPI_HOST
# DEVPI_PORT

# Set default values

DEVPI_HOST=${DEVPI_HOST:-0.0.0.0}
DEVPI_PORT=${DEVPI_HOST:-3141}

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
devpi-server --host $DEVPI_HOST --port $DEVPI_PORT
