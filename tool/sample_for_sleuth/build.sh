#!/bin/sh
set -eux
cd .

docker build -t dat2-cwl/sample_for_sleuth .
