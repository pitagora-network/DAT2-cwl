#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Output statistics of input sequence reads
requirements:
  DockerRequirement:
    dockerPull: quay.io/inutano/bbmap:38.43
baseCommand: bash
arguments:
  - position: 0
    valueFrom: /bbmap/stats.sh
inputs:
  input_fastq:
    type: File
    inputBinding:
      position: 1
outputs:
  stats: stdout
  stderr: stderr
stdout: bbmap-stats.txt
stderr: bbmap-stats-stderr.log
