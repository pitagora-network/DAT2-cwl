#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Preparing reference human genome (See chapter: ヒトゲノム参照配列の準備)"
requirements:
  MultipleInputFeatureRequirement: {}
  InlineJavascriptRequirement: {}
inputs:
  reference-genome-url:
    type: string
  reference-genome-names:
    type: string[]
  decoy-fasta:
    type: File
steps:
  download:
    run: ../../../tool/wget/wget.cwl
    in:
      url: reference-genome-url
      use_remote_name:
        default: true
    out:
      - downloaded
  extract:
    run: ../../../tool/tar/tar.cwl
    in:
      file: download/downloaded
      extract:
        default: true
      gzip:
        default: true
    out:
      - output
  listing:
    run: ../../../tool/listing/listing.cwl
    in:
      dir: extract/output
      file_names: reference-genome-names
    out:
      - files
  concat:
    run: ../../../tool/cat/cat.cwl
    in:
      files:
        source:
          - listing/files
          - decoy-fasta
        linkMerge: merge_flattened
    out:
      - concatinated
  list-sequence:
    run: ../../../tool/grep/grep.cwl
    in:
      pattern:
        default: ^>
      files:
        source:
          - concat/concatinated
        linkMerge: merge_flattened
    out:
      - output
outputs:
  prepared-fasta:
    type: File
    outputSource: concat/concatinated
  listed:
    type: File
    outputSource: list-sequence/output
