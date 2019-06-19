#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Tools to process and analyze deep sequencing data.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/deeptools:3.3.0--py_0
  InlineJavascriptRequirement: {}
baseCommand: ["computeMatrix", "scale-regions"]
arguments:
  - position: 2
    prefix: -outFileName
    valueFrom: $(inputs.score_file_name.nameroot).matrix_gencode_vM20_gene.txt.gz
  - position: 3
    prefix: --upstream
    valueFrom: "1000"
  - position: 4
    prefix: --downstream
    valueFrom: "1000"
  - position: 5
    prefix: --skipZeros
    valueFrom: $(true)
inputs:
  regions_file_name:
    type: string?
    default: None
    inputBinding:
      position: 0
      prefix: --regionsFileName
  score_file_name:
    type: string?
    default: None
    inputBinding:
      position: 1
      prefix: --scoreFileName
outputs:
  result:
    type: File
    outputBinding:
      glob: $(inputs.score_file_name.nameroot).matrix_gencode_vM20_gene.txt.gz
  stdout: stdout
  stderr: stderr
stdout: deepTools_bamCoverage-stdout.log
stderr: deepTools_bamCoverage-stderr.log
