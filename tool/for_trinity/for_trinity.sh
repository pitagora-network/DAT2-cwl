#!/bin/sh
set -eux

IN1=$1
IN2=$2
SRR=`echo ${IN1} | grep -o ".RR[0-9]*"`
OUT1=${SRR}_1.fq.gz
OUT2=${SRR}_2.fq.gz

gzip -cd ${IN1} | perl for_trinity.pl 1 | gzip -c > ${OUT1}
gzip -cd ${IN2} | perl for_trinity.pl 2 | gzip -c > ${OUT2}