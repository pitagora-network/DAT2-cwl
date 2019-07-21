FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY sleuth_gene.R /workdir
RUN chmod 777 sleuth_gene.R

RUN Rscript -e 'BiocManager::install("rhdf5"); \
     install.packages(c("devtools", "gridExtra")); \
     devtools::install_github("pachterlab/sleuth")'

ENV PATH $PATH:/workdir
