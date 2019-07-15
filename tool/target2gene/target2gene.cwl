class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - Rscript
  - target2gene.R
inputs:
  - id: target2gene.R
    type: File?
    inputBinding:
      position: 0
outputs:
  - id: target2gene.txt
    type: File
    outputBinding:
      glob: target2gene.txt
label: target2gene
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/target2gene
