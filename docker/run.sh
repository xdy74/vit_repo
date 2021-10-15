#! /bin/bash

if [ -z $1 ] ; then
    GPU=all
else
    GPU=$1
fi

mkdir -p .fake_home

docker run -it --rm \
    --gpus '"device='$GPU'"' \
    --name 'keras_tf' \
    --hostname $(hostname) \
    -u $(id -u):$(id -g) \
    -e HOME \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v $(pwd)/.fake_home:$HOME \
    -v $(pwd):/keras_tf \
    -w /keras_tf \
    keras_tf:2.6.0