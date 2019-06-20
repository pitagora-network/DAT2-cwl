#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
  InlineJavascriptRequirement: {}
baseCommand: cp
inputs:
  file:
    type: File
    inputBinding:
      position: 0
  renamed_name:
    type: string
    inputBinding:
      position: 1
      valueFrom: $(runtime.outdir)/$(inputs.renamed_name)
outputs:
  renamed_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir)/$(inputs.renamed_name)
  stdout: stdout
  stderr: stderr
stdout: cp-stdout.log
stderr: cp-stderr.log
