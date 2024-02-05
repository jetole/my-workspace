#!/bin/bash

# Install packages from apt
apt-get update
grep -v '^#' apt-packages | xargs apt-get install -y
apt-get clean

# Install oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git /opt/oh-my-zsh

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
