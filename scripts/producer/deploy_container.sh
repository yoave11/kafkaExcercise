#!/usr/bin/env bash

export PORT=8888
IMG=kafka-producer

 docker build --no-cache -f DockerfileProducer . -t $IMG
! docker rm -f $IMG


docker run $IMG
