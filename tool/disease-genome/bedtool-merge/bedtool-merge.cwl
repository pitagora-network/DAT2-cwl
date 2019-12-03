#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Merges overlapping BED/GFF/VCF entries into a single interval.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bedtools:2.27.0--he860b03_3
baseCommand: [bedtools, merge]
inputs:
  bed:
    type: File
    inputBinding:
      prefix: -i
outputs:
  sorted:
    type: stdout
  stderr: stderr
stdout: $(inputs.bed.nameroot).sort.bed
stderr: bedtool-merge-stderr.log
