#!/bin/bash

docker build \
    --network host \
    -t keras_tf:2.6.0 \
    ./docker