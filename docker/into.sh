#!/bin/bash

IMAGE=deep_global_registration
CONTAINER=${IMAGE}_${USER}

docker exec --user ${USER} -it ${CONTAINER} \
    /bin/bash -c "cd /home/${USER}; /bin/bash"
