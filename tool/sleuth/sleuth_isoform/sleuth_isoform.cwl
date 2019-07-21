class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sleuth_isoform
baseCommand:
  - Rscript
  - /workdir/sleuth_isoform.R
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
  - id: output_isoform
    type: Directory
    outputBinding:
      glob: output_isoform
label: sleuth_isoform
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sleuth_isoform
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.kallisto_out)
        writable: true
