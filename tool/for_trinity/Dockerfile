FROM perl:latest
USER root

WORKDIR /workdir
RUN curl -O https://raw.githubusercontent.com/bonohu/denovoTA/master/for_trinity.pl 

COPY for_trinity.sh /workdir
RUN chmod 777 for_trinity.sh

ENV PATH $PATH:/workdir