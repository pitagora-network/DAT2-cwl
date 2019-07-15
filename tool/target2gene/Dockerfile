FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY target2gene.R /workdir
#COPY target2gene.R .
RUN chmod 777 target2gene.R
RUN Rscript -e 'BiocManager::install("biomaRt")'

ENV PATH $PATH:/workdir
