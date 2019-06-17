#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: concatenate files and print on the standard output
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
baseCommand: cat
inputs:
  files:
    type: File[]
    inputBinding: {}
outputs:
  concatinated: stdout
  stderr: stderr
stdout: cat-stdout.log
stderr: cat-stderr.log
