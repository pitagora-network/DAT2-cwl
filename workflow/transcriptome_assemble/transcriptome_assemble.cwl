class: Workflow
cwlVersion: v1.0
id: transcriptome_assemble
label: transcriptome_assemble
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: max_memory
    type: string
    'sbg:exposed': true
  - id: cpu
    type: int?
    'sbg:exposed': true
  - id: runid
    type: string
    'sbg:exposed': true
outputs:
  - id: out2
    outputSource:
      - trim_galore/out2
    type: File
    'sbg:x': 625.5230712890625
    'sbg:y': -91
  - id: out1
    outputSource:
      - trim_galore/out1
    type: File
    'sbg:x': 614.5230712890625
    'sbg:y': 225
  - id: output2
    outputSource:
      - for_trinity/output2
    type: File
    'sbg:x': 817.5230712890625
    'sbg:y': -93
  - id: output1
    outputSource:
      - for_trinity/output1
    type: File
    'sbg:x': 841.5230712890625
    'sbg:y': 227
  - id: reverse
    outputSource:
      - fasterq_dump/reverse
    type: File?
    'sbg:x': 142
    'sbg:y': -72
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: 'File[]'
    'sbg:x': 156
    'sbg:y': 165
steps:
  - id: trim_galore
    in:
      - id: read1
        source: fasterq_dump/forward
      - id: read2
        source: fasterq_dump/reverse
    out:
      - id: out1
      - id: out2
    run: ../../tool/trim_galore/trim_galore_PE.cwl
    label: trim_galore
    'sbg:x': 464.015625
    'sbg:y': 46.5
  - id: for_trinity
    in:
      - id: IN1
        source: trim_galore/out1
      - id: IN2
        source: trim_galore/out2
    out:
      - id: output1
      - id: output2
    run: ../../tool/for_trinity/for_trinity.cwl
    label: for_trinity
    'sbg:x': 703
    'sbg:y': 64
  - id: trinity_pe
    in:
      - id: cpu
        source: cpu
      - id: fq1
        source: for_trinity/output1
      - id: fq2
        source: for_trinity/output2
      - id: max_memory
        source: max_memory
      - id: seq_type
        default: fq
    out:
      - id: trinity_results
    run: ../../tool/trinity/trinity-pe.cwl
    'sbg:x': 869
    'sbg:y': 56
  - id: fasterq_dump
    in:
      - id: split_files
        default: true
      - id: runid
        source: runid
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: ../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fastq-dump: dump .sra format file to generate fastq file'
    'sbg:x': -106
    'sbg:y': 108
requirements: []
