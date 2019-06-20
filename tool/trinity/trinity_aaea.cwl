class: Workflow
cwlVersion: v1.0
id: trinity_aaea
label: trinity_aaea
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fq2
    type: File
    'sbg:x': -920.3968505859375
    'sbg:y': -106.5
  - id: fq1
    type: File
    'sbg:x': -911
    'sbg:y': 44
  - id: cpu
    type: int?
    'sbg:exposed': true
  - id: max_memory
    type: string
    'sbg:exposed': true
  - id: min_contig_length
    type: int?
    'sbg:exposed': true
  - id: seq_type
    type: string
    'sbg:exposed': true
  - id: thread_count
    type: int?
    'sbg:exposed': true
  - id: est_method
    type: string
    'sbg:exposed': true
  - id: kallisto_add_opts
    type: string?
    'sbg:exposed': true
  - id: seqType
    type: string?
    'sbg:exposed': true
  - id: output_dir
    type: string?
    'sbg:exposed': true
outputs:
  - id: output
    outputSource:
      - aaea/output
    type: Directory?
    'sbg:x': -212.3968505859375
    'sbg:y': -74.5
steps:
  - id: trinity_pe
    in:
      - id: cpu
        default: 6
        source: cpu
      - id: fq1
        source: fq1
      - id: fq2
        source: fq2
      - id: max_memory
        default: 30G
        source: max_memory
      - id: min_contig_length
        source: min_contig_length
      - id: seq_type
        source: seq_type
    out:
      - id: trinity_results
    run: ./trinity-pe.cwl
    label: Trinity
    'sbg:x': -727
    'sbg:y': -277
  - id: aaea
    in:
      - id: thread_count
        source: thread_count
      - id: left
        source: fq1
      - id: right
        source: fq2
      - id: est_method
        source: est_method
      - id: kallisto_add_opts
        source: kallisto_add_opts
      - id: prep_reference
        default: true
      - id: output_dir
        source: output_dir
      - id: trinity_dir
        source: trinity_pe/trinity_results
      - id: seqType
        source: seqType
    out:
      - id: output
    run: ./aaea.cwl
    label: aaea
    'sbg:x': -399
    'sbg:y': -72
requirements: []
