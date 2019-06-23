source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
install.packages("devtools")
devtools::install_github("pachterlab/sleuth")
# sleuthパッケージを読み込む
library("sleuth")

# サンプル情報を読み込む
s2c <- read.table("sample.txt", header=T, stringsAsFactors=F, sep="\t")
s2c$condition <- gsub(" ","_",s2c$condition)

# 遺伝子IDと遺伝子名の対応表を読み込む
t2g <- read.table("../ref/target2gene.txt", header=T, stringsAsFactors=F)

# kallisto の出力ファイルを読み込む
so <- sleuth_prep(s2c, extra_bootstrap_summary=T, target_mapping=t2g)
# 遺伝子レベルで解析する場合は以下
so <- sleuth_prep(s2c, extra_bootstrap_summary=T, target_mapping=t2g, aggregation_column='ens_gene', gene_mode=T)

# 遺伝子IDに対応する遺伝子名を付与する
kallisto.df <- kallisto_table(so)
kallisto.df$target_id2 <- sub("\\\..*","",kallisto.df$target_id)
kallisto.df <- merge(kalisto.df,t2g, by.x="target_id2", by.y="target_id")

# 今回は使わないが、この表は別の解析などにも活用できるので保存しておく
write.table(kallisto.df, "kallisto_res.txt", row.names=F, quote=F)


#まずは尤度比検定
so <- sleuth_fit(so, ~condition, 'full')

LRT <- sleuth_fit(so, ~1, 'reduced')
LRT <- sleuth_lrt(LRT, 'reduced', 'full')
LRT_table <- sleuth_results(LRT, 'reduced:full', 'lrt', show_all=F)

# p値の低い順に並べ替えるには以下のコマンドを実行する
LRT_table <- LRT_table[order(LRT_table$pval),]

# 結果を保存する
write.table(LRT_table, "LRT_res.sorted.txt", row.names=F, quote=F, sep="\t")

#発現量をボックスプロットおよびヒートマップで図示する
library(ggplot2)
p <- plot_bootstrap(LRT, "ENST00000503567.5", units="est_counts", color_by="condition")

# 図を保存する
ggplot2::ggsave("ENST00000503567.5.png", p)
ggplot2::ggsave("ENST00000503567.5.pdf", p)

# 作図に使われているデータは下記で抜き出すことができる
data <- as.data.frame(LRT$bs_quants)

# ヒートマップ
# p値の低い20遺伝子で作図する（上記のコマンドでp値の低い順に並べ替えてあるので、上から順に20個の遺伝子IDを指定する）
transcripts <- LRT_table$target_id[1:20]
plot_transcript_heatmap(LRT, transcripts, units="tpm")
# 上記コマンドでヒートマップが表示されない場合は dev.off() を入力したのち、下記コマンドでファイルに出力する

# ヒートマップはgtableオブジェクトのためggsave()は使えず、直接書き出す必要がある

pdf('heatmap.pdf')
plot_transcript_heatmap(LRT, transcripts, units="tpm")
dev.off()

# ヒートマップ作図用のデータはkallisto.dfにも含まれている

#Wald検定
WT <- sleuth_wt(so, ‘conditionType_1_Diabetes’)
WT_table <- sleuth_results(WT, ‘conditionType_1_Diabetes’)
# q値の小さい順に並べ替える
WT_table <- WT_table[order(WT_table$qval),]
write.table(WT_table, “WT_res.sorted.txt”, row.names=F, quote=F, sep=”¥t)

#Wald検定の結果をvolcano plotで図示する。デフォルト設定ではq値が0.1を下回る転写産物が赤いプロットで示される。
p3 <- plot_volcano(WT, ‘conditionType_1_Diabetes’, ‘wt’)
ggsave(“volcanoplot.png”, p3)
# volcano plot 作図用のデータは WT_table にも含まれているので、ggplot などを使って自分で作図することができる
