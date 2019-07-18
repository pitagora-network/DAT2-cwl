#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements:
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement
inputs:
  run_ids:
    type: string[]
    label: "list of SRA Run ID e.g. SRR1274307"
    doc: "list of SRA Run ID e.g. SRR1274307"
steps:
  download_fastq:
    run: https://github.com/pitagora-network/pitagora-cwl/raw/master/workflows/download-fastq/download-fastq.cwl
    in:
      run_ids: run_ids
    out:
      [fastq_files]
  gunzip:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/gunzip/gunzip.cwl
    in:
      file: download_fastq/fastq_files
    scatter: file
    out:
      [decompressed]
      
outputs:
  fastq_files:
    type: File[]
    outputSource: gunzip/decompressed
