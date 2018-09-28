#!/bin/sh

if [ ! -d /data/$HOSTNAME ]; then
    mkdir -p /data/$HOSTNAME
fi

redis-server /etc/redis.conf --dir /data/$HOSTNAME &
