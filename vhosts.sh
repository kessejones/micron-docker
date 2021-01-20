#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

IPDOCKER="172.17.0.1"
VHOSTS="integra.local minhamicron.local micronvendas.local micron-estoque.local"

for VHOST in $VHOSTS; do
    if  grep -q $VHOST /etc/hosts; then
        echo "$VHOST: already exists"
    else
        echo "$IPDOCKER    $VHOST" >> /etc/hosts
        echo "$VHOST: created"
    fi
done
