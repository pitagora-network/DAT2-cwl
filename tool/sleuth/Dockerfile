FROM bioconductor/release_base2:R3.5.0_Bioc3.7
MAINTAINER kyamada <inaeva7691@gmail.com>

RUN R -e 'source("http://bioconductor.org/biocLite.R"); \
biocLite("devtools", ask=F); \
biocLite("getopt", ask=F); \
biocLite("remotes", ask=F); \
biocLite("pachterlab/sleuth", ask=F); \
biocLite("grimbough/biomaRt", ask=F)'

RUN mkdir /data
