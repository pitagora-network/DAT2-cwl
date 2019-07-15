FROM ubuntu:latest
USER root

RUN apt-get update && apt-get install -y wget

WORKDIR /workdir

COPY sample2condition.sh /workdir
RUN chmod 777 sample2condition.sh

ENV PATH $PATH:/workdir
