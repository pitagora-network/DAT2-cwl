class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: makeblastdb
baseCommand:
  - makeblastdb
inputs:
  - id: pep
    type: File
    inputBinding:
      position: 0
      prefix: '-in'
  - id: out
    type: string?
    inputBinding:
      position: 1
      prefix: '-out'
  - id: dtbype
    type: string?
    inputBinding:
      position: 2
      prefix: '-dbtype'
  - id: hash_index
    type: boolean?
    inputBinding:
      position: 4
      prefix: '-hash_index'
  - id: parse_seqids
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-parse_seqids'
outputs: []
label: makeblastdb
requirements:
  - class: DockerRequirement
    dockerPull: 'biocontainers/blast:v2.2.31_cv2'
