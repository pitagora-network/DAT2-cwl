#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.9--h57cc563_6
baseCommand: [samtools, view]
inputs:
  threads:
    type: int
    default: 0
    inputBinding:
      prefix: --threads
  output_bam:
    type: boolean
    inputBinding:
      prefix: -b
  use_fast_compression:
    type: boolean
    inputBinding:
      prefix: "-1"
  sam:
    type: File
    inputBinding: {}
outputs:
  bam: stdout
  stderr: stderr
stdout: $(inputs.sam).bam
stderr: samtools-view-stderr.log
