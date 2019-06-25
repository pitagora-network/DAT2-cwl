class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: aaea
baseCommand:
  - /usr/local/bin/trinityrnaseq/util/align_and_estimate_abundance.pl
inputs:
  - id: thread_count
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--thread_count'
      valueFrom: $(inputs.cpu)
  - id: left
    type: File
    inputBinding:
      position: 4
      prefix: '--left'
  - id: right
    type: File
    inputBinding:
      position: 4
      prefix: '--right'
  - id: est_method
    type: string
    inputBinding:
      position: 5
      prefix: '--est_method'
  - id: kallisto_add_opts
    type: boolean?
    inputBinding:
      position: 6
      prefix: '--kallisto_add_opts'
      valueFrom: '"-t $(inputs.cpu)"'
  - id: prep_reference
    type: boolean?
    inputBinding:
      position: 7
      prefix: '--prep_reference'
  - id: output_dir
    type: string?
    inputBinding:
      position: 0
      prefix: '--output_dir'
  - id: seqType
    type: string?
    inputBinding:
      position: 0
      prefix: '--seqType'
  - id: transcripts
    type: File
    inputBinding:
      position: 0
      prefix: '--transcripts'
  - id: cpu
    type: int
outputs:
  - id: output
    type: Directory?
    outputBinding:
      glob: $(inputs.output_dir)
label: aaea
requirements:
  - class: DockerRequirement
    dockerPull: 'trinityrnaseq/trinityrnaseq:2.8.5'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.transcripts)
  - class: InlineJavascriptRequirement
