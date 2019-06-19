#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/bowtie2-pe:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/bowtie2-pe.sh
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
stdout: bowtie2-pe-stdout.log
stderr: bowtie2-pe-stderr.log
