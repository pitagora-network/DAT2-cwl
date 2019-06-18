#!/bin/sh
set -eux

mkdir blastdb
cd blastdb
makeblastdb -in ${1} -out trinity_rslt -dbtype prot -hash_index -parse_seqids