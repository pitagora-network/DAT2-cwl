#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: a suite of tools for Motif Discovery and next-gen sequencing analysis
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/homer:4.9.1--pl526h2d50403_6
  InlineJavascriptRequirement: {}
baseCommand: findMotifsGenome.pl
arguments:
  - position: 2
    valueFrom: $(inputs.summits_bed.nameroot)
  - position: 4
    prefix: -mask
    valueFrom: $(true)
inputs:
  summits_bed:
    type: File
    inputBinding:
      position: 0
  organism:
    type: string?
    default: mm10
    inputBinding:
      position: 1
  size:
    type: int?
    default: 200
    inputBinding:
      prefix: -size
      position: 3
outputs:
  homer-results-html:
    type: File
    outputBinding:
      glob: homerResults.html
  known-results-html:
    type: File
    outputBinding:
      glob: knownResults.html
  stdout: stdout
  stderr: stderr
stdout: HOMER_findMotifsGenome-stdout.log
stderr: HOMER_findMotifsGenome-stderr.log
