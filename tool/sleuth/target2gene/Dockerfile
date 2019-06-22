FROM r-base

RUN apt-get update \
     && apt-get install -y libmysqlclient-dev libxml2-dev libcurl4-gnutls-dev libssl-dev

RUN mkdir test_output
COPY target2gene.R  /test_output/target2gene.R
#COPY test/test.R  /test_output/test.R

RUN R -f /test_output/target2gene.R
