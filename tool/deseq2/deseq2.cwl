class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: "https://www.sevenbridges.com/"
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
    type: File?
    inputBinding:
      position: 2
  - id: rsem_out
    type: "File[]"
    inputBinding:
      position: 3
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: deseq2
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/deseq2:1.0.0
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.rsem_out)
        writable: true
  - class: InlineJavascriptRequirement
