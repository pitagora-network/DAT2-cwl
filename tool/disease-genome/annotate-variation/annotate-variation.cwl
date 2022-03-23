#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: ghcr.io/pitagora-network/annotate-variation:1.0.0
baseCommand: [annotate_variation.pl]
inputs:
  buildver:
    type: string
    inputBinding:
      prefix: --buildver
  download:
    type: boolean
    inputBinding:
      prefix: --downdb
  table:
    type: string
    inputBinding:
      position: 1
  webfrom:
    type: string?
    inputBinding:
      prefix: --webfrom
  location_name:
    type: string
    inputBinding:
      position: 2
outputs:
  dir:
    type: Directory
    outputBinding:
      glob: $(inputs.location_name)
  stdout: stdout
  stderr: stderr
stdout: annovar-variation-stdout.log
stderr: annovar-variation-stderr.log
