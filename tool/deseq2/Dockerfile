FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY --chmod=0777 deseq2.R /workdir

RUN Rscript -e 'BiocManager::install("DESeq2"); \
     BiocManager::install("tximport")'

ENV PATH $PATH:/workdir
