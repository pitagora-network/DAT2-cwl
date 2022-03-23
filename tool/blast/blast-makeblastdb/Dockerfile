FROM ncbi/blast
USER root

WORKDIR /workdir

COPY --chmod=0777 blast-makeblastdb.sh /workdir

ENV PATH $PATH:/workdir
