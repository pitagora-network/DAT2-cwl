# DAT2-CWL

This repository contains the Common Workflow Language (CWL) definitions of the workflows introduced in the book [#NGS_DAT 2nd edition (A tutorial book in Japanese, 次世代シークエンサー DRY 解析教本 改訂第 2 版)](https://www.amazon.co.jp/dp/478090983X).

## Workflows

This repository provides workflows of the Level 2 section of the NGS_DAT 2nd edition.

- [disease-genome](./workflow/disease-genome)
  - 疾患ゲノム解析 (p.64)
  - by [@tom-tan](https://github.com/tom-tan)
  - no test
- [rna-seq](./workflow/rna-seq)
  - 発現解析 (p.86)
  - by [@ykohki](https://github.com/ykohki)
- [epigenome-chip-seq](./workflow/epigenome-chip-seq)
  - エピゲノム解析 (ChIP-seq) (p.114)
  - by [@suecharo](https://github.com/suecharo)
- [epigenome-bs-seq](./workflow/epigenome-bs-seq)
  - エピゲノム解析 (BS-seq) (p.164)
  - by [@manabuishii](https://github.com/manabuishii)
  - [![test-workflow-epigenome-bs-seq](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-epigenome-bs-seq.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-epigenome-bs-seq.yml)
- [meta16s-seq](./workflow/meta16s-seq)
  - メタゲノム解析 (p.203)
  - by [@inutano](https://github.com/inutano)
- [bacteria-genome](./workflow/bacteria-genome)
  - バクテリアゲノム解析 (p.246)
  - by [@suecharo](https://github.com/suecharo)
  - [![test-workflow-bacteria-genome](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-bacteria-genome.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-bacteria-genome.yml)
- [animal-genome-assembly](./workflow/animal-genome-assembly)
  - 動物ゲノムアセンブリ (p.274)
  - by [@inutano](https://github.com/inutano)
  - [![test-workflow-animal-genome-assembly](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-animal-genome-assembly.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-animal-genome-assembly.yml)
- [transcriptome-assembly](./workflow/transcriptome-assembly)
  - トランスクリプトームアセンブル解析 (p.309)
  - by [@yyoshiaki](https://github.com/yyoshiaki)

For more detailed documentation on testing, see [`test/README.md`](./test/README.md).

## Learn how to run CWL

There are many online documents to learn about CWL out there:

- [The official website](https://www.commonwl.org/)
- [Getting started](https://www.commonwl.org/user_guide/)
- [Getting started in Japanese](https://github.com/pitagora-galaxy/cwl/wiki/CWL-Start-Guide-JP)
- [The workflow meetup Tokyo/Osaka](https://github.com/manabuishii/workflow-meetup/wiki/20180418)
  - Slack workspace and invitation code is on the website
- [Pitagora Network](https://pitagora-network.org/)
  - a monthly meetup in Tokyo for bioinformatics workflow users and developers

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
