class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: blastp
baseCommand:
  - blastp
inputs:
  - id: query
    type: File?
    inputBinding:
      position: 0
      prefix: '-query'
  - id: db
    type: string?
    inputBinding:
      position: 0
      prefix: '-db'
  - id: cpu
    type: int?
    inputBinding:
      position: 0
      prefix: '-num_threads'
  - id: max_target_seqs
    type: int?
    inputBinding:
      position: 0
      prefix: '-max_target_seqs'
  - id: outfmt
    type: int?
    inputBinding:
      position: 0
      prefix: '-outfmt'
  - id: out
    type: string?
  - id: db_dir
    type: Directory?
outputs: []
label: blastp
requirements:
  - class: DockerRequirement
    dockerPull: ncbi/blast
  - class: InlineJavascriptRequirement
stdout: $(inputs.out)
