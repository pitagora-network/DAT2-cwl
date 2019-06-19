#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/samtools-index:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/samtools-index.sh
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
stdout: samtools-index-stdout.log
stderr: samtools-index-stderr.log
