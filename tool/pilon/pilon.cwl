#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: "Pilon for hybrid genome assembly"
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/pilon:1.23--0
baseCommand: [java]

arguments:
  - position: -2
    valueFrom: -jar
  - position: -1
    valueFrom: /usr/local/share/pilon-1.23-0/pilon-1.23.jar

inputs:
  java_heapsize:
    type: string
    default: 14g
    label: "maximum memory size allocated for JVM"
    inputBinding:
      prefix: -Xms
      separate: false
      position: -3
  genome_fasta:
    type: File
    label: "genome fasta file to be polished"
    inputBinding:
      prefix: --genome
  alinged_bam:
    type: File
    label: "A bam file of unknown type"
    doc: "A bam file of unknown type; Pilon will scan it and attempt to classify it"
    inputBinding:
      prefix: --bam
  threads:
    type: int
    label: "Degree of parallelism to use for certain processing"
    default: 4
    doc: "Degree of parallelism to use for certain processing (default 1). Experimental."
    inputBinding:
      prefix: --threads
  output_prefix:
    type: string
    label: "Prefix for output files"
    default: "worm.pilon"
    inputBinding:
      prefix: --output
outputs:
  output_files:
    type: File
    outputBinding:
      glob: "*"
  stdout: stdout
  stderr: stderr
stdout: pilon-stdout.log
stderr: pilon-stderr.log
