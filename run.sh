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
        --name "kali-docker" \
        --hostname "kali" \
        $USER/kali-docker
}

function stop {
    docker stop kali-docker
    xhost -local:docker
    exit 0
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    exec)
        shift;
        docker exec kali-docker "$@"
        ;;
    attach)
        docker exec -it kali-docker /bin/bash
        ;;
    *)
        echo $"Usage: $0 {start|stop|exec|attach|status}"
        exit 1
esac
