FROM perl
USER root
RUN apt-get update && apt-get install -y --no-install-recommends gcc libc6-dev
RUN yes '' | cpan -i Net::FTP LWP::UserAgent
RUN apt-get purge -y gcc libc6-dev && apt-get autoremove -y

WORKDIR /workdir
COPY annotate_variation.pl /usr/bin
