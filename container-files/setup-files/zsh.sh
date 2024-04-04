#!/bin/bash

# zdotdir="/opt/zsh"

# echo "ZDOTDIR=${zdotdir}" | tee -a "/etc/zsh/zshenv"
# # shellcheck disable=SC2016
# echo 'sudo chown -R $(id -u):$(id -g) /opt/*' | tee -a "/etc/zsh/zshenv"

# mkdir -p "$zdotdir"
# cp -v "/opt/system-files/zshrc" "${zdotdir}/.zshrc"

# # Install oh-my-zsh
# git clone https://github.com/ohmyzsh/ohmyzsh.git /opt/zsh/oh-my-zsh

# # Set up oh-my-zsh
# mkdir -p "${zdotdir}/oh-my-zsh-custom/"{plugins,themes}

# # install ZSH custom plugins
# (
#   cd "${zdotdir}/oh-my-zsh-custom/plugins" || exit 1
#   git clone https://github.com/popstas/zsh-command-time.git command-time/
#   git clone https://github.com/zsh-users/zsh-autosuggestions.git
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# )
