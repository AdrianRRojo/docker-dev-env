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
    unzip \
    openssh-server

### Configure OpenSSH ###
RUN mkdir /var/run/sshd && echo 'root:root' | chpasswd
EXPOSE 22

### GO ###
RUN wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin


### USING NVIM BTW ###
# RUN wget https://github.com/neovim/neovim-releases/releases/download/v0.10.4/nvim-linux-x86_64.appimage
RUN apt-get install -y neovim

ENV XDG_CONFIG_HOME /config
RUN mkdir -p /config/nvim

RUN apt install zsh -y
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

### KICKSTART NVIM ###
RUN git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

CMD ["/bin/zsh"]