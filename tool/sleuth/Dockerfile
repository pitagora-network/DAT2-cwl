FROM r-base

RUN apt-get update \
     && apt-get install -y libmysqlclient-dev libxml2-dev libcurl4-gnutls-dev libssl-dev

COPY dependencies.R /tmp/dependencies.R
RUN R -f /tmp/dependencies.R
