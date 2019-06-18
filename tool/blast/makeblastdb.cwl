class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: makeblastdb
baseCommand:
  - bash
  - makeblastdb.sh
inputs:
  - id: input_pep
    type: File
    inputBinding:
      position: 0
outputs:
  - id: db_dir
    type: Directory?
    outputBinding:
      glob: blastdb
label: makeblastdb
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/blast
