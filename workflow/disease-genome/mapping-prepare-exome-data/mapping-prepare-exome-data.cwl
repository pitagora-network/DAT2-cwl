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
    run: wget.cwl
    in:
      url: exome-data-url
      use_remote_name:
        default: true
    out:
      - downloaded
  sra2fastq:
    run: https://raw.githubusercontent.com/pitagora-network/pitagora-cwl/master/tools/fastq-dump/fastq-dump.cwl
    in:
      split_files:
        default: true
      gzip:
        default: true
      sraFiles:
        source: [download/downloaded]
        linkMerge: merge_flattened
    out:
      - forward
      - reverse
outputs:
  fastq-forward:
    type: File
    outputSource: sra2fastq/forward
  fastq-reverse:
    type: File
    outputSource: sra2fastq/reverse
