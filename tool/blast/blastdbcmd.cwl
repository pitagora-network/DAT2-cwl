class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - blastdbcmd
inputs:
  - id: blastdb_dir
    type: Directory
  - id: db_flag
    type: string
    inputBinding:
      position: 3
      prefix: '-db'
  - id: entry_batch_flag
    type: File?
    inputBinding:
      position: 2
      prefix: '-entry_batch'
  - id: entry_flag
    type: string?
    inputBinding:
      position: 1
      prefix: '-entry'
  - default: blastdbcmd.out
    id: out_flag
    type: string
    inputBinding:
      position: 5
      prefix: '-out'
  - id: outfmt_flag
    type: string?
    inputBinding:
      position: 6
      prefix: '-outfmt'
  - id: target_flag
    type: boolean?
    inputBinding:
      position: 4
      prefix: '-target_only'
  - id: taxids_flag
    type: string?
    inputBinding:
      position: 4
      prefix: '-taxids'
outputs:
  - id: blastdbcmd_results
    type: File
    outputBinding:
      glob: $(inputs.out_flag)
label: Blastdbcmd to dump seqs/info.
requirements:
  - class: EnvVarRequirement
    envDef:
      - envName: BLASTDB
        envValue: $(inputs.blastdb_dir.path)
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: ncbi/blast
'sbg:links':
  - id: >-
      https://github.com/ncbi/cwl-demos/blob/0d2a5b145fce0e8424b7cebc4d2881cc30e40ca4/blast-pipelines/blastdbcmd_docker.cwl
    label: ''
'sbg:toolAuthor': ncbi tom6931
