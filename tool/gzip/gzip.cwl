#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: compression/decompression tool using Lempel-Ziv coding (LZ77)
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
baseCommand: [gzip, -c]
inputs:
  file:
    type: File
    inputBinding: {}
outputs:
  compressed: stdout
  stderr: stderr
stdout: $(inputs.file.basename).gz
stderr: gzip-stderr.log
