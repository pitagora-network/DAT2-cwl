FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY sleuth.R /workdir
RUN chmod 777 sleuth.R

RUN chmod 0777 /usr/local/lib/R/site-library

RUN mkdir output
