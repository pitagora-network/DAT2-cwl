#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: ghcr.io/pitagora-network/sort-bed:1.0.0
baseCommand: sort-bed.rb
inputs:
  bed:
    type: File
    inputBinding: {}
outputs:
  sorted:
    type: stdout
  stderr: stderr
stdout: $(inputs.bed.nameroot).sort.bed
stderr: sort-bed-stderr.log
