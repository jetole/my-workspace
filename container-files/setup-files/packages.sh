#!/bin/bash

# Install packages from apt
apt-get update
grep -v '^#' /tmp/setup-files/apt-packages.txt | xargs apt-get install -y

# Create links to host apps
ln -fs "/usr/bin/distrobox-host-exec" "/usr/local/bin/${x}"

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
