class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: "https://www.sevenbridges.com/"
id: makeblastdb
baseCommand:
  - bash
  - blast-makeblastdb.sh
inputs:
  - id: input_pep
    type: File
    inputBinding:
      position: 0
  - id: out
    type: string?
    inputBinding:
      position: 0
outputs:
  - id: db_dir
    type: Directory?
    outputBinding:
      glob: blastdb_$(inputs.out)
label: makeblastdb
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/blast-makeblastdb:1.0.0
  - class: InlineJavascriptRequirement
