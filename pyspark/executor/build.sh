#!/bin/bash

# the result of this command is msft/spark-py:build
wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz && \
tar -xf spark-3.1.2-bin-hadoop3.2.tgz && \
./spark-3.1.2-bin-hadoop3.2/bin/docker-image-tool.sh -r msft -t build -p ./Dockerfile build
