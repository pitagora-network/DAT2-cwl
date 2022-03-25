#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: a cross-platform and ultrafast toolkit for FASTA/Q file manipulation
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/seqkit:2.2.0--h9ee0642_0
baseCommand: [seqkit, stats]
inputs:
  fastq:
    type: File
outputs:
  result: stdout
  stderr: stderr
stdout: $(inputs.fastq.nameroot)_seqkit-stats-result.tsv
stderr: seqkit-stats-stderr.log
