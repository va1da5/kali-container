FROM kalilinux/kali-rolling

ENV _JAVA_OPTIONS -Dawt.useSystemAAFontSettings=on
ENV JAVA_FONTS /usr/share/fonts/truetype

RUN apt update && apt upgrade -y \
    && apt install -y \
    burpsuite \
    cewl \
    curl \
    dirb \
    dnsutils \
    ffuf \
    git \
    gobuster \
    hurl \
    jq \
    jython \
    libimage-exiftool-perl \
    make \
    masscan \
    metasploit-framework \
    net-tools \
    nikto nmap \
    nodejs \
    npm \
    patator \
    proxychains \
    pwncat \
    python3-impacket \
    python3-pip \
    python3-venv \
    recon-ng \
    responder \
    seclists \
    smbmap \
    socat \
    sqlmap \
    tcpdump \
    tmux \
    veil \
    vim \
    weevely \
    wfuzz \
    whatweb \
    wordlists \
    wpscan \
    zaproxy \
    zsh \
    \
    && apt-get -y clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    \
    && npm install -g ngrok \
    \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-smbserver \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-wmipersist \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-smbexec \
    && ln -s /usr/share/impacket/script /usr/bin/impacket-GetADUsers \
    \
    && sh -c 'echo n | ZSH=/etc/zsh/oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' \ 
    && usermod -s /usr/bin/zsh root \
    && touch ~/.hushlogin


COPY aliases /etc/zsh/aliases
COPY zshrc /etc/zsh/zshrc
COPY tmux.conf /etc/tmux.conf

ENTRYPOINT [ "/usr/bin/zsh" ]