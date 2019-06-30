FROM bioconductor/release_base2:R3.6.0_Bioc3.9

RUN R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.rstudio.com/'); \
          BiocManager::install('rhdf5'); \
          install.packages('devtools',dependencies=TRUE, repos='http://cran.rstudio.com/'); \
          devtools::install_github('pachterlab/sleuth')"

WORKDIR /workdir
RUN mkdir output
