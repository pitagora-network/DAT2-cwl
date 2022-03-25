#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/canu:1.8--pl526h470a237_0
baseCommand: canu
inputs:
  assembly_directory:
    type: string
    label: "assembly directory"
    default: "canu"
    inputBinding:
      prefix: -d
      position: -1000
  output_prefix:
    type: string
    label: "assembly prefix"
    default: "canu"
    inputBinding:
      prefix: -p
      position: -1000
  genomeSize:
    type: string
    label: "best guess of the haploid genome size"
    doc: "The genome size should be your best guess of the haploid genome size of what is being assembled.  It is used primarily to estimate coverage in reads, NOT as the desired assembly size.  Fractional values are allowed: '4.7m' equals '4700k' equals '4700000'"
    inputBinding:
      prefix: genomeSize=
      separate: false
  maxThreads:
    type: int
    label: "maxThreads"
    default: 4
    inputBinding:
      prefix: maxThreads=
      separate: false
  input_fastq:
    type: File
    label: "input fastq reads generated by nanopore technology"
    inputBinding:
      prefix: -nanopore-raw
      position: 1

outputs:
  files:
    type: File[]
    outputBinding:
      glob: $(inputs.assembly_directory)/*
  contigs:
    type: File
    outputBinding:
      glob: "$(inputs.assembly_directory)/$(inputs.output_prefix).contigs.fasta"
  stdout: stdout
  stderr: stderr
# stdout: canu-stdout.log
# stderr: canu-stderr.log
