#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bwa:0.7.17--h84994c4_5
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/bwa-mem.sh
inputs:
  input_1:
    type: File
    inputBinding:
      position: 1
outputs:
  output_1:
    type: File
    outputBinding:
      glob: "*.txt"
  stdout: stdout
  stderr: stderr
stdout: bwa-mem-stdout.log
stderr: bwa-mem-stderr.log
