FROM ubuntu:latest

ARG USER="developer"

RUN apt update
RUN apt upgrade -y

# Install gcc
RUN apt install -y build-essential

# Install manpages
RUN yes | unminimize
RUN apt install -y man-db manpages-posix manpages-dev manpages-posix-dev

RUN apt install -y wget curl unzip git sudo nano

RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 ${USER})" ${USER}

USER ${USER}

WORKDIR /home/${USER}/workspace

COPY .. .

# Give permissions to current user
RUN echo "${USER}\n" | sudo -k -S chown -R "${USER:-$(id -un)}" .

# Fix to run scripts
RUN chmod +x .devcontainer/postCreateCommand.bash
RUN echo "${USER}\n" | sudo -k -S sed -i -e 's/\r$//' .devcontainer/postCreateCommand.bash
