#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bwa:0.7.17--h84994c4_5
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.input_fasta)
        entryname: $(inputs.input_fasta.basename)
baseCommand: [bwa, index]
inputs:
  input_fasta:
    type: File
    label: "input fasta file"
    inputBinding:
      position: 1
outputs:
  amb:
    type: File
    outputBinding:
      glob: $(inputs.input_fasta.basename).amb
  ann:
    type: File
    outputBinding:
      glob: $(inputs.input_fasta.basename).ann
  bwt:
    type: File
    outputBinding:
      glob: $(inputs.input_fasta.basename).bwt
  pac:
    type: File
    outputBinding:
      glob: $(inputs.input_fasta.basename).pac
  sa:
    type: File
    outputBinding:
      glob: $(inputs.input_fasta.basename).sa
  stdout: stdout
  stderr: stderr
stdout: bwa-index-stdout.log
stderr: bwa-index-stderr.log
