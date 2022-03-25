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
  threads:
    type: int
    default: 4
    doc: "number of threads to use"
steps:
  download_sra:
    run: https://github.com/pitagora-network/pitagora-cwl/raw/master/tools/download-sra/download-sra.cwl
    in:
      run_ids: run_ids
    out: [sraFiles]
  pfastq_dump:
    run: https://github.com/pitagora-network/pitagora-cwl/raw/master/tools/pfastq-dump/pfastq-dump-multi.cwl
    in:
      sraFiles: download_sra/sraFiles
      nthreads: threads
    out: [fastqFiles]

outputs:
  fastq_files:
    type: File[]
    outputSource: pfastq_dump/fastqFiles
