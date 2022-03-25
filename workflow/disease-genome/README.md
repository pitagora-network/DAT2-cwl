# DAT2-cwl disease genome data analysis workflow

Written by [@tom-tan](https://github.com/tom-tan).

Please refer to p.64 of NGS_DAT 2nd edition for details of the analysis.

## Sub workflows

書籍におけるそれぞれのセクションに基づいて、いくつかの sub workflows に分割されている。

- ヒト参照ゲノム配列の準備 (p.65): [`mapping-prepare-genome.cwl`](./mapping-prepare-genome/mapping-prepare-genome.cwl)
- Burrows-Wheeler Aligner (BWA) の準備 (p.67): [`mapping-prepare-bwa.cwl`](./mapping-prepare-bwa/mapping-prepare-bwa.cwl)
- 全エクソーム解析データの準備 (p.67): [`mapping-prepare-exome-data.cwl`](./mapping-prepare-exome-data/mapping-prepare-exome-data.cwl)
- マッピングの実行 (p.68): [`mapping-execute-mapping.cwl`](./mapping-execute-mapping/mapping-execute-mapping.cwl)
- PCR 由来の重複の除去 (deduplication) (p.69): [`variant-deduplication.cwl`](./variant-deduplication/variant-deduplication.cwl)
- 塩基ごとの品質スコアの再校正 (p.70): [`variant-recalibrate-score.cwl`](./variant-recalibrate-score/variant-recalibrate-score.cwl)
- バリアント検出 (p.71): [`variant-detection.cwl`](./variant-detection/variant-detection.cwl)
