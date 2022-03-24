#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
id: sleuth
label: sleuth
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/sleuth:1.0.0
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.kallisto_out)
        writable: true
hints:
  NetworkAcess:
    networkAccess: true
  LoadListingRequirement:
    loadListing: deep_listing
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
    type: "Directory[]"
    inputBinding:
      position: 3
baseCommand:
  - Rscript
  - /workdir/sleuth.R
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
$namespaces:
  sbg: "https://www.sevenbridges.com/"
