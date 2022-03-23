class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: "https://www.sevenbridges.com/"
id: sample_txt
baseCommand:
  - sample_txt.sh
inputs:
  - id: SraRunTable
    type: File
    inputBinding:
      position: 0
outputs:
  - id: sample.txt
    type: File
    outputBinding:
      glob: sample.txt
label: sample_txt
arguments:
  - position: 0
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/sample_txt:1.0.0
  - class: InlineJavascriptRequirement
