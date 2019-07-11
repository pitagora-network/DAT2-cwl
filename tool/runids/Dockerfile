FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY runids.sh /workdir
RUN chmod 777 runids.sh

ENV PATH $PATH:/workdir
