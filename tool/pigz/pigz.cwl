class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - pigz
  - '-c'
inputs:
  - id: file
    type: File
    inputBinding:
      position: 0
outputs:
  - id: compressed
    type: stdout
requirements:
  - class: DockerRequirement
    dockerPull: genevera/docker-pigz
  - class: InlineJavascriptRequirement
stdout: $(inputs.file.basename).gz
