#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: "samtools view to convert sam format to bam format"
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.9--h8571acd_11
baseCommand: [samtools, view]
inputs:
  threads:
    type: int
    label: "Number of additional threads to use"
    default: 4
    inputBinding:
      prefix: -@
  output_bam:
    type: boolean
    label: "output BAM"
    default: true
    inputBinding:
      prefix: -b
  output_filename:
    type: string
    label: "output file name"
    default: "aln.bam"
    inputBinding:
      prefix: -o
  input_file:
    type: File
    label: "input file"
    inputBinding:
      position: 1
outputs:
  output_bam:
    type: File
    outputBinding:
      glob: "$(inputs.output_filename)"
  stdout: stdout
  stderr: stderr
stdout: samtools-view-stdout.log
stderr: samtools-view-stderr.log
