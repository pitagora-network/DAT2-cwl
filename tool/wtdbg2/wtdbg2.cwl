#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/wtdbg2:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/wtdbg2.sh
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
stdout: wtdbg2-stdout.log
stderr: wtdbg2-stderr.log
