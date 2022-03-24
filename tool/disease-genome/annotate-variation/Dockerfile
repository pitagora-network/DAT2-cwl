FROM ubuntu:20.04

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/disease-genome/annotate-variation/Dockerfile"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="Apache2.0"

USER root

RUN apt update && \
    apt install -y \
    build-essential \
    cpanminus \
    curl \
    perl && \
    rm -rf /var/lib/apt/lists/*

RUN cpanm Pod::Usage && \
    cpanm Net::FTP && \
    cpanm LWP::UserAgent

WORKDIR /workdir

RUN curl -fsSL -O http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz && \
    tar -xzf annovar.latest.tar.gz && \
    rm -rf annovar.latest.tar.gz

ENV PATH $PATH:/workdir/annovar
