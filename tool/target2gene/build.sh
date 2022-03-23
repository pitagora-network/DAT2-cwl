#!/bin/sh
set -eux
cd .

#wget https://raw.githubusercontent.com/bonohu/denovoTA/main/for_trinity.pl
docker image build -t dat2-cwl/target2gene .
