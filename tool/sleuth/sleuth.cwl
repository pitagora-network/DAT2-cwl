class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - Rscript
inputs:
  - id: sleuth.R
    type: File
    inputBinding:
      position: 0
  - id: sample.txt
    type: File
    inputBinding:
      position: 1
  - id: target2gene.txt
    type: File
    inputBinding:
      position: 2
  - id: kallisto_out
    type: 'Directory[]'
outputs:
  - id: output
    type: 'Directory[]'
    outputBinding:
      glob: output
label: sleuth
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sleuth
