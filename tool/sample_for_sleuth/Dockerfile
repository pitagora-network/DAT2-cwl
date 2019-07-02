FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY sample_for_sleuth.sh /workdir
RUN chmod 777 sample_for_sleuth.sh

ENV PATH $PATH:/workdir
#RUN mkdir output
