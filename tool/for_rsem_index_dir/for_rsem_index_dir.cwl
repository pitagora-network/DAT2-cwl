class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: for_rsem_index_dir_sh
baseCommand:
  - bash
  - for_rsem_index_dir.sh
inputs: []
outputs:
  - id: RSEM_reference
    type: Directory
    outputBinding:
      glob: RSEM_reference/
label: for_rsem_index_dir
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/for_rsem_index_dir
