#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: print newline, word, and byte counts for each file
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
  InlineJavascriptRequirement: {}
baseCommand: wc
inputs:
  file:
    type: File
    inputBinding: {}
outputs:
  lines:
    type: int
    outputBinding:
      loadContents: true
      glob: wc-stdout.txt
      outputEval: $(Number(self[0].contents.trim().split(/\s+/)[0]))
  words:
    type: int
    outputBinding:
      loadContents: true
      glob: wc-stdout.txt
      outputEval: $(Number(self[0].contents.trim().split(/\s+/)[1]))
  bytes:
    type: int
    outputBinding:
      loadContents: true
      glob: wc-stdout.txt
      outputEval: $(Number(self[0].contents.trim().split(/\s+/)[2]))
  stderr: stderr
stdout: wc-stdout.txt
stderr: wc-stderr.log
