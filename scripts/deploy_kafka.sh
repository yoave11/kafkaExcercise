docker run -p 2181:2181 -p 9092:9092 \
    --env ADVERTISED_HOST=192.168.0.66 \
    --env ADVERTISED_PORT=9092 \
    spotify/kafkaproxy