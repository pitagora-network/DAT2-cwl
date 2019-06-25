#!/bin/sh
set -eux
cd .

#wget https://raw.githubusercontent.com/bonohu/denovoTA/master/for_trinity.pl
docker image build -t dat2-cwl/target2gene .
#コンテナを起動
docker container run --name target2gene -itd dat2-cwl/target2gene

docker container cp target2gene:target2gene.txt .
