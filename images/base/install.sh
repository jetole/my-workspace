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
  rpm-ostree
do
  ln -fs "/usr/bin/distrobox-host-exec" "/usr/local/bin/${x}"
done


# Insall AWS CLI
(
  cd /tmp
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ./aws/install
  rm -fv awscliv2.zip aws
)

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
  tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
  apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update
apt-get install -y google-cloud-cli

# Install vscode
(
  cd "$(mktemp -d)" || true
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor > packages.microsoft.gpg
  install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
  rm -fv packages.microsoft.gpg
  apt-get install -y code
)
