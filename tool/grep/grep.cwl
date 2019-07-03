#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: file pattern searcher
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
baseCommand: grep
inputs:
  pattern:
    type: string
    inputBinding:
      position: 1
  files:
    type: File[]
    inputBinding:
      position: 2
  invert_match:
    type: boolean
    default: false
    inputBinding:
      prefix: --invert-match
outputs:
  output:
    type: stdout
  stderr: stderr
stdout: filtered.txt
stderr: grep-stderr.log
