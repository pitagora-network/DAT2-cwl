class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - gunzip
inputs:
  - id: file
    type: File
    inputBinding:
      position: 0
outputs:
  - id: decompressed
    type: File
  - id: stderr
    type: stderr
doc: decompression tool using Lempel-Ziv coding (LZ77)
requirements:
  - class: DockerRequirement
    dockerPull: 'alpine:3.9'
  - class: InlineJavascriptRequirement
#stderr: gunzip-stderr.log
