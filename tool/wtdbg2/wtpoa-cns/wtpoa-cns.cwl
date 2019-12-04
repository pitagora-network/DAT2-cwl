#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/inutano/wtdbg2:v2.2
baseCommand: wtpoa-cns

inputs:
  threads:
    type: int
    default: 32
    label: "Number of threads"
    inputBinding:
      prefix:  -t
  input_contigs:
    type: File
    label: "Input file(s) *.ctg.lay from wtdbg"
    inputBinding:
      prefix: -i
  overwrite:
    type: boolean
    default: true
    label: "Force overwrite"
    inputBinding:
      prefix: -f
  output_filename:
    type: string
    default: worm.wtdbg2.fa
    label: "Output files"
    inputBinding:
      prefix: -o

outputs:
  output_file:
    type: File
    outputBinding:
      glob: "$(inputs.output_filename)"
  stdout: stdout
  stderr: stderr
stdout: wtpoa-cns-stdout.log
stderr: wtpoa-cns-stderr.log
