# Solution to make xrdp work:
# https://dev.to/darksmile92/linux-on-windows-wsl-with-desktop-environment-via-rdp-522g#comment-obea

FROM ubuntu:latest

RUN apt update

# Install gcc
RUN apt install -y build-essential

ARG PYTHONVER="13"

# Install Python
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3.${PYTHONVER} python3.${PYTHONVER}-venv python3.${PYTHONVER}-tk python3.${PYTHONVER}-dev

# Path correct Python version
RUN cd /usr/bin && unlink python3
RUN cd /usr/bin && ln -s /usr/bin/python3.${PYTHONVER} python3

# Install xrdp and xfce4
RUN apt install -y xrdp xfce4 xfce4-goodies

RUN apt install -y wget curl unzip git sudo nano

# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

RUN useradd -rm -d /home/developer -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 developer)" developer

# xrdp and xfce4 setup
RUN cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
RUN sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
RUN sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
RUN cd /home/developer && echo xfce4-session > .xsession
RUN sed -i "s|test -x /etc/X11/Xsession && exec /etc/X11/Xsession||g" /etc/xrdp/startwm.sh
RUN sed -i "s|exec /bin/sh /etc/X11/Xsession||g" /etc/xrdp/startwm.sh
RUN echo "startxfce4" >> /etc/xrdp/startwm.sh

USER developer

WORKDIR /home/developer/workspace
