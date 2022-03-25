#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: execute fastqc workflow
requirements: {}
inputs:
  fastq_files:
    type: File[]
  nthreads:
    type: int
    default: 4
steps:
  fastqc:
    run: https://github.com/pitagora-network/pitagora-cwl/raw/master/tools/fastqc/fastqc.cwl
    in:
      nogroup:
        default: true
      nthreads: nthreads
      seqfile: fastq_files
    out:
      - fastqc_result
outputs:
  output:
    type: File[]
    outputSource: fastqc/fastqc_result
