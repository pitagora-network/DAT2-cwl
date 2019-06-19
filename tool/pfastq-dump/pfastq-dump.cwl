#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/pfastq-dump:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/pfastq-dump.sh
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
stdout: pfastq-dump-stdout.log
stderr: pfastq-dump-stderr.log
