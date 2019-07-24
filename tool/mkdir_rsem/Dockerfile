FROM ubuntu:latest
USER root

WORKDIR /workdir

COPY mkdir_rsem.sh /workdir

RUN chmod 777 mkdir_rsem.sh

ENV PATH $PATH:/workdir
