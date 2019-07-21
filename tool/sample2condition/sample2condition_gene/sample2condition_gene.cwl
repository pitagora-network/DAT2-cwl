class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sample2condition_gene
baseCommand:
  - sample2condition_gene.sh
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
label: sample2condition_gene
arguments:
  - position: 0
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sample2condition_gene
  - class: InlineJavascriptRequirement
