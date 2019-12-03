#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Apply a linear base quality recalibration model trained with the BaseRecalibrator tool.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/gatk4:4.1.0.0--0
baseCommand: [gatk, ApplyBQSR]
inputs:
  input:
    type: File
    inputBinding:
      prefix: --input
  output:
    type: string
    inputBinding:
      prefix: --output
  reference:
    type: File
    inputBinding:
      prefix: --reference
    secondaryFiles:
      - .fai
  recal_file:
    type: File
    inputBinding:
      prefix: --bqsr-recal-file
outputs:
  bam:
    type: File
    outputBinding:
      glob: $(inputs.output)
  stdout: stdout
  stderr: stderr
stdout: gatk-ApplyBQSR-stdout.log
stderr: gatk-ApplyBQSR-stderr.log
