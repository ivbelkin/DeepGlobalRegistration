#!/bin/bash

IMAGE=deep_global_registration
CONTAINER=${IMAGE}_${USER}

xhost +local:root
docker run -it -d --rm \
    --ipc host --net host --gpus all -e NVIDIA_DRIVER_CAPABILITIES=all \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --name ${CONTAINER} \
    --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /home/${USER}:/home/${USER}:rw \
    -v /media/${USER}:/media/${USER}:rw \
    ${IMAGE}
xhost -local:root
