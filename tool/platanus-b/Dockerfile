FROM ubuntu:20.04

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/platanus-b/Dockerfile"
LABEL org.opencontainers.image.version="1.3.2"
LABEL org.opencontainers.image.licenses="Apache2.0"

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    curl \
    build-essential \
    zlib1g-dev && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN curl -fsSL -o Platanus_B_v1.3.2.tgz http://platanus.bio.titech.ac.jp/?ddownload=448 && \
    tar -xf ./Platanus_B_v1.3.2.tgz && \
    rm -rf ./Platanus_B_v1.3.2.tgz && \
    mv ./Platanus_B_v1.3.2 ./Platanus_B && \
    cd ./Platanus_B && \
    make && \
    chmod +x ./platanus_b && \
    ln -s /opt/Platanus_B/platanus_b /usr/local/bin/platanus_b && \
    find /opt/Platanus_B/sub_bin -type f -name *.pl -exec chmod +x {} \;

WORKDIR /workdir

CMD [ "platanus_b" ]
