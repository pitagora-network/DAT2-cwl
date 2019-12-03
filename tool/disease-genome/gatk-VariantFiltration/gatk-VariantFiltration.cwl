#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Filter variant calls based on INFO and/or FORMAT annotations.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/gatk4:4.1.0.0--0
baseCommand: [gatk, VariantFiltration]
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
  filters:
    type:
      type: array
      items:
        type: record
        fields:
          expression:
            type: string
            inputBinding:
              prefix: --filter-expression
          name:
            type: string
            inputBinding:
              prefix: --filter-name
  heap_size:
    type: int
    inputBinding:
      prefix: --java-options
      valueFrom: -Xmx$(self)g
outputs:
  gvcf:
    type: File
    outputBinding:
      glob: $(inputs.output)
  stdout: stdout
  stderr: stderr
stdout: gatk-VariantFiltration-stdout.log
stderr: gatk-VariantFiltration-stderr.log
