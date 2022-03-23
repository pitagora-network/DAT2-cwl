FROM alpine:3.9

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/disease-genome/sort-bed/Dockerfile"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="Apache2.0"

USER root
RUN apk --no-cache add ruby
WORKDIR /workdir
COPY sort-bed.rb /usr/bin
RUN chmod 777 /usr/bin/sort-bed.rb