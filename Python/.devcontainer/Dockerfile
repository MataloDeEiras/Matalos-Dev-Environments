FROM ubuntu:latest

ARG PYTHONVER="10"
ARG USER="developer"

RUN apt update
RUN apt upgrade -y

# Install gcc
RUN apt install -y build-essential

# Install Python
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3.${PYTHONVER} python3.${PYTHONVER}-venv python3.${PYTHONVER}-tk python3.${PYTHONVER}-dev

# Path correct Python version
RUN cd /usr/bin && unlink python3
RUN cd /usr/bin && ln -s /usr/bin/python3.${PYTHONVER} python3

RUN apt install -y wget curl unzip git sudo nano

# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 ${USER})" ${USER}

USER ${USER}

WORKDIR /home/${USER}/workspace

COPY .. .

# Give permissions to current user
RUN echo "${USER}\n" | sudo -k -S chown -R "${USER:-$(id -un)}" .

# Fix to run scripts
RUN chmod +x .devcontainer/postCreateCommand.bash
RUN echo "${USER}\n" | sudo -k -S sed -i -e 's/\r$//' .devcontainer/postCreateCommand.bash
