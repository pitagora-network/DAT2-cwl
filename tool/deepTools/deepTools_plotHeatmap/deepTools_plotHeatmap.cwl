#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Tools to process and analyze deep sequencing data.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/deeptools:3.3.0--py_0
baseCommand: plotHeatmap
arguments:
  - position: 1
    prefix: -out
    valueFrom: $(inputs.matrix-file.nameroot).pdf
inputs:
  matrix-file:
    type: File
    doc: Matrix file from the computeMatrix tool.
    inputBinding:
      position: 0
      prefix: -m
  kmeans:
    type: string?
    default: None
    inputBinding:
      position: 2
      prefix: --kmeans
  plot_title:
    type: string?
    default: None
    inputBinding:
      position: 3
      prefix: --plotTitle
  samples_label:
    type: string?
    default: None
    inputBinding:
      position: 4
      prefix: --samplesLabel
  regions_label:
    type: string?
    default: None
    inputBinding:
      position: 5
      prefix: --regionsLabel
outputs:
  result:
    type: File
    outputBinding:
      glob: $(inputs.matrix-file.nameroot).pdf
  stdout: stdout
  stderr: stderr
stdout: deepTools_bamCoverage-stdout.log
stderr: deepTools_bamCoverage-stderr.log
