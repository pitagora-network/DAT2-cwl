#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: An ultra-fast all-in-one FASTQ preprocessor (QC/adapters/trimming/filtering/splitting/merging...)
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/fastp:0.20.0--hdbcaa40_0
baseCommand: fastp
arguments:
  - prefix: -o
    position: 2
    valueFrom: $(inputs.fastq1.nameroot).fastp.fastq
  - prefix: -O
    position: 3
    valueFrom: $(inputs.fastq2.nameroot).fastp.fastq
inputs:
  fastq1:
    type: File
    inputBinding:
      prefix: -i
      position: 0
  fastq2:
    type: File
    inputBinding:
      prefix: -I
      position: 1
outputs:
  output_fastq1:
    type: File
    outputBinding:
      glob: $(inputs.fastq1.nameroot).fastp.fastq
  output_fastq2:
    type: File
    outputBinding:
      glob: $(inputs.fastq2.nameroot).fastp.fastq
  stdout: stdout
  stderr: stderr
stdout: fastp-stdout.log
stderr: fastp-stderr.log
