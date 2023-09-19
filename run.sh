#!/usr/bin/env bash

function start {
    xhost +local:docker

    dirname=${PWD##*/}
    docker volume create kali
    docker run -it --rm \
        --entrypoint=/usr/bin/zsh \
        --env "DISPLAY" \
        --volume /opt:/opt \
        --volume $XAUTHORITY:$XAUTHORITY:ro \
        --volume "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
        --volume "${PWD}:/${dirname}" \
        --volume "kali:/root" \
        --workdir "/${dirname}" \
        --network host \
        --security-opt label=type:container_runtime_t \
        $USER/kali
}

start
