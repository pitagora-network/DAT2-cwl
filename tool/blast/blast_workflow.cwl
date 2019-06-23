class: Workflow
cwlVersion: v1.0
id: blast_workflow
label: blast_workflow
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: entry_batch_flag
    type: File?
    'sbg:x': -575
    'sbg:y': -402
  - id: db_flag
    type: string
    'sbg:exposed': true
  - id: out_flag_1
    type: string?
    label: out_flag
    'sbg:x': -760
    'sbg:y': -229
  - id: input_pep
    type: File
    'sbg:x': -788.3968505859375
    'sbg:y': -29
  - id: out_flag
    type: string
    'sbg:exposed': true
outputs:
  - id: blastdbcmd_results
    outputSource:
      - blastdbcmd/blastdbcmd_results
    type: File
    'sbg:x': -80
    'sbg:y': -261
  - id: db_dir
    outputSource:
      - makeblastdb/db_dir
    type: Directory?
    'sbg:x': -358.8984375
    'sbg:y': 36.5
steps:
  - id: blastdbcmd
    in:
      - id: blastdb_dir
        source: makeblastdb/db_dir
      - id: db_flag
        source: db_flag
      - id: entry_batch_flag
        source: entry_batch_flag
      - id: out_flag
        source: out_flag
    out:
      - id: blastdbcmd_results
    run: ./blastdbcmd.cwl
    label: Blastdbcmd to dump seqs/info.
    'sbg:x': -302.3984375
    'sbg:y': -260.5
  - id: makeblastdb
    in:
      - id: input_pep
        source: input_pep
      - id: out
        source: out_flag_1
    out:
      - id: db_dir
    run: ./makeblastdb.cwl
    label: makeblastdb
    'sbg:x': -546
    'sbg:y': -123
requirements: []
