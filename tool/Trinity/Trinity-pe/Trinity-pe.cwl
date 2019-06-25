class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - Trinity
inputs:
  - id: cpu
    type: int?
    inputBinding:
      position: 5
      prefix: '--CPU'
  - id: fq1
    type: File
    inputBinding:
      position: 3
      prefix: '--left'
      valueFrom: $(self.basename)
  - id: fq2
    type: File
    inputBinding:
      position: 4
      prefix: '--right'
      valueFrom: $(self.basename)
  - id: max_memory
    type: string
    inputBinding:
      position: 2
      prefix: '--max_memory'
  - id: min_contig_length
    type: int?
    inputBinding:
      position: 7
      prefix: '--min_contig_length'
  - id: no_bowtie
    type: boolean?
    inputBinding:
      position: 8
      prefix: '--no_bowtie'
  - id: output_dir
    type: string?
    inputBinding:
      position: 9
      prefix: '--output'
  - id: seq_type
    type: string
    inputBinding:
      position: 1
      prefix: '--seqType'
  - id: ss_lib_type
    type: string?
    inputBinding:
      position: 6
      prefix: '--SS_lib_type'
outputs:
  - id: trinity_results
    type: File
    outputBinding:
      glob: '*/Trinity.fasta'
doc: >-
  test files :
  https://github.com/trinityrnaseq/trinityrnaseq/tree/devel/sample_data/test_Trinity_Assembly
label: Trinity
requirements:
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.fq1)
      - $(inputs.fq2)
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: 'trinityrnaseq/trinityrnaseq:2.8.5'
