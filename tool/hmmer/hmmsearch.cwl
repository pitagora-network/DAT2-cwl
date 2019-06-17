class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: hmmsearch
baseCommand:
  - hmmsearch
inputs:
  - id: cpu
    type: int?
    inputBinding:
      position: 0
      prefix: '--cpu'
  - id: domtblout
    type: string
    inputBinding:
      position: 0
      prefix: '--domtblout'
  - id: hmm
    type: File
    inputBinding:
      position: 1
  - id: pep
    type: File?
    inputBinding:
      position: 2
outputs: []
label: hmmsearch
requirements:
  - class: DockerRequirement
    dockerPull: 'biocontainers/hmmer:v3.1b2dfsg-5-deb_cv1'
  - class: InlineJavascriptRequirement
stdout: $(inputs.pep.nameroot).$(inputs.hmm.nameroot).log
