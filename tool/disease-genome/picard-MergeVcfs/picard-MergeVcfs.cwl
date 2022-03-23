#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Combines multiple variant files into a single variant file.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/picard:2.18.27--0
baseCommand: [picard, MergeVcfs]
inputs:
  vcfs:
    type:
      type: array
      items: File
      inputBinding:
        prefix: INPUT=
        separate: false
  output_name:
    type: string
    inputBinding:
      prefix: OUTPUT=
      separate: false
outputs:
  merged:
    type: File
    outputBinding:
      glob: $(inputs.output_name)
  stdout: stdout
  stderr: stderr
stdout: picard-MergeVcfs-stdout.log
stderr: picard-MergeVcfs-stderr.log
