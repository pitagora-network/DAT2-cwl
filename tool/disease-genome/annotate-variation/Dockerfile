FROM perl:5.34.1-slim-buster

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/disease-genome/annotate-variation/Dockerfile"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="Apache2.0"

USER root
RUN apt-get update && apt-get install -y --no-install-recommends gcc libc6-dev
RUN yes '' | cpan -i Net::FTP LWP::UserAgent
RUN apt-get purge -y gcc libc6-dev && apt-get autoremove -y

WORKDIR /workdir
COPY annotate_variation.pl /usr/bin
RUN chmod 777 /usr/bin/annotate_variation.pl
