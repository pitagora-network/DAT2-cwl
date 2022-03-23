#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: This tool makes it possible to select a subset of variants based on various criteria in order to facilitate certain analyses.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/gatk4:4.1.0.0--0
baseCommand: [gatk, SelectVariants]
inputs:
  reference:
    type: File
    inputBinding:
      prefix: --reference
  variant:
    type: File
    inputBinding:
      prefix: --variant
    secondaryFiles:
      - .tbi
  select_type:
    type:
      type: enum
      symbols:
        - NO_VARIATION
        - SNP
        - MNP
        - INDEL
        - SYMBOLIC
        - MIXED
    inputBinding:
      prefix: --select-type-to-include
  output:
    type: string
    inputBinding:
      prefix: --output
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
    secondaryFiles:
      - .tbi
  stdout: stdout
  stderr: stderr
stdout: gatk-SelectVariants-stdout.log
stderr: gatk-SelectVariants-stderr.log
