class: Workflow
cwlVersion: v1.0
id: blast_workflow
label: blast_workflow
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: input_pep
    type: File
    'sbg:x': -763.8968505859375
    'sbg:y': -110
  - id: entry_batch_flag
    type: File?
    'sbg:x': -561.3968505859375
    'sbg:y': -346.5
  - id: db_flag
    type: string
    'sbg:exposed': true
  - id: out_flag
    type: string
    'sbg:exposed': true
outputs:
  - id: blastdbcmd_results
    outputSource:
      - blastdbcmd/blastdbcmd_results
    type: File
    'sbg:x': -84.3968505859375
    'sbg:y': -274.5
steps:
  - id: makeblastdb
    in:
      - id: input_pep
        source: input_pep
    out:
      - id: db_dir
    run: ./makeblastdb.cwl
    label: makeblastdb
    'sbg:x': -549.8984375
    'sbg:y': -141
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
requirements: []
