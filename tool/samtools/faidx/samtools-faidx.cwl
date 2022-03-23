#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.9--h57cc563_6
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.fasta)
baseCommand: [samtools, faidx]
inputs:
  fasta:
    type: File
    inputBinding: {}
outputs:
  fasta-index:
    type: File
    outputBinding:
      glob: $(inputs.fasta.basename).fai
  stdout: stdout
  stderr: stderr
stdout: samtools-faidx-stdout.log
stderr: samtools-faidx-stderr.log
