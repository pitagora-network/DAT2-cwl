FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY sleuth.R /workdir
RUN chmod 777 sleuth.R

RUN Rscript -e 'BiocManager::install("rhdf5"); \
     install.packages(c("devtools", "gridExtra")); \
     devtools::install_github("pachterlab/sleuth")'

ENV PATH $PATH:/workdir
