FROM bioconductor/release_base2:R3.6.0_Bioc3.9

WORKDIR /workdir

COPY target2gene.R /workdir
#COPY target2gene.R .
RUN chmod 777 target2gene.R
RUN chmod 0777 /usr/local/lib/R/site-library
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
   libfftw3-dev \
   gcc && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN Rscript -e 'BiocManager::install("biomaRt")'

ENV PATH $PATH:/workdir
