class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: bootstrap_samples
    type: int?
    'sbg:x': 407.0354919433594
    'sbg:y': 438.946533203125
  - id: index_file
    type: File
    'sbg:x': 407
    'sbg:y': 97
  - id: out_dir_name
    type: string?
    'sbg:x': 154.85536193847656
    'sbg:y': 314.828857421875
  - id: runid
    type: string
    'sbg:x': 71
    'sbg:y': -95
  - id: nthreads
    type: int?
    'sbg:x': 59
    'sbg:y': 43
  - id: split_files
    type: boolean?
    'sbg:x': 116
    'sbg:y': -226
  - id: nthreads_1
    type: int?
    'sbg:x': 666.5654907226562
    'sbg:y': 372.7088623046875
outputs:
  - id: quant_output
    outputSource:
      - kallisto_quant/quant_output
    type: Directory
    'sbg:x': 1052
    'sbg:y': 108
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: 'File[]'
    'sbg:x': 487
    'sbg:y': -209
steps:
  - id: kallisto_quant
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: fq1
        source: fasterq_dump/forward
      - id: fq2
        source: fasterq_dump/reverse
      - id: index_file
        source: index_file
      - id: nthreads
        source: nthreads_1
      - id: out_dir_name
        default: []
        source: out_dir_name
    out:
      - id: quant_output
    run: ../../../tool/kallisto/kallisto_quant-pe/kallisto_quant-pe.cwl
    label: 'kallisto quant: runs the quantification algorithm'
    'sbg:x': 787.4363403320312
    'sbg:y': 105.44190216064453
  - id: fasterq_dump
    in:
      - id: nthreads
        source: nthreads
      - id: split_files
        source: split_files
      - id: runid
        source: runid
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: ../../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fasterq-dump: dump .sra format file to generate fastq file'
    'sbg:x': 326.4195556640625
    'sbg:y': -63.12933349609375
requirements: []
$schemas:
  - 'https://schema.org/version/latest/schemaorg-current-http.rdf'
  - 'http://edamontology.org/EDAM_1.18.owl'
's:author':
  - class: 's:Person'
    's:email': 'mailto:inutano@gmail.com'
    's:identifier': 'https://orcid.org/0000-0003-3777-5945'
    's:name': Tazro Ohta
's:codeRepository': 'https://github.com/pitagora-network/pitagora-cwl'
's:license': 'https://spdx.org/licenses/Apache-2.0'
