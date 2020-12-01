#!/usr/bin/env bash

g="\e[32m"
e="\e[0m"

echo -e "$g[!]$e Starting Kali image build process"
docker build --no-cache -t $USER/kali-docker files \
    && echo -e "$g[+]$e Kali images was built successfully"

echo -e "$g[?]$e Do you want to access run.sh from anywhere in the system as 'kali' command? [Y/N]"
read input

if [ "${input}" == "Y" ] || [ "${input}" == "y" ]
then
    sudo ln -s "$PWD/run.sh" "/usr/local/bin/kali" \
        && echo -e "$g[+]$e Installed! Now you use 'kali' command in any directory"
fi