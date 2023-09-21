# Kali Container Image

> My trusty old laptop couldn't handle the workload of running heavy virtual machines anymore. **Containers to the rescue!**

In many cases, we only require a specific set of common tools that are available in Kali Linux. The rest of the tools are unnecessary and can burden the system. Using a whole Kali virtual machine may be excessive and cause system overhead. However, using a container can be a viable solution to reduce the system's footprint while still having access to the expected tools found in the Kali distribution. Additionally, if there is a need for specific tools, they can be easily installed from the Kali repositories. Moreover, it is even possible to run applications that require a graphical user interface by mounting the X11 socket. Ultimately, this approach offers an effortless way to have a minimal set of tools while benefiting from the usability and flexibility provided by Kali.

Please feel free to modify the tools listed in the [Dockerfile](./files/Dockerfile) to suit your specific requirements and take advantage of the flexibility offered by container technology. The official Kali documentation provides a [comprehensive list of available tools](https://www.kali.org/tools/) for your reference.

## Persistance

Certain tools, such as BurpSuite proxy, require a persistence layer to maintain their settings and configurations between runs. To accommodate this, a dedicated volume `kali` is created for the Kali container, specifically mapping to the `/root` directory which serves as the home directory for the container user. By doing this, your tool's configuration will persist across individual runs, allowing you to pick up where you left off.

If you ever need to start fresh or reset the configuration, you can simply delete the `kali` container volume. This will remove all the stored data associated with the user, effectively resetting it to its default state.

## Requirements

- Docker CE || Podman
- [Make utility](https://www.gnu.org/software/make/)
- Direct Internet connection

## Tools

### Default

- [burpsuite](https://www.kali.org/tools/burpsuite/)
- [cewl](https://www.kali.org/tools/cewl/)
- [curl](https://www.kali.org/tools/curl/)
- [dirb](https://www.kali.org/tools/dirb/)
- [dnsutils](https://packages.debian.org/buster/dnsutils)
- [ffuf](https://www.kali.org/tools/ffuf/)
- [git](https://www.kali.org/tools/git/)
- [gobuster](https://www.kali.org/tools/gobuster/)
- [hurl](https://www.kali.org/tools/hurl/)
- [jq](https://jqlang.github.io/jq/)
- [jython](https://www.jython.org/)
- [libimage-exiftool-perl](https://www.kali.org/tools/libimage-exiftool-perl/)
- [make](https://www.gnu.org/software/make/)
- [masscan](https://www.kali.org/tools/masscan/)
- [metasploit-framework](https://www.kali.org/tools/metasploit-framework/)
- [net-tools](https://www.kali.org/tools/net-tools/)
- [nikto](https://www.kali.org/tools/nikto/)
- [nmap](https://www.kali.org/tools/nmap/)
- [nodejs](https://nodejs.org/en)
- [npm](https://www.npmjs.com/)
- [patator](https://www.kali.org/tools/patator/)
- [proxychains](https://github.com/haad/proxychains)
- [pwncat](https://www.kali.org/tools/pwncat/)
- [python3-impacket](https://github.com/fortra/impacket)
- [python3-venv](https://docs.python.org/3/library/venv.html)
- [recon-ng](https://www.kali.org/tools/recon-ng/)
- [responder](https://www.kali.org/tools/responder/)
- [seclists](https://www.kali.org/tools/seclists/)
- [smbmap](https://www.kali.org/tools/smbmap/)
- [socat](https://www.kali.org/tools/socat/)
- [sqlmap](https://www.kali.org/tools/sqlmap/)
- [tcpdump](https://www.kali.org/tools/tcpdump/)
- [veil](https://www.kali.org/tools/veil/)
- [vim](https://www.kali.org/tools/vim/)
- [weevely](https://www.kali.org/tools/weevely/)
- [wfuzz](https://www.kali.org/tools/wfuzz/)
- [whatweb](https://www.kali.org/tools/whatweb/)
- [wordlists](https://www.kali.org/tools/wordlists/)
- [wpscan](https://www.kali.org/tools/wpscan/)
- [zaproxy](https://www.kali.org/tools/zaproxy/)
- [zsh](https://www.kali.org/tools/zsh/)

## Reversing

- All from the default build
- Support for 32-bit binary executables
- [binutils](https://www.gnu.org/software/binutils/)
- [binwalk](https://www.kali.org/tools/binwalk/)
- [gdb](https://www.kali.org/tools/gdb/)
- [gef](https://github.com/hugsy/gef)
- [ghidra](https://www.kali.org/tools/ghidra/)
- [imhex](https://www.kali.org/tools/imhex/)
- [jadx](https://www.kali.org/tools/jadx/)
- [jd-gui](https://www.kali.org/tools/jd-gui/)
- [ltrace](https://man7.org/linux/man-pages/man1/ltrace.1.html)
- [pwntools](https://docs.pwntools.com/en/stable/)
- [rizin-cutter](https://www.kali.org/tools/rizin-cutter/)
- [rz-ghidra](https://www.kali.org/tools/rz-ghidra/)
- [strace](https://man7.org/linux/man-pages/man1/strace.1.html)

## Build Container Image

- Run `make build` to create Kali container image. The image `$USER/kali` will take ~8GB of space once built. `make build+reversing` for building Kali container image with reversing tools.
- Run `make deploy` to setup a symbolic link from `run.sh` to the `/usr/local/bin/kali-here`.

## Usage

```bash
# puts you in the Kali container
# current directory is the workdir of the container
./run.sh
# or
kali-here

# attach to an already running container
docker exec -it $(docker ps | grep kali:latest | awk '{print $NF}') zsh
```

## Reference

- [Kali Tools](https://www.kali.org/tools/)
