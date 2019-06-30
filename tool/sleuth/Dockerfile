FROM r-base

RUN apt-get update \
     && apt-get install -y libmysqlclient-dev libxml2-dev libcurl4-gnutls-dev libssl-dev

RUN R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "BiocManager::install('rhdf5')"

RUN R -e "install.packages('devtools',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github("pachterlab/sleuth")"

RUN mkdir test_output
RUN mkdir file

COPY sleuth.R  /test_output/sleuth.R
COPY sample.txt  /file/sample.txt
COPY target2gene.txt  /file/target2gene.txt
COPY SRR1550989/ /file/SRR1550989/
COPY SRR1551091/ /file/SRR1551091/

#COPY test/test.R  /test_output/test.R

RUN R -f /test_output/sleuth.R
