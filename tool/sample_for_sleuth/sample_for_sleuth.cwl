class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sample_for_sleuth
baseCommand:
  - sample_for_sleuth.sh
inputs:
  - id: SraRunTable
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output1
    type: File
label: sample_for_sleuth
arguments:
  - position: 0
requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: dat2-cwl/sample_for_sleuth
