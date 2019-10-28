# Kali Docker Image

It became too much for my old laptop to carry VMs around.. **Docker** to the rescue!

## Requirements
- Docker CE
- Direct Internet connection

## Build Image
- Run `./build.sh` script
- The build script can add `run.sh` as symbolic link in host's `/usr/local/bin/kali` meaning that the script will be accessible from anywhere in the system.

## Usage
- `./run.sh` shows available options
- `./run.sh start` starts Kali container
- `./run.sh stop` stops the container
- `./run.sh exec` executes command in the active container
- `./run.sh attach` attaches cli to container shell


