#!/bin/sh

set -eux

# SraRunTable.txtの５項目目のサンプル名と12項目目にあるコンディション情報を抜き出す
echo "sample\tcondition\tpath" > sample.txt
tail -n+2 $1 | awk 'BEGIN{FS="\t";OFS="\t"}{print $7,$14,$7}' >> sample.txt
