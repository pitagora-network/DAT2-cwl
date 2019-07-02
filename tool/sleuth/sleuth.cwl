class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - Rscript
inputs:
  - id: sleuth.R
    type: File?
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
    type: 'Directory[]?'
outputs:
  - id: kallisto_res.txt
    type: File
    outputBinding:
      glob: kallisto_res.txt
  - id: LRT_res.sorted.txt
    type: File
    outputBinding:
      glob: LRT_res.sorted.txt
  - id: ENST00000503567.5.png
    type: File
    outputBinding:
      glob: ENST00000503567.5.png
  - id: heatmap.pdf
    type: File
    outputBinding:
      glob: heatmap.pdf
  - id: volcanoplot.png
    type: File
    outputBinding:
      glob: volcanoplot.png
  - id: WT_res.sorted.txt
    type: File
    outputBinding:
      glob: WT_res.sorted.txt
  - id: ENST00000503567.5.pdf
    type: File
    outputBinding:
      glob: ENST00000503567.5.pdf
label: sleuth
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sleuth
  - class: InlineJavascriptRequirement
