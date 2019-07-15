class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sample2condition
baseCommand:
  - sample2condition.sh
inputs:
  - id: SraRunTable
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output1
    type: File
    outputBinding:
      glob: sample2condition.txt
label: sample2condition
arguments:
  - position: 0
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sample2condition
  - class: InlineJavascriptRequirement
