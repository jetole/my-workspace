FROM quay.io/toolbx-images/debian-toolbox:unstable

RUN apt-get update && \
    apt-get install -y \
      podman \
      podman-compose \
      podman-docker \
      podman-remote \
      podman-toolbox \
      openssh-client \
      git \
      git-man \
      neovim \
      htop \
      nmap \
      hping3 \
      bat \
      autossh \
      curl \
      wget \
      gnome-keyring \
      jq \
      mount \
      zsh \
      tmux && \
    apt-get clean
