FROM kalilinux/kali-linux-docker

RUN apt update && apt upgrade -y \
    && apt install -y vim net-tools recon-ng masscan nikto nmap smbmap \
        sqlmap metasploit-framework veil burpsuite dirb gobuster \
        hurl wfuzz whatweb wpscan zaproxy binwalk libimage-exiftool-perl \
        responder cewl patator netcat socat weevely jd-gui python3-impacket \
        nodejs npm ccze jq virtualenv jython \
    && apt-get -y clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY bashrc /root/.bashrc
COPY bash_aliases /root/.bash_aliases
COPY bash_functions /root/.bash_functions

