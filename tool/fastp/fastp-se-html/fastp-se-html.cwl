#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: An ultra-fast all-in-one FASTQ preprocessor (QC/adapters/trimming/filtering/splitting/merging...)
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/fastp:0.20.0--hdbcaa40_0
  InlineJavascriptRequirement: {}
baseCommand: fastp
arguments:
  - prefix: -o
    position: 1
    valueFrom: $(inputs.fastq.basename.replace('.fq', '').replace('.fastq', '').replace('.gz', '')).trim.fastq.gz
  - prefix: --html
    position: 2
    valueFrom: $(inputs.fastq.nameroot).fastp.html
inputs:
  fastq:
    type: File
    inputBinding:
      prefix: -i
      position: 0
outputs:
  trimmed_fastq:
    type: File
    outputBinding:
      glob: $(inputs.fastq.basename.replace('.fq', '').replace('.fastq', '').replace('.gz', '')).trim.fastq.gz
  html:
    type: File
    outputBinding:
      glob: $(inputs.fastq.nameroot).fastp.html
  stdout: stdout
  stderr: stderr
stdout: fastp-se-html-stdout.log
stderr: fastp-se-html-stderr.log
