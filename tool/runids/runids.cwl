class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: runids
baseCommand:
  - runids.sh
inputs:
  - id: SraRunTable
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output1
    type: File
label: runids
arguments:
  - position: 0
requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: dat2-cwl/runids
