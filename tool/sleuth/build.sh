#!/bin/sh
set -eux
cd .

wget https://raw.githubusercontent.com/bonohu/denovoTA/master/for_trinity.pl
docker image build -t dat2-cwl/sleuthe .
