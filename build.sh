#!/usr/bin/env bash

echo "[!] Starting Kali image build process"
docker build -t $USER/kali-docker files \
    && echo "[+] Kali images was built successfully"

echo "[?] Do you want to access run.sh from anywhere in the system as 'kali' command? [Y/N]"
read input

if [ "${input}" == "Y" ] || [ "${input}" == "y" ]
then
    sudo ln -s "$PWD/run.sh" "/usr/local/bin/kali"
    echo "[+] Installed! Now you use 'kali' command in any directory"
fi