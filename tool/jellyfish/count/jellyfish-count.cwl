#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/jellyfish:1.1.12--h2d50403_0
baseCommand: [jellyfish, count]
inputs:
  both_strands:
    type: boolean
    label: "Count both strand, canonical representation"
    default: true
    inputBinding:
      prefix: -C
  mer_len:
    type: int
    label: "Length of mer"
    default: 21
    inputBinding:
      prefix: --mer-len
  size:
    type: int
    label: "Hash size"
    default: 1000000000
    inputBinding:
      prefix: -s
  threads:
    type: int
    label: "Number of threads"
    default: 4
    inputBinding:
      prefix: -t
  output:
    type: string
    label: "Output prefix"
    default: "reads.jf"
    inputBinding:
      prefix: -o
  input_file:
    type: File
    label: "fasta or fastq file"
    inputBinding:
      position: 1

outputs:
  kmers:
    type: File
    outputBinding:
      glob: $(inputs.output)*
  stdout: stdout
  stderr: stderr
stdout: jellyfish-count-stdout.log
stderr: jellyfish-count-stderr.log
