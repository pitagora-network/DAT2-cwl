#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/jellyfish-count:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/jellyfish-count.sh
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
stdout: jellyfish-count-stdout.log
stderr: jellyfish-count-stderr.log
