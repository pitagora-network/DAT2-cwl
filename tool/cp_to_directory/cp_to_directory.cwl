#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.dest_dir)
        writable: true
baseCommand: cp
inputs:
  file:
    type: File
    inputBinding:
      position: 0
  dest_dir:
    type: Directory
    inputBinding:
      position: 1
      valueFrom: $(inputs.dest_dir)
outputs:
  result:
    type: Directory
    outputBinding:
      glob: $(inputs.dest_dir.basename)
  stdout: stdout
  stderr: stderr
stdout: cp-to-directory-stdout.log
stderr: cp-to-directory-stderr.log
