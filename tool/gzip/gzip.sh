#!/bin/sh
# doc
set -eux
input_1=${1}  # file_path
# script here

cat ${input_1} |  gzip -c > ${input_1}.gz