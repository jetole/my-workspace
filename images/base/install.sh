#!/bin/bash

# Install packages from apt
apt-get update
grep -v '^#' /tmp/apt-packages.txt | xargs apt-get install -y
apt-get clean

# Install oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git /opt/oh-my-zsh

# Install oh-my-zsh plugins
git clone https://github.com/popstas/zsh-command-time.git /opt/oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-autosuggestions.git /opt/oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /opt/oh-my-zsh/custom/plugins/command-time

# install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Create links to host apps
for x in \
  podman \
  flatpak \
  rpm-ostree \
  sysctl \
  swapon \
  swapoff \
  sync
do
  ln -fs "/usr/bin/distrobox-host-exec" "/usr/local/bin/${x}"
done
