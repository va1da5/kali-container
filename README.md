# Kali Docker Image

It became too much for my old laptop to carry VMs around.. **Docker** to the rescue!

## Requirements

- Docker CE
- Direct Internet connection

## Build Image

- Run `make build`. The image `$USER/kali` will take ~8GB of space once built.
- The build script can add `run.sh` as symbolic link in host's `/usr/local/bin/kali-here` meaning that the script will be accessible from anywhere in the system.
- Run `make deploy` to setup a symbolic link to the `/usr/local/bin/kali-here`.

## Usage

```bash
# put you in the Kali container.
# current directory is the workdir of the container.
./run.sh
```