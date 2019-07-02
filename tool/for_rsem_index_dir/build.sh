#! /bin/sh
set -eux
cd .

docker build -t dat2-cwl/for_rsem_index_dir .
