class: Workflow
cwlVersion: v1.0
id: transcriptome_assemble
label: transcriptome_assemble
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs: []
outputs: []
steps:
  - id: fasterq_dump
    in: []
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: ../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fastq-dump: dump .sra format file to generate fastq file'
    'sbg:x': -163
    'sbg:y': -5
  - id: gzip
    in:
      - id: input
        source: fasterq_dump/reverse
    out:
      - id: output
    run: ../../tool/gzip/gzip.cwl
    label: gzip
    'sbg:x': 93
    'sbg:y': -106
  - id: gzip_1
    in:
      - id: input
        source: fasterq_dump/forward
    out:
      - id: output
    run: ../../tool/gzip/gzip.cwl
    label: gzip
    'sbg:x': 98
    'sbg:y': 28
requirements: []
