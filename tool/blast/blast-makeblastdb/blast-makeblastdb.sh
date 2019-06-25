#!/bin/sh
set -eux

mkdir blastdb_${2}
cd blastdb_${2}
makeblastdb -in ${1} -out ${2} -dbtype prot -hash_index -parse_seqids