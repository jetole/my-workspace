FROM docker.io/debian:bookworm

COPY build-files /tmp/build-files
COPY system-files /opt/container-toolbox

RUN /tmp/build-files/setup.sh

ENTRYPOINT ["/entrypoint.sh"]
