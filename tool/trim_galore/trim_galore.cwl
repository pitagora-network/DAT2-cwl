#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
label: Trim Galore
doc: Trim Galore
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/trim-galore:0.5.0--0    
baseCommand: ["trim_galore"]

inputs:
  quality:
    type: int
    label: "Trim low-quality ends from reads in addition to adapter removal"
    doc: "Trim low-quality ends from reads in addition to adapter removal"
    inputBinding:
      prefix: -q
  rrbs:
    type: File
    label: "input file was an MspI digested RRBS sample"
    doc: "input file was an MspI digested RRBS sample"
    inputBinding:
      prefix: -rrbs
outputs:
  fq:
    type: File
    outputBinding:
      glob: "$(inputs.rrbs.nameroot)_trimmed.fq"
  report:
    type: File
    outputBinding:
      glob: "$(inputs.rrbs.nameroot).fastq_trimming_report.txt"

  stdout: stdout
  stderr: stderr
stdout: trim_galore-stdout.log
stderr: trim_galore-stderr.log