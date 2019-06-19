#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/nanoplot:1.20.0--py36_0
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/nanoplot.sh
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
stdout: nanoplot-stdout.log
stderr: nanoplot-stderr.log
