#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Call germline SNPs and indels via local re-assembly of haplotypes
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/gatk4:4.1.0.0--0
baseCommand: [gatk, HaplotypeCaller]
inputs:
  input:
    type: File
    inputBinding:
      prefix: --input
    secondaryFiles:
      - ^.bai
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
      - ^.dict
  intervals:
    type: File
    inputBinding:
      prefix: --intervals
  interval_padding:
    type: int
    inputBinding:
      prefix: --interval-padding
  emit-ref-confidence:
    type:
      type: enum
      symbols:
        - NONE
        - BP_RESOLUTION
        - GVCF
    inputBinding:
      prefix: --emit-ref-confidence
  dbsnp:
    type: File
    inputBinding:
      prefix: --dbsnp
    secondaryFiles:
      - .tbi
  sample_name:
    type: string
    inputBinding:
      prefix: --sample-name
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
stdout: gatk-HaplotypeCaller-stdout.log
stderr: gatk-HaplotypeCaller-stderr.log
