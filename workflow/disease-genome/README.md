# DAT2-cwl disease genome data analysis workflow (疾患ゲノムアセンブリ)

Written by @tom-tan.

Please refer to p.64 of NGS_DAT 2nd edition for details of the analysis.

## Sub workflows

書籍におけるそれぞれのセクションに基づいて、いくつかの sub workflows に分割されている。

- ヒト参照ゲノム配列の準備 (p.65): [`mapping-prepare-genome.cwl`](./mapping-prepare-genome.cwl)
- Burrows-Wheeler Aligner (BWA) の準備 (p.67): [`mapping-prepare-bwa.cwl`](./mapping-prepare-bwa.cwl)
- 全エクソーム解析データの準備 (p.67): [`mapping-prepare-exome-data.cwl`](./mapping-prepare-exome-data.cwl)
- マッピングの実行 (p.68): [`mapping-execute-mapping.cwl`](./mapping-execute-mapping.cwl)
- PCR 由来の重複の除去 (deduplication) (p.69): [`variant-deduplication.cwl`](./variant-deduplication.cwl)
- 塩基ごとの品質スコアの再校正 (p.70): [`variant-recalibrate-score.cwl`](./variant-recalibrate-score.cwl)
- バリアント検出 (p.71): [`variant-detection.cwl`](./variant-detection.cwl)

### ヒト参照ゲノム配列の準備 (p.65)

[`mapping-prepare-genome.cwl`](./mapping-prepare-genome.cwl)

```shell
$ cwltool --validate mapping-prepare-genome.cwl
$ cwltool --outdir mapping-prepare-genome-test \
    mapping-prepare-genome.cwl \
    mapping-prepare-genome.yml
```

### Burrows-Wheeler Aligner (BWA) の準備 (p.67)

[`mapping-prepare-bwa.cwl`](mapping-prepare-bwa.cwl)

```shell
$ cwltool --validate mapping-prepare-bwa.cwl
$ cwltool mapping-prepare-bwa.cwl mapping-prepare-bwa.yml
```

### 全エクソーム解析データの準備 (p.67)

[`mapping-prepare-exome-data.cwl`](mapping-prepare-exome-data.cwl)

```shell
$ cwltool --validate mapping-prepare-exome-data.cwl
$ cwltool mapping-prepare-exome-data.cwl mapping-prepare-exome-data.yml
```

### マッピングの実行 (p.68)

[`mapping-execute-mapping.cwl`](mapping-execute-mapping.cwl)

```shell
$ cwltool --validate mapping-execute-mapping.cwl
$ cwltool mapping-execute-mapping.cwl mapping-execute-mapping.yml
```

### PCR 由来の重複の除去 (deduplication) (p.69)

[`variant-deduplication.cwl`](variant-deduplication.cwl)

```shell
$ cwltool --validate variant-deduplication.cwl
$ cwltool variant-deduplication.cwl variant-deduplication.yml
```

### 塩基ごとの品質スコアの再校正 (p.70)

[`variant-recalibrate-score.cwl`](variant-recalibrate-score.cwl)

```shell
$ cwltool --validate variant-recalibrate-score.cwl`](variant-recalibrate-score.cwl)
$ cwltool variant-recalibrate-score.cwl`](variant-recalibrate-score.yml
```

### バリアント検出 (p.71)

[`variant-detection.cwl`](variant-detection.cwl)

```shell
$ cwltool --validate variant-detection.cwl`](variant-detection.cwl)
$ cwltool variant-detection.cwl`](variant-detection.yml
```

## Test 環境

テストを実行した環境は以下の通り。

```shell
$ uname -a
Linux dh236 4.15.0-169-generic #177-Ubuntu SMP Thu Feb 3 10:50:38 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

$ cwltool --version
/home/ubuntu/.local/bin/cwltool 3.1.20220224085855

$ docker --version
Docker version 19.03.8, build afacb8b7f0
```
