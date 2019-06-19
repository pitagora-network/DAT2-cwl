#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/wtpoa-cns:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/wtpoa-cns.sh
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
stdout: wtpoa-cns-stdout.log
stderr: wtpoa-cns-stderr.log
