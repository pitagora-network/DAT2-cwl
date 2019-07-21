#! /bin/sh
set -eux
cd .

docker image build -t dat2-cwl/sleuth_isoform .
