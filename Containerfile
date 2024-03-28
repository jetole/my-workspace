FROM docker.io/debian:sid as packages

COPY packages.sh /tmp/install.sh
COPY apt-packages.txt /tmp/apt-packages.txt

RUN /tmp/install.sh && \
    rm -fv /tmp/install.sh /tmp/apt-packages.txt && \
    apt-get clean -y

FROM packages as config

COPY image-files/zshrc /opt/zsh/zdotdir/.zshrc
COPY image-files/starship.toml /etc/starship.toml
COPY image-files/dircolors.256dark /opt/dircolors.256dark
COPY image-files/tmux.conf /opt/tmux.conf

COPY config.sh /tmp/config.sh
RUN /tmp/config.sh && rm -fv

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
