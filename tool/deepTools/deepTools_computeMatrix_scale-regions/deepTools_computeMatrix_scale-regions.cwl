#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/deepTools_computeMatrix_scale-regions:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/deepTools_computeMatrix_scale-regions.sh
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
stdout: deepTools_computeMatrix_scale-regions-stdout.log
stderr: deepTools_computeMatrix_scale-regions-stderr.log
