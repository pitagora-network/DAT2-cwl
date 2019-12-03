#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/gatk4:4.1.0.0--0
baseCommand: [gatk, GenotypeGVCFs]
inputs:
  reference:
    type: File
    inputBinding:
      prefix: --reference
  variant:
    type: File
    inputBinding:
      prefix: --variant
  output:
    type: string
    inputBinding:
      prefix: --output
  intervals:
    type: File
    inputBinding:
      prefix: --intervals
  interval_padding:
    type: int
    inputBinding:
      prefix: --interval-padding
  heap_size:
    type: int
    inputBinding:
      prefix: --java-options
      valueFrom: -Xmx$(self)g
outputs:
  vcf:
    type: File
    outputBinding:
      glob: $(inputs.output)
  stdout: stdout
  stderr: stderr
stdout: gatk-GenotypeGVCFs-stdout.log
stderr: gatk-GenotypeGVCFs-stderr.log
