#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Tools to process and analyze deep sequencing data.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/deeptools:3.3.0--py_0
baseCommand: bamCoverage
arguments:
  - position: 1
    prefix: -o
    valueFrom: $(inputs.bam.nameroot).bw
  - position: 2
    prefix: -of
    valueFrom: bigwig
  - position: 3
    prefix: --normalizeUsing
    valueFrom: CPM
inputs:
  bam:
    type: File
    inputBinding:
      position: 0
      prefix: -b
outputs:
  bigwig:
    type: File
    outputBinding:
      glob: $(inputs.bam.nameroot).bw
  stdout: stdout
  stderr: stderr
stdout: deepTools_bamCoverage-stdout.log
stderr: deepTools_bamCoverage-stderr.log
