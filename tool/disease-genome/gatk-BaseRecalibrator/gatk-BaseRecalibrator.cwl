#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: First pass of the Base Quality Score Recalibration (BQSR)
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/gatk4:4.1.0.0--0
baseCommand: [gatk, BaseRecalibrator]
inputs:
  input:
    type: File
    inputBinding:
      prefix: --input
  reference:
    type: File
    inputBinding:
      prefix: --reference
    secondaryFiles:
      - .fai
      - ^.dict
  output_name:
    type: string
    inputBinding:
      prefix: --output
  known_sites:
    type:
      type: array
      items: File
      inputBinding:
        prefix: --known-sites
    secondaryFiles:
      - .tbi
outputs:
  recalibration_table:
    type: File
    outputBinding:
      glob: $(inputs.output_name)
  stdout: stdout
  stderr: stderr
stdout: gatk-BaseRecalibrator-stdout.log
stderr: gatk-BaseRecalibrator-stderr.log
