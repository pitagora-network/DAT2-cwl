#!/bin/sh
set -eux
cd .

docker build -t dat2-cwl/sample2condition_gene .
