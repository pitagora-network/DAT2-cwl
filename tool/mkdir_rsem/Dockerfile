FROM ubuntu:20.04

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/mkdir_rsem/Dockerfile"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="Apache2.0"

USER root

WORKDIR /workdir

COPY mkdir_rsem.sh /workdir
RUN chmod 777 /workdir/mkdir_rsem.sh

ENV PATH $PATH:/workdir
