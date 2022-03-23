class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: "https://www.sevenbridges.com/"
id: mkdir_star
baseCommand:
  - bash
  - mkdir_star.sh
inputs: []
outputs:
  - id: STAR_reference
    type: Directory
    outputBinding:
      glob: STAR_reference/
label: mkdir_star
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/mkdir_star:1.0.0
