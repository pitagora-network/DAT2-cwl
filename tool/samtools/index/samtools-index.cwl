#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: "samtools index to create index for given bam file"
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.9--h8571acd_11
  InitialWorkDirRequirement:
    listing:
      - $(inputs.input_bamfile)

baseCommand: [samtools, index]
inputs:
  input_bamfile:
    type: File
    inputBinding:
      position: 1
outputs:
  bam_index:
    type: File
    outputBinding:
      glob: "$(inputs.input_bamfile.basename).bai"
  stdout: stdout
  stderr: stderr
stdout: samtools-index-stdout.log
stderr: samtools-index-stderr.log
