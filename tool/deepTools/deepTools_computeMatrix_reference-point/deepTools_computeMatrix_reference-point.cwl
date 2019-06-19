#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: dat2-cwl/deepTools_computeMatrix_reference-point:latest
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /workdir/deepTools_computeMatrix_reference-point.sh
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
stdout: deepTools_computeMatrix_reference-point-stdout.log
stderr: deepTools_computeMatrix_reference-point-stderr.log
