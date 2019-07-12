class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - wget
inputs:
  - default: wget-stdout.txt
    id: output_name
    type: string
    inputBinding:
      position: 0
      prefix: '--output-document='
      separate: false
      valueFrom: '$(inputs.use_remote_name ? inputs.url.split(''/'').pop() : self)'
    doc: Output file name (use `wget-stdout.txt` by default)
  - default: false
    id: track_location
    type: boolean
    inputBinding:
      position: 0
      prefix: '--trusted-server-names'
    doc: Equivalent to `curl -L`
  - id: url
    type: string
    inputBinding:
      position: 0
    doc: Download target URL
  - default: false
    id: use_remote_name
    type: boolean
    doc: >-
      Use the basename of `url` parameter as an output file name. It is
      equivalent to `curl -O`.
outputs:
  - id: downloaded
    type: File
    outputBinding:
      glob: >-
        $(inputs.use_remote_name ? inputs.url.split('/').pop() :
        inputs.output_name)
  - id: stderr
    type: stderr?
doc: The non-interactive network downloader
requirements:
  - class: DockerRequirement
    dockerPull: 'alpine:3.9'
  - class: InlineJavascriptRequirement
stderr: wget-stderr.log
