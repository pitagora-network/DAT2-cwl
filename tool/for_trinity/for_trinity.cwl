class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: "https://www.sevenbridges.com/"
id: for_trinity
baseCommand:
  - for_trinity.sh
inputs:
  - id: IN1
    type: File
    inputBinding:
      position: 0
  - id: IN2
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output1
    type: File
    outputBinding:
      glob: "*_1.fq.gz"
  - id: output2
    type: File
    outputBinding:
      glob: "*_2.fq.gz"
label: for_trinity
arguments:
  - position: 0
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/for_trinity:1.0.0
