FROM kalilinux/kali-rolling

RUN apt update && apt upgrade -y \
    && apt install -y vim net-tools dnsutils masscan nikto nmap \
    sqlmap metasploit-framework burpsuite dirb tcpdump \
    hurl wfuzz whatweb binwalk libimage-exiftool-perl \
    cewl patator pwncat socat jd-gui wordlists recon-ng \
    python3-venv nodejs npm jq jython gobuster seclists \
    veil wpscan zaproxy responder smbmap weevely python3-impacket \
    proxychains \
    && apt-get -y clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-smbserver \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-wmipersist \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-smbexec \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-GetADUsers

COPY bashrc /root/.bashrc
COPY bash_aliases /root/.bash_aliases
COPY bash_functions /root/.bash_functions
