FROM ubuntu:latest
USER root

WORKDIR /workdir

COPY for_trinity.sh /workdir
RUN chmod 777 for_trinity.sh

ENV PATH $PATH:/workdir