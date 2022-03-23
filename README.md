# DAT2-CWL

This repository contains the Common Workflow Language (CWL) definitions of the workflows introduced in the book [#NGS_DAT 2nd edition (A tutorial book in Japanese, 次世代シークエンサー DRY 解析教本 改訂第 2 版)](https://www.amazon.co.jp/dp/478090983X).

## Workflows

This repository provides workflows of the Level 2 section of the NGS_DAT 2nd edition.

- [`disease-genome`](./workflow/disease-genome)
  - `疾患ゲノム解析`
  - by [@tom-tan](https://github.com/tom-tan)
- [`rna-seq`](./workflow/rna-seq)
  - `発現解析`
  - by [@ykohki](https://github.com/ykohki)
- [`epigenome-chip-seq`](./workflow/epigenome-chip-seq)
  - `エピゲノム解析 (ChIP-seq)`
  - by [@suecharo](https://github.com/suecharo)
- [`epigenome-bs-seq`](./workflow/epigenome-bs-seq)
  - `エピゲノム解析 (BS-seq)`
  - by [@manabuishii](https://github.com/manabuishii)
- [`meta16s-seq`](./workflow/meta16s-seq)
  - `メタゲノム解析`
  - by [@inutano](https://github.com/inutano)
- [`bacteria-genome`](./workflow/bacteria-genome)
  - `バクテリアゲノム解析`
  - by [suecharo](https://github.com/suecharo)
- [`animal-genome-assembly`](./workflow/animal-genome-assembly)
  - `動物ゲノムアセンブリ`
  - by [inutano](https://github.com/inutano)
- [`transcriptome-assembly`](./workflow/transcriptome-assembly)
  - `トランスクリプトームアセンブル解析`
  - by [yyoshiaki](https://github.com/yyoshiaki)

## Learn how to run CWL

There are many online documents to learn about CWL out there:

- [The official website](https://www.commonwl.org/)
- [Getting started](https://www.commonwl.org/user_guide/)
- [Getting started in Japanese](https://github.com/pitagora-galaxy/cwl/wiki/CWL-Start-Guide-JP)
- [The workflow meetup Tokyo/Osaka](https://github.com/manabuishii/workflow-meetup/wiki/20180418)
  - Slack workspace and invitation code is on the website
- [Pitagora Network](https://pitagora-network.org/)
  - a monthly meetup in Tokyo for bioinformatics workflow users and developers

## Testing

All workflows introduced in the book has been translated in CWL, but yet the testing is ongoing.

- [Animal genome assembly](workflow/animal_genome_assembly) by [inutano](https://github.com/inutano)
  - [ ] WIP
- [Bacteria genome](workflow/bacteria_genome) by [suecharo](https://github.com/suecharo)
  - [x] bacteria_genome
- [Disease genome](workflow/disease-genome) by [tom-tan](https://github.com/tom-tan)
  - [ ] WIP
- [Epigenome: Bisulfite-Seq](workflow/epigenome-BS-seq) by [manabuishii](https://github.com/manabuishii)
  - [x] download_rawdata
  - [x] download_reference_fasta
  - [x] bismark_genome_preparation_workflow
  - [x] epigenome-BS-seq
  - [x] fastqc-workflow
- [Epigenome: ChIP-Seq](workflow/epigenome-chip-seq) by [suecharo](https://github.com/suecharo)
  - [ ] WIP
- [Meta 16S-Seq](workflow/meta16s-seq) by [inutano](https://github.com/inutano)
  - [x] meta16s-seq.demo
- [RNA-seq](workflow/RNA-seq) by [ykohki](https://github.com/ykohki)
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
- [Transcriptome assembly](workflow/transcriptome_assemble) by [yyoshiaki](https://github.com/yyoshiaki)
  - [x] transcriptome_assemble

## Erratum

p.333 に記載のある URL `https://tinyurl.com/dat2_cwl_example` がアクセス不能となっています。すみません。

こちらで指定すべきコマンドと URL はこちらです。(コピペする場合は `$` は除いてください)

```
$ cwltool https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/main/workflow/meta16s-seq/meta16s-seq.demo.cwl
```

## Troubleshooting

Please create an issue on [github issue](https://github.com/pitagora-network/DAT2-cwl/issues) if you have any trouble with the workflows.
For questions to Common Workflow Language, please go to [discourse group](https://cwl.discourse.group/) of CWL - the experts will help you.

## Copyright

Copyright (c) 2020 [Contributors](https://github.com/pitagora-network/DAT2-cwl/graphs/contributors).
See [LICENSE](./LICENSE) for further details.
