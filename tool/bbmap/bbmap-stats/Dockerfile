FROM openjdk:12.0.1-jdk-oraclelinux7

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/bbmap/bbmap-stats/Dockerfile"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="Apache2.0"

ENV VERSION=38.43
RUN cd / && \
  curl -o BBMap_${VERSION}.tar.gz -L https://sourceforge.net/projects/bbmap/files/BBMap_${VERSION}.tar.gz/download && \
  tar zxf BBMap_${VERSION}.tar.gz
WORKDIR /workdir
CMD ["bash"]
