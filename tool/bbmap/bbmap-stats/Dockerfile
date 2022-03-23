FROM openjdk:12.0.1-jdk-oraclelinux7
ENV VERSION=38.43
RUN cd / && \
  curl -o BBMap_${VERSION}.tar.gz -L https://sourceforge.net/projects/bbmap/files/BBMap_${VERSION}.tar.gz/download && \
  tar zxf BBMap_${VERSION}.tar.gz
WORKDIR /workdir
CMD ["bash"]
