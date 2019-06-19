#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bwa:0.7.17--h84994c4_5
baseCommand: [bwa, index]
inputs:
  input_fasta:
    type: File
    label: "input fasta file"
    inputBinding:
      position: 1
outputs:
  output_1:
    type: File
    outputBinding:
      glob: "*.txt"
  stdout: stdout
  stderr: stderr
stdout: bwa-index-stdout.log
stderr: bwa-index-stderr.log
