FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY sleuth.R /workdir
RUN chmod 777 sleuth.R

RUN chmod 0777 /usr/local/lib/R/site-library
RUN sh -c 'echo "deb http://cloud.r-project.org/bin/linux/debian stretch-cran35/" >> /etc/apt/sources.list'
RUN apt-get -y build-dep libcurl4-gnutls-dev \
 && apt-get -y install libcurl4-gnutls-dev

#RUN Rscript -e 'BiocManager::install("rhdf5")'
RUN Rscript -e 'install.packages('devtools')'
#RUN Rscript -e 'devtools::install_github('pachterlab/sleuth')'
