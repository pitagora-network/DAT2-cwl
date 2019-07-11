class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: _d_e_seq2
baseCommand:
  - Rscript
inputs:
  - id: DESeq2.R
    type: File
    inputBinding:
      position: 0
  - id: sample2condition.txt
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: DESeq2
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/DESeq2
