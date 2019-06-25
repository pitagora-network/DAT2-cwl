FROM quay.io/biocontainers/blast:2.9.0--pl526h979a64d_4
USER root

WORKDIR /workdir

COPY blast-makeblastdb.sh /workdir

ENV PATH $PATH:/workdir