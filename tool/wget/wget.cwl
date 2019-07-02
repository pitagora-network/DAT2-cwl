#!/usr/bin/env cwl-runner
cwlVersion: v1.0
<<<<<<< HEAD
$namespaces:
  sbg: "https://www.sevenbridges.com/"
baseCommand:
  - wget
=======
class: CommandLineTool
doc: The non-interactive network downloader
requirements:
  DockerRequirement:
    dockerPull: alpine:3.9
  InlineJavascriptRequirement: {}
baseCommand: wget
>>>>>>> 2a96ef0... Update wget.cwl
inputs:
  url:
    doc: Download target URL
    type: string
    inputBinding: {}
  output_name:
    doc: Output file name (use `wget-stdout.txt` by default)
    type: string
    default: wget-stdout.txt
    inputBinding:
<<<<<<< HEAD
      position: 0
      prefix: "--output-document="
      separate: false
      valueFrom: "$(inputs.use_remote_name ? inputs.url.split('/').pop() : self)"
    doc: Output file name (use `wget-stdout.txt` by default)
  - default: false
    id: track_location
    type: boolean
    inputBinding:
      position: 0
      prefix: "--trusted-server-names"
=======
      prefix: --output-document=
      separate: false
      valueFrom: "$(inputs.use_remote_name ? inputs.url.split('/').pop() : self)"
  use_remote_name:
    doc: Use the basename of `url` parameter as an output file name. It is equivalent to `curl -O`.
    type: boolean
    default: false
  track_location:
>>>>>>> 2a96ef0... Update wget.cwl
    doc: Equivalent to `curl -L`
    type: boolean
    default: false
    inputBinding:
      prefix: --trusted-server-names
outputs:
  downloaded:
    type: File
    outputBinding:
<<<<<<< HEAD
      glob: >-
        $(inputs.use_remote_name ? inputs.url.split('/').pop() :
        inputs.output_name)
  - id: stderr
    type: stderr?
doc: The non-interactive network downloader
requirements:
  - class: DockerRequirement
    dockerPull: "alpine:3.9"
  - class: InlineJavascriptRequirement
=======
      glob: "$(inputs.use_remote_name ? inputs.url.split('/').pop() : inputs.output_name)"
  stderr: stderr
>>>>>>> 2a96ef0... Update wget.cwl
stderr: wget-stderr.log
