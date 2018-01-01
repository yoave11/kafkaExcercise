#!/usr/bin/env bash

export PORT=8888
IMG=kafka-consumer

 docker build --no-cache -f DockerfileConsumer . -t $IMG
! docker rm -f $IMG


docker run $IMG
