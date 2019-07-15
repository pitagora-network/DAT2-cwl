class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: mkdir_rsem
baseCommand:
  - bash
  - mkdir_rsem.sh
inputs: []
outputs:
  - id: RSEM_reference
    type: Directory
    outputBinding:
      glob: RSEM_reference/
label: mkdir_rsem
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/mkdir_rsem
