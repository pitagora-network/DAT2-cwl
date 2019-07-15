class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: for_star_index_dir_sh
baseCommand:
  - bash
  - for_star_index_dir.sh
inputs: []
outputs:
  - id: STAR_reference
    type: Directory
    outputBinding:
      glob: STAR_reference/
label: for_star_index_dir
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/for_star_index_dir
