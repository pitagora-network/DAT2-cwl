class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: deseq2
baseCommand:
  - Rscript
  - /workdir/deseq2.R
inputs:
  - id: sample2condition.txt
    type: File
    inputBinding:
      position: 1
  - id: target2gene.txt
    type: File
    inputBinding:
      position: 2
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: deseq2
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/deseq2
