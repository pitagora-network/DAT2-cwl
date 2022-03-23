#!/bin/sh
set -eux
cd .

wget https://raw.githubusercontent.com/bonohu/denovoTA/main/for_trinity.pl 
docker build -t dat2-cwl/for_trinity .
