#!/bin/bash
gradle build && \
gradle installDist && \
sh build/install/kafka_app/bin/consumer

