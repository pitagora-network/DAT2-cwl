#target2gene.txtを作成

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
#BiocManager::install("biomaRt", version = "3.8")
BiocManager::install("biomaRt")

install.packages("dplyr")

# 下記コマンドで対象種のDataset名を確認する
ensembl = biomaRt::useEnsembl(biomart="ensembl")
#biomaRt::listDatasets(ensembl)

# 遺伝子IDと遺伝子名の対応情報を取得
mart <- biomaRt::useMart(biomart = "ENSEMBL_MART_ENSEMBL", dataset = "hsapiens_gene_ensembl", host = 'ensembl.org')
t2g <- biomaRt::getBM(attributes = c("ensembl_transcript_id", "ensembl_gene_id", "external_gene_name"), mart = mart)
t2g <- dplyr::rename(t2g, target_id = ensembl_transcript_id, ens_gene = ensembl_gene_id, ext_gene = external_gene_name)
# 内容を確認する
head(t2g)
# 保存する
write.table(t2g, "target2gene.txt", sep="\t",quote=F,row.names=F)

# Rを終了する
q()
