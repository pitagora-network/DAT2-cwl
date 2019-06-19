FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY for_trinity.pl /workdir
COPY for_trinity.sh /workdir
RUN chmod 777 for_trinity.sh

ENV PATH $PATH:/workdir