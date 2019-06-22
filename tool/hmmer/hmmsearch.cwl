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
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: $(inputs.domtblout)
label: hmmsearch
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/hmmer:3.2.1--hf484d3e_1'
  - class: InlineJavascriptRequirement
stdout: $(inputs.pep.nameroot).$(inputs.hmm.nameroot).log
