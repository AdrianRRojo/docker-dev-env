### BASE IMAGE ###
FROM ubuntu:24.04 AS base

WORKDIR /arojo-dev

### SETUP ###
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    cmake \
    gnupg \
    git \
    libboost-all-dev \
    libgtest-dev \
    libssl-dev \
    pkg-config \
    python3-dev \
    python3-pip \
    software-properties-common \
    wget \
    openssh-server

# Configure OpenSSH
RUN mkdir /var/run/sshd && echo 'root:root' | chpasswd
EXPOSE 22
