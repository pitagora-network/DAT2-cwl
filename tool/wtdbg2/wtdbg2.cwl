#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/wtdbg2:2.0--h470a237_0
baseCommand: wtdbg2

inputs:
  threads:
    type: int
    label: "Number of threads, 0 for all cores"
    default: 32
    inputBinding:
      prefix: -t
  sequence:
    type: File
    label: "Long reads sequences file (REQUIRED; can be multiple)"
    inputBinding:
      prefix: -i
  overwrite:
    type: boolean
    label: "Force to overwrite output files"
    default: true
    inputBinding:
      prefix: -f
  output_prefix:
    type: string
    label: "Prefix of output files (REQUIRED)"
    default: worm.wtdbg2
    inputBinding:
      prefix: -o

outputs:
  contigs:
    type: File
    outputBinding:
      glob: "$(inputs.output_prefix).ctg.lay.gz"
  stdout: stdout
  stderr: stderr
stdout: wtdbg2-stdout.log
stderr: wtdbg2-stderr.log
