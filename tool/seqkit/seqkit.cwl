#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: a cross-platform and ultrafast toolkit for FASTA/Q file manipulation
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/seqkit:0.10.1--1
baseCommand: [seqkit, stats]
inputs:
  fastq:
    type: File
    inputBinding:
      position: 0
outputs:
  result: stdout
  stderr: stderr
stdout: seqkit-result.tsv
stderr: seqkit-stderr.log
