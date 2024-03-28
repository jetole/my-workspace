#!/bin/bash

# Install packages from apt
apt-get update
grep -v '^#' /tmp/apt-packages.txt | xargs apt-get install -y


# Install oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git /opt/zsh/oh-my-zsh

# Set up oh-my-zsh
mkdir -p /opt/zsh/oh-my-zsh-custom/{plugins,themes}

# install ZSH custom plugins
(
  cd /opt/zsh/oh-my-zsh-custom/plugins || exit 1
  git clone https://github.com/popstas/zsh-command-time.git command-time/
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
)

# Create links to host apps
ln -fs "/usr/bin/distrobox-host-exec" "/usr/local/bin/${x}"

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
