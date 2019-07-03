#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/jellyfish:1.1.12--h2d50403_0
baseCommand: [jellyfish, histo]
inputs:
  threads:
    type: int
    default: 4
    label: "Number of threads"
    inputBinding:
      prefix: -t
  kmer_db:
    type: File
    label: "jellyfish count output"
    inputBinding:
      position: 1
outputs:
  stdout: stdout
  stderr: stderr
stdout: reads.histo
stderr: jellyfish-histo-stderr.log
