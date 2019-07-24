FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY sample_txt.sh /workdir
RUN chmod 777 sample_txt.sh

ENV PATH $PATH:/workdir
#RUN mkdir output
