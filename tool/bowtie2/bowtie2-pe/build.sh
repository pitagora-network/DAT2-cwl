#!/bin/sh
set -eux
cd .
docker build -t dat2-cwl/bowtie2-pe .
