# Kali Docker Image

It became too much for my old laptop to carry VMs around.. **Docker** to the rescue!

## Requirements

- Docker CE
- Direct Internet connection

## Build Image

- Run `make build` to create Kali container image. The image `$USER/kali` will take ~8GB of space once built.
- Run `make deploy` to setup a symbolic link from `run.sh` to the `/usr/local/bin/kali-here`.

## Usage

```bash
# puts you in the Kali container.
# current directory is the workdir of the container.
./run.sh
# or 
kali-here
```