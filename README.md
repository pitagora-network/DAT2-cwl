# DAT2-CWL

This repository contains the Common Workflow Language (CWL) definitions of the workflows introduced in the book [#NGS_DAT 2nd edition (A tutorial book in Japanese, 次世代シークエンサーDRY解析教本 改訂第2版)](https://www.amazon.co.jp/dp/478090983X).

## Workflow test status

- [Animal genome assembly](workflow/animal_genome_assembly) by [inutano](https://github.com/inutano)
  - [ ] WIP
- [Bacteria genome](workflow/backteria_genome) by [suecharo](https://github.com/suecharo)
  - [x] bacteria_genome
- [Disease genome](workflow/disease-genome) by [tom-tan](https://github.com/tom-tan)
  - [ ] WIP
- [Epigenome: Bisulfite-Seq](workflow/epigenome-BS-seq) by [manabu](https://github.com/manabu)
  - [x] download_rawdata
  - [x] download_reference_fasta
  - [x] bismark_genome_preparation_workflow
  - [x] epigenome-BS-seq
  - [x] fastqc-workflow
- [Epigenome: ChIP-Seq](workflow/epigenome-chip-seq) by [suecharo](https://github.com/suecharo)
  - [ ] WIP
- [Meta 16S-Seq](workflow/meta16s-seq) by [inutano](https://github.com/inutano)
  - [x] meta16s-seq.demo
- [RNA-seq](workflow/RNA-seq) by [yamada](https://github.com/yamada)
  - [x] rnaseq-1sample-kallisto-pe
  - [x] rnaseq-1sample-star-rsem-pe
  - [ ] rnaseq-deseq2_gene
  - [x] rnaseq-kallisto-pe
  - [x] rnaseq-kallisto-sleuth
  - [x] rnaseq-sleuth_isoform
  - [x] rnaseq-star_index
  - [x] rnaseq-star-rsem-deseq2
  - [x] rnaseq-star-rsem-tar-pe
  - [ ] rnaseq-star-rsem-pe
- [Transcriptome assembly](workflow/transcriptome_assemble) by [yasumizu](https://github.com/yasumizu)
  - [x] transcriptome_assemble
