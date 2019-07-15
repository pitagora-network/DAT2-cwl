#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: decompression tool using Lempel-Ziv coding (LZ77)
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
baseCommand: [gunzip, --stdout]
inputs:
  file:
    type: File
    inputBinding: {}
outputs:
  decompressed: stdout
  stderr: stderr
stdout: $(inputs.file.nameroot)
stderr: gunzip-stderr.log