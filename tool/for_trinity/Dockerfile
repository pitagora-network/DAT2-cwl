FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY --chmod=0777 for_trinity.pl /workdir
COPY --chmod=0777 for_trinity.sh /workdir

ENV PATH $PATH:/workdir