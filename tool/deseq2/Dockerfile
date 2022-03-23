FROM bioconductor/release_base2:R3.6.0_Bioc3.9

LABEL org.opencontainers.image.authors="DAT2-cwl contributers <https://github.com/pitagora-network/DAT2-cwl/graphs/contributors>"
LABEL org.opencontainers.image.url="https://github.com/pitagora-network/DAT2-cwl"
LABEL org.opencontainers.image.source="https://github.com/pitagora-network/DAT2-cwl/blob/main/tool/deseq2/Dockerfile"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="Apache2.0"

WORKDIR /workdir

COPY deseq2.R /workdir
RUN chmod 777 /workdir/deseq2.R

RUN Rscript -e 'BiocManager::install("DESeq2"); \
     BiocManager::install("tximport")'

ENV PATH $PATH:/workdir
