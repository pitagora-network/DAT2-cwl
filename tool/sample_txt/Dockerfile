FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY --chmod=0777 sample_txt.sh /workdir

ENV PATH $PATH:/workdir
