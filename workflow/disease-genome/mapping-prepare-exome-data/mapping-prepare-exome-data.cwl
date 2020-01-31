#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Preparing exome data (See chapter: 全エクソーム解析データの準備)"
requirements:
  MultipleInputFeatureRequirement: {}
inputs:
  exome-data-url:
    type: string
steps:
  download:
    run: ../../../tool/wget/wget.cwl
    in:
      url: exome-data-url
      use_remote_name:
        default: true
    out:
      - downloaded
  sra2fastq:
    run: https://raw.githubusercontent.com/pitagora-network/pitagora-cwl/master/tools/fastq-dump/fastq-dump.cwl
    in:
      sraFiles:
        source: [download/downloaded]
        linkMerge: merge_flattened
      split_files:
        default: true
      split_spot:
        default: false
      skip_technical:
        default: false
      readids:
        default: false
      gzip:
        default: true
    out:
      - forward
      - reverse
  unwrap-forward:
    run: ../../../tool/unwrap/unwrap.cwl
    in:
      input: sra2fastq/forward
    out:
      - unwrapped
  unwrap-reverse:
    run: ../../../tool/unwrap/unwrap.cwl
    in:
      input: sra2fastq/reverse
    out:
      - unwrapped
outputs:
  fastq-forward:
    type: File
    outputSource: unwrap-forward/unwrapped
  fastq-reverse:
    type: File
    outputSource: unwrap-reverse/unwrapped
