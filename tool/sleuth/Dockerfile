FROM r-base

RUN apt-get update \
     && apt-get install -y libmysqlclient-dev libxml2-dev libcurl4-gnutls-dev libssl-dev

RUN mkdir test_output
RUN mkdir file

COPY sleuth.R  /test_output/sleuth.R
COPY sample.txt  /file/sample.txt
COPY target2gene.txt  /file/target2gene.txt

#COPY test/test.R  /test_output/test.R

RUN R -f /test_output/sleuth.R
