#!/bin/sh

# まずはヘッダーを作成
echo 'sample\tgroup\tpath' > sample2condition.txt
# サンプル名はRun、群はdiseasestatusの項目、パスはSRR IDに.genes.resultsを足したものなので、それらを記述したファイルを作成する。
tail -n+2 $1 | awk 'BEGIN{FS="\t";OFS="\t"}{print $7,$14,$7".isoforms.results"}' >> sample2condition.txt
