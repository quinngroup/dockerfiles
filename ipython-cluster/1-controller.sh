#!/bin/bash

# This starts up the controller. This should go without saying, but only
# run this on the node(s) where you want a controller running.

source configuration.sh

__image=$__image_controller
docker pull $__image
docker run -d \
    --net="host" \
    --volume=$__host_dir_engine:/root/.ipython/profile_default/security \
    $__image
