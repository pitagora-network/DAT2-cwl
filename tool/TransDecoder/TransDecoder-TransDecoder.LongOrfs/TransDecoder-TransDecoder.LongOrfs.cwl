class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: transdecoder
baseCommand:
  - TransDecoder.LongOrfs
inputs:
  - id: transcripts
    type: File
    inputBinding:
      position: 0
      prefix: '-t'
  - id: minimum_protein_length
    type: int
    inputBinding:
      position: 0
      prefix: '-m'
outputs:
  - id: output
    type: Directory?
    outputBinding:
      glob: '*.transdecoder_dir'
  - id: pep
    type: File?
    outputBinding:
      glob: '*/longest_orfs.pep'
label: transdecoder
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/transdecoder:5.5.0--0'
