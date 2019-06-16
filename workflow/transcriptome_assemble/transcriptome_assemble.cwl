class: Workflow
cwlVersion: v1.0
id: transcriptome_assemble
label: transcriptome_assemble
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
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
  - id: seq_type
    type: string
    'sbg:exposed': true
  - id: max_memory
    type: string
    'sbg:exposed': true
  - id: cpu
    type: int?
    'sbg:exposed': true
outputs:
  - id: output2
    outputSource:
      - for_trinity/output2
    type: File
    'sbg:x': 750
    'sbg:y': -87
  - id: output1
    outputSource:
      - for_trinity/output1
    type: File
    'sbg:x': 755
    'sbg:y': 325
  - id: reverse
    outputSource:
      - fasterq_dump/reverse
    type: File?
    'sbg:x': -39
    'sbg:y': -77
  - id: forward
    outputSource:
      - fasterq_dump/forward
    type: File?
    'sbg:x': -29
    'sbg:y': 427
  - id: output_2
    outputSource:
      - aaea/output
    type: Directory?
    'sbg:x': 871
    'sbg:y': 588
  - id: trinity_results
    outputSource:
      - trinity_pe/trinity_results
    type: Directory
    'sbg:x': 1083
    'sbg:y': 48
steps:
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
    'sbg:x': 613
    'sbg:y': 210
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
    'sbg:x': -292
    'sbg:y': 196
  - id: aaea
    in:
      - id: transcript
        source: trinity_pe/transcript
      - id: thread_count
        default: 30
      - id: left
        source: trim_galore/out1
      - id: right
        source: trim_galore/out2
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
    'sbg:x': 680
    'sbg:y': 547
  - id: trinity_pe
    in:
      - id: cpu
        default: 30
        source: cpu
      - id: fq1
        source: for_trinity/output1
      - id: fq2
        source: for_trinity/output2
      - id: max_memory
        source: max_memory
      - id: seq_type
        source: seq_type
    out:
      - id: trinity_results
      - id: transcript
    run: ../../tool/trinity/trinity-pe.cwl
    'sbg:x': 901
    'sbg:y': 217
  - id: pigz
    in:
      - id: file
        source: fasterq_dump/reverse
    out:
      - id: compressed
    run: ../../tool/pigz/pigz.cwl
    'sbg:x': -3
    'sbg:y': 114
  - id: pigz_1
    in:
      - id: file
        source: fasterq_dump/forward
    out:
      - id: compressed
    run: ../../tool/pigz/pigz.cwl
    'sbg:x': 14.3231201171875
    'sbg:y': 277.5
  - id: trim_galore
    in:
      - id: read1
        source: pigz_1/compressed
      - id: read2
        source: pigz/compressed
      - id: fastqc
        default: true
      - id: trim1
        default: true
    out:
      - id: out1
      - id: out2
    run: ../../tool/trim_galore/trim_galore_PE.cwl
    label: trim_galore
    'sbg:x': 274.328125
    'sbg:y': 228.5
requirements: []
