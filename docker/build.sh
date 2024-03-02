#!/bin/bash

IMAGE=deep_global_registration

docker build .. \
    --network host \
    -f Dockerfile \
    --build-arg USER=$(id -un) \
    --build-arg UID=$(id -u) \
    --build-arg GROUP=$(id -gn) \
    --build-arg GID=$(id -g) \
    -t ${IMAGE}
