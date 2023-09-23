#!/usr/bin/env bash

function start {
    xhost +local:docker

    dirname=${PWD##*/}
    docker volume create kali_root
    docker run -it --rm \
        --entrypoint=/usr/bin/zsh \
        --hostname kali \
        --env "DISPLAY" \
        --volume /opt:/opt \
        --volume $XAUTHORITY:$XAUTHORITY:ro \
        --volume "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
        --volume "${PWD}:/${dirname}" \
        --volume "kali_root:/root" \
        --workdir "/${dirname}" \
        --network host \
        --security-opt label=type:container_runtime_t \
        --security-opt apparmor=unconfined \
        --security-opt seccomp=unconfined \
        --cap-add=SYS_PTRACE \
        $USER/kali
}

function attach {
    docker exec -it $(docker ps -q -n 1 --filter "ancestor=kali:latest") zsh
}

ATTACH="kali-attach"
if [[ "$0" == *"$ATTACH"* ]]; then
    attach
else
    start
fi
