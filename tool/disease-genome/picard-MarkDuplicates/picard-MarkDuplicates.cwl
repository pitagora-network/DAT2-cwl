#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Identifies duplicate reads
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/picard:2.18.27--0
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.input)
baseCommand: [picard, MarkDuplicates]
inputs:
  input:
    type: File?
    inputBinding:
      prefix: INPUT=
      separate: false
  output_name:
    type: string
    inputBinding:
      prefix: OUTPUT=
      separate: false
  metrics_file_name:
    type: string
    inputBinding:
      prefix: METRICS_FILE=
      separate: false
  validation_stringency:
    type:
      type: enum
      symbols:
        - STRICT
        - LENIENT
        - SILENT
      inputBinding:
        prefix: VALIDATION_STRINGENCY=
        separate: false
  remove_duplicates:
    type: boolean
    default: false
    inputBinding:
      prefix: REMOVE_DUPLICATES=true
outputs:
  metrics:
    type: File
    outputBinding:
      glob: $(inputs.metrics_file_name)
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_name)
  stdout: stdout
  stderr: stderr
stdout: picard-MarkDuplicates-stdout.log
stderr: picard-MarkDuplicates-stderr.log
