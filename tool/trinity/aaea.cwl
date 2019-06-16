class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: aaea
baseCommand:
  - align_and_estimate_abundance.pl
inputs:
  - id: transcript
    type: File
    inputBinding:
      position: 0
      prefix: '--transcripts'
  - id: thread_count
    type: int?
    inputBinding:
      position: 0
      prefix: '--thread_count'
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
    type: string?
    inputBinding:
      position: 6
      prefix: '--kallisto_add_opts'
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
outputs:
  - id: output
    type: Directory?
    outputBinding:
      glob: '${inputs.output_dir}'
label: aaea
requirements:
  - class: DockerRequirement
    dockerPull: 'comics/trinityrnaseq:2.2.0'
  - class: InlineJavascriptRequirement
