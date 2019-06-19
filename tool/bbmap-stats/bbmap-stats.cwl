#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bbmap:38.22--h14c3975_1
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /usr/local/bin/stats.sh
inputs:
  input_fastq:
    type: File
    inputBinding:
      position: 1
outputs:
  stdout: stats
  stderr: stderr
stdout: bbmap-stats.txt
stderr: bbmap-stats-stderr.log
