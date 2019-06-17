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
      position: 4
      prefix: '--CPU'
  - id: fq
    type: File
    inputBinding:
      position: 3
      prefix: '--single'
      valueFrom: $(self.basename)
  - id: max_memory
    type: string
    inputBinding:
      position: 2
      prefix: '--max_memory'
  - id: min_contig_length
    type: int
    inputBinding:
      position: 6
      prefix: '--min_contig_length'
  - id: no_bowtie
    type: boolean?
    inputBinding:
      position: 7
      prefix: '--no_bowtie'
  - id: output_dir
    type: string
    inputBinding:
      position: 8
      prefix: '--output'
  - id: seq_type
    type: string
    inputBinding:
      position: 1
      prefix: '--seqType'
  - id: ss_lib_type
    type: string?
    inputBinding:
      position: 5
      prefix: '--SS_lib_type'
outputs:
  - id: trinity_results
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)
requirements:
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.fq)
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: 'trinityrnaseq/trinityrnaseq:2.8.5'
