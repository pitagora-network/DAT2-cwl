#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - tar
  - xvzf
inputs:
  - id: file
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: .
doc: 'command line: tar'
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
