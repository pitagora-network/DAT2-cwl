class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sleuth
baseCommand:
  - Rscript
  - /workdir/sleuthm.R
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
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: sleuth
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/sleuth
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.kallisto_out)
        writable: true
