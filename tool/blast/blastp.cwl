class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - blastp
inputs:
  - id: blastdb_dir
    type: Directory?
  - id: db_flag
    type: string
    inputBinding:
      position: 2
      prefix: '-db'
  - default: 4
    id: num_threads_flag
    type: int?
    inputBinding:
      position: 3
      prefix: '-num_threads'
  - default: blastp.out
    id: out_flag
    type: string
    inputBinding:
      position: 6
      prefix: '-out'
  - default: 6 qaccver saccver bitscore pident qcovhsp qlen length
    id: outfmt_flag
    type: string
    inputBinding:
      position: 7
      prefix: '-outfmt'
  - id: query_flag
    type: File
    inputBinding:
      position: 1
      prefix: '-query'
  - default: blastp
    id: task_flag
    type: string?
    inputBinding:
      position: 4
      prefix: '-task'
  - id: taxid_flag
    type: string?
    inputBinding:
      position: 5
      prefix: '-taxids'
  - id: max_target_seqs
    type: int?
    inputBinding:
      position: 6
      prefix: '-max_target_seqs'
outputs:
  - id: blast_results
    type: File
    outputBinding:
      glob: $(inputs.out_flag)
label: BLASTP search.
requirements:
  - class: EnvVarRequirement
    envDef:
      - envName: BLASTDB
        envValue: $(inputs.blastdb_dir.path)
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/blast:2.9.0--pl526h979a64d_3'
