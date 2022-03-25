#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: A high throughput sequence QC analysis tool
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/fastqc:0.11.9--hdfd78af_1
baseCommand: fastqc
arguments:
  - prefix: --outdir
    valueFrom: $(runtime.outdir)
    position: 0
inputs:
  fastq:
    type: File
    inputBinding:
      position: 1
outputs:
  html:
    type: File
    outputBinding:
      glob: "*.html"
  result_files:
    type: File
    outputBinding:
      glob: "*.zip"
  stdout: stdout
  stderr: stderr
stdout: fastqc-stdout.log
stderr: fastqc-stderr.log
