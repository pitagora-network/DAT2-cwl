FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY deseq2_isoform.R /workdir
RUN chmod 777 deseq2_isoform.R

RUN Rscript -e 'BiocManager::install("DESeq2"); \
     BiocManager::install("tximport")'

ENV PATH $PATH:/workdir
