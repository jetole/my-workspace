FROM docker.io/debian:bookworm

COPY build-files /tmp/build-files
COPY system-files /opt/system-files

RUN /tmp/build-files/setup.sh

ENTRYPOINT ["/entrypoint.sh"]
