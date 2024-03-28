#!/bin/bash

# Install packages from apt
apt-get update
grep -v '^#' /tmp/apt-packages.txt | xargs apt-get install -y

# Install package from pipx
grep -v '^#' /tmp/pipx-packages.txt | xargs pipx install -y

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

# install starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Create links to host apps
for x in \
  podman
do
  ln -fs "/usr/bin/distrobox-host-exec" "/usr/local/bin/${x}"
done

# Install PyEnv
git clone https://github.com/pyenv/pyenv.git /opt/pyenv

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

# Install tfenv
git clone --depth=1 https://github.com/tfutils/tfenv.git /opt/tfenv
echo latest > /opt/tfenv/version
ln -s /opt/tfenv/bin/* /usr/local/bin/

# Install tgenv
git clone https://github.com/cunymatthieu/tgenv.git /opt/tgenv
ln -s /opt/tgenv/bin/* /usr/local/bin/
