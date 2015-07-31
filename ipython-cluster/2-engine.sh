#!/bin/bash

# This starts up engines that connect to the controller.

# FIRST: We need the connection file generated by the start of the controller.
# rsync it, scp it, do whatever you need to do to make sure it's in the 
# specified directory.

source configuration.sh

if [ ! -f ${__host_dir_engine}/${__host_engine} ]; then
    echo "You must copy over the ipcontroller-engine.json file FROM the controller TO the engines."
    exit 1
fi

__image=$__image_engine
docker pull $__image
docker run -d \
    --net="host" \
    $__image
