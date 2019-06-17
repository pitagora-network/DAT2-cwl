#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: manipulate tape archives
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
  InlineJavascriptRequirement: {}
baseCommand: tar
inputs:
  file:
    type: File
    inputBinding:
      prefix: --file=
      separate: false
  extract:
    type: boolean
    default: false
    inputBinding:
      prefix: -x
  gzip:
    type: boolean
    default: false
    inputBinding:
      prefix: -z
  verbose:
    type: boolean
    default: false
    inputBinding:
      prefix: -v
outputs:
  output:
    type: Directory
    outputBinding:
      glob: |
        ${
          var extlen = inputs.gzip ? 2 : 1;
          return inputs.file.basename.split('.').slice(0, -extlen).join('.');
        }
  stdout: stdout
  stderr: stderr
stdout: tar-stdout.log
stderr: tar-stderr.log
