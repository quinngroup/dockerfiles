#!/bin/bash

# This script sets everything up. You'll want to run this on all nodes.

sudo apt-get update
sudo apt-get install --assume-yes wget

# Install Docker.
wget -qO- https://get.docker.com/ | sh

source configuration.sh

build_docker_image $__image_base
build_docker_image $__image_controller
build_docker_image $__image_engine
