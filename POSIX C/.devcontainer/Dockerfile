FROM ubuntu:latest

RUN apt update

# Install gcc
RUN apt install -y build-essential

# Install manpages
RUN echo "y" | unminimize
RUN apt install -y man-db manpages-posix manpages-dev manpages-posix-dev

RUN apt install -y wget curl unzip git sudo nano

RUN useradd -rm -d /home/developer -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 developer)" developer

USER developer

WORKDIR /home/developer/workspace
