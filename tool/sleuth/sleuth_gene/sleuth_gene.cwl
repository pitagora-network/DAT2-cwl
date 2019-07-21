class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sleuth_gene
baseCommand:
  - Rscript
  - /workdir/sleuth_gene.R
inputs:
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
    inputBinding:
      position: 3
outputs:
  - id: output_gene
    type: Directory
    outputBinding:
      glob: output_gene
label: sleuth_gene
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sleuth_gene
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.kallisto_out)
        writable: true
