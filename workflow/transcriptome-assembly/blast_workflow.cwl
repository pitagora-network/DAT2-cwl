class: Workflow
cwlVersion: v1.0
id: blast_workflow
label: blast_workflow
inputs:
  - id: entry_batch_flag
    type: File?
  - id: db_flag
    type: string
  - id: out_flag_1
    type: string?
    label: out_flag
  - id: input_pep
    type: File
  - id: out_flag
    type: string
outputs:
  - id: blastdbcmd_results
    outputSource:
      - blastdbcmd/blastdbcmd_results
    type: File
  - id: db_dir
    outputSource:
      - makeblastdb/db_dir
    type: Directory?
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
    run: ./blast-blastdbcmd/blastdbcmd.cwl
    label: Blastdbcmd to dump seqs/info.
  - id: makeblastdb
    in:
      - id: input_pep
        source: input_pep
      - id: out
        source: out_flag_1
    out:
      - id: db_dir
    run: ./blast-makeblastdb/makeblastdb.cwl
    label: makeblastdb
requirements: []
