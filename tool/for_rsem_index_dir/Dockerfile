FROM ubuntu:latest
USER root

WORKDIR /workdir

COPY for_rsem_index_dir.sh /workdir

RUN chmod 777 for_rsem_index_dir.sh

ENV PATH $PATH:/workdir
