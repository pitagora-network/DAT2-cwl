#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bwa:0.7.17--h84994c4_5
baseCommand: [bwa, mem]

inputs:
  threads:
    type: int
    label: "number of threads"
    defult: 4
    inputBinding:
      prefix: -t
  output_sam:
    type: string
    label: "sam file to output results to"
    default: "out.sam"
    inputBinding:
      prefix: -o
  index_base:
    type: File
    label: "fasta file for index basename"
    inputBinding:
      position: 1
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
  input_fastq:
    type: File
    label: "input fastq file to map"
    inputBinding:
      position: 2

outputs:
  output:
    type: File
    outputBinding:
      glob: "$(inputs.output_sam)"
  stdout: stdout
  stderr: stderr
stdout: bwa-mem-stdout.log
stderr: bwa-mem-stderr.log
