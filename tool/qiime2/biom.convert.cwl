#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.0
baseCommand: biom
arguments:
  - convert
  - -i
  - $(inputs.input_fp)
  - -o
  - $(inputs.output_fp)
inputs:
  - id: input_fp
    type: File
  - id: output_fp
    type: string
  - id: to_tsv
    type: boolean
    default: true
    inputBinding:
      prefix: --to-tsv
outputs:
 - id: table
   type: File
   outputBinding:
     glob: "$(inputs.output_fp)"
