#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Creates a sequence dictionary for a reference sequence
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/picard:2.18.27--0
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.reference)
baseCommand: [picard, CreateSequenceDictionary]
inputs:
  reference:
    type: File
    inputBinding:
      prefix: REFERENCE=
      separate: false
  output_name:
    type: string?
    inputBinding:
      prefix: OUTPUT=
      separate: false
outputs:
  sam:
    type: File
    outputBinding:
      glob: |
        ${
          return inputs.output_name ? inputs.output_name : inputs.reference.nameroot+'.dict';
        }
  stdout: stdout
  stderr: stderr
stdout: picard-CreateSequenceDictionary-stdout.log
stderr: picard-CreateSequenceDictionary-stderr.log
