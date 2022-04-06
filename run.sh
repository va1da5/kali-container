#!/usr/bin/env bash

function start {
    xhost +local:docker

    dirname=${PWD##*/}
    docker run -it --rm \
        --entrypoint=/bin/bash \
        --env DISPLAY=unix$DISPLAY \
        --volume /opt:/opt \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --volume "${PWD}:/${dirname}" \
        --workdir "/${dirname}" \
        --network host \
        $USER/kali
}

start
