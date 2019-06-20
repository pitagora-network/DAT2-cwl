#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements: {}
inputs:
  fastq1:
    type: File
  fastq2:
    type: File
steps:
  seqkit-stats-fastq1:
    run: ../../tool/seqkit/seqkit-stats/seqkit-stats.cwl
    in:
      fastq: fastq1
    out:
      - result
  seqkit-stats-fastq2:
    run: ../../tool/seqkit/seqkit-stats/seqkit-stats.cwl
    in:
      fastq: fastq2
    out:
      - result
  fastqc-fastq1:
    run: ../../tool/fastqc/fastqc.cwl
    in:
outputs:
  step-1_output_1:
    type: File
    outputSource: step-1/output_1
