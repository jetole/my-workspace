FROM docker.io/debian:bookworm

COPY container-files/setup-files /tmp/setup-files
COPY container-files/system-files /opt/system-files

RUN /tmp/setup-files/setup-container.sh

ENTRYPOINT ["/entrypoint.sh"]
