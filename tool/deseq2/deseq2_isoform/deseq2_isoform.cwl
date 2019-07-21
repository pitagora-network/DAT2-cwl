class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: deseq2_isoform
baseCommand:
  - Rscript
  - /workdir/deseq2_isoform.R
inputs:
  - id: sample2condition.txt
    type: File
    inputBinding:
      position: 1
  - id: target2gene.txt
    type: File?
    inputBinding:
      position: 2
  - id: rsem_out
    type: 'File[]'
    inputBinding:
      position: 3
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: deseq2_isoform
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/deseq2_isoform
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.rsem_out)
        writable: true
  - class: InlineJavascriptRequirement
