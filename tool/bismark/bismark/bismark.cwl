#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
label: bismark
doc: bismark
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bismark:0.20.0--0
baseCommand: ["bismark"]
inputs:
  genome_folder:
    type: Directory
    label: The path to the folder containing the unmodified reference genome as well as the subfolders created by the Bismark_Genome_Preparation script
    doc: The path to the folder containing the unmodified reference genome as well as the subfolders created by the Bismark_Genome_Preparation script
    inputBinding:
      position: 1
  fq:
    type: File
    label: .fq or .fastq file
    doc: .fq or .fastq file
    inputBinding:
      position: 2
  multicore:
    type: int
    default: 1
    inputBinding:
      position: 3
      prefix: --multicore
outputs:
  bam:
    type: File
    outputBinding:
      glob: "*_bismark_bt2.bam"
  report:
    type: File
    outputBinding:
      glob: "*_bismark_bt2_SE_report.txt"
  stderr: stderr
stdout: bismark-stdout.log
stderr: bismark-stderr.log
