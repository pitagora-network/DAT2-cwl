#!/bin/sh
set -eux
cd $(dirname $0)
docker build -t dat2-cwl/sort-bed .
