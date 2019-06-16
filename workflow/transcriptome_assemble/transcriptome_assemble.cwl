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
  - id: split_spot
    type: boolean?
    'sbg:exposed': true
  - id: split_files
    type: boolean?
    'sbg:exposed': true
  - id: split_3
    type: boolean?
    'sbg:exposed': true
  - id: skip_technical
    type: boolean?
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
    'sbg:x': -38.3668212890625
    'sbg:y': -74
  - id: forward
    outputSource:
      - fasterq_dump/forward
    type: File?
    'sbg:x': 39.6331787109375
    'sbg:y': 306
  - id: output
    outputSource:
      - gzip/output
    type: File
    'sbg:x': 244.6331787109375
    'sbg:y': -88
  - id: output_1
    outputSource:
      - gzip_1/output
    type: File
    'sbg:x': 362.6331787109375
    'sbg:y': 335
  - id: trinity_results
    outputSource:
      - trinity_pe/trinity_results
    type: Directory
    'sbg:x': 1017.6331787109375
    'sbg:y': -159
  - id: output_2
    outputSource:
      - aaea/output
    type: Directory?
    'sbg:x': 1244
    'sbg:y': 493
steps:
  - id: trim_galore
    in:
      - id: read1
        source: gzip_1/output
      - id: read2
        source: gzip/output
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
      - id: skip_technical
        source: skip_technical
      - id: split_3
        source: split_3
      - id: split_files
        source: split_files
      - id: split_spot
        source: split_spot
      - id: runid
        source: runid
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: ../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fasterq-dump: dump .sra format file to generate fastq file'
    'sbg:x': -128
    'sbg:y': 78
  - id: gzip
    in:
      - id: input
        source: fasterq_dump/reverse
    out:
      - id: output
    run: ../../tool/gzip/gzip.cwl
    label: gzip
    'sbg:x': 137.6328125
    'sbg:y': 1
  - id: gzip_1
    in:
      - id: input
        source: fasterq_dump/forward
    out:
      - id: output
    run: ../../tool/gzip/gzip.cwl
    label: gzip
    'sbg:x': 144
    'sbg:y': 137
  - id: aaea
    in:
      - id: transcript
        source: trinity_pe/trinity_results
      - id: thread_count
        default: 30
      - id: left
        source: trim_galore/out2
      - id: right
        source: trim_galore/out1
      - id: est_method
        default: kallisto
      - id: kallisto_add_opts
        default: '"-t 30"'
      - id: output_dir
        default: kallisto_out
    out:
      - id: output
    run: ../../tool/trinity/aaea.cwl
    label: aaea
    'sbg:x': 993
    'sbg:y': 467
requirements: []
