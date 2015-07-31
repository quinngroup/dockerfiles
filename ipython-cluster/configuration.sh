#!/bin/bash

# Other stuff you don't need to worry your pretty little head over.
__dockerfile_dir=$(pwd)
__image_base=ipython-cluster-base
__image_controller=ipython-cluster-controller
__image_engine=ipython-cluster-engine

__host_dir_engine=$(pwd)/runtime/security
__host_engine=ipcontroller-engine.json

# build function
# NOTE: requires Dockerfiles in shared directory that follows naming scheme: prefix/label.dockerfile
function build_docker_image() {
  local __image=$1
  echo -e "\n\n ----- Building $__image ----- \n\n"
  pushd ${__dockerfile_dir}/${__image}
  docker build -t $__image .
  popd
}