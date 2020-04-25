FROM kalilinux/kali-rolling

RUN apt update && apt upgrade -y \
    && apt install -y vim net-tools dnsutils recon-ng masscan nikto nmap smbmap \
        sqlmap metasploit-framework veil burpsuite dirb tcpdump \
        hurl wfuzz whatweb wpscan zaproxy binwalk libimage-exiftool-perl \
        responder cewl patator netcat socat weevely jd-gui python3-impacket \
        nodejs npm ccze jq jython \
    && apt-get -y clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    \
    && wget "https://github.com/OJ/gobuster/releases/download/v3.0.1/gobuster-linux-amd64.7z" -O "gobuster-linux-amd64.7z" \
    && 7z x gobuster-linux-amd64.7z \
    && mv gobuster-linux-amd64/gobuster /usr/bin/gobuster \
    && chmod +x /usr/bin/gobuster \
    && rm -rf gobuster-linux-amd64* \
    \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-smbserver \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-wmipersist \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-smbexec \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-GetADUsers

COPY bashrc /root/.bashrc
COPY bash_aliases /root/.bash_aliases
COPY bash_functions /root/.bash_functions

