class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: gzip
    type: boolean
    default: false
    'sbg:x': 52.37401580810547
    'sbg:y': 564.7362060546875
  - id: nthreads
    type: int
    'sbg:x': -7.204724311828613
    'sbg:y': 408.9173278808594
  - id: repo
    type: string?
    'sbg:x': -130.88583374023438
    'sbg:y': 287.50787353515625
  - id: run_ids
    type: 'string[]'
    'sbg:x': -112.87401580810547
    'sbg:y': -1.2007874250411987
  - id: genomeDir
    type: Directory
    'sbg:x': 286.9881896972656
    'sbg:y': -21.811023712158203
  - id: rsem_index_dir
    type: Directory
    'sbg:x': 545.1929321289062
    'sbg:y': 566.3976440429688
outputs:
  - id: isoforms_result
    outputSource:
      - rsem_calculate_expression_pe/isoforms_result
    type: File
    'sbg:x': 1303.2689208984375
    'sbg:y': 143.02340698242188
  - id: genes_result
    outputSource:
      - rsem_calculate_expression_pe/genes_result
    type: File
    'sbg:x': 1314.0760498046875
    'sbg:y': 276.3108215332031
steps:
  - id: download-sra
    in:
      - id: repo
        source: repo
      - id: run_ids
        source:
          - run_ids
    out:
      - id: sraFiles
    run: >-
      https://raw.githubusercontent.com/pitagora-network/pitagora-cwl/master/tools/download-sra/download-sra.cwl
    label: 'download-sra: A simple download tool to get .sra file'
    'sbg:x': 22.64751434326172
    'sbg:y': 157.15748596191406
  - id: pfastq-dump
    in:
      - id: gzip
        source: gzip
      - id: nthreads
        source: nthreads
      - id: sraFiles
        source:
          - download-sra/sraFiles
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: >-
      https://raw.githubusercontent.com/pitagora-network/pitagora-cwl/master/tools/pfastq-dump/pfastq-dump.cwl
    label: >-
      pfastq-dump: A bash implementation of parallel-fastq-dump, parallel
      fastq-dump wrapper
    'sbg:x': 267.3858337402344
    'sbg:y': 215.3385772705078
  - id: star_mapping_pe
    in:
      - id: fq1
        source: pfastq-dump/forward
      - id: fq2
        source: pfastq-dump/reverse
      - id: genomeDir
        source: genomeDir
    out:
      - id: aligned
      - id: bamRemDups
      - id: mappingstats
      - id: readspergene
      - id: transcriptomesam
    run: ../../../tool/star_pre/star_mapping/star_mapping_pe/star_mapping_pe.cwl
    label: 'STAR mapping: running mapping jobs.'
    'sbg:x': 599.2125854492188
    'sbg:y': 214.60630798339844
  - id: rsem_calculate_expression_pe
    in:
      - id: rsem_index_dir
        source: rsem_index_dir
      - id: bam
        source: star_mapping_pe/transcriptomesam
    out:
      - id: genes_result
      - id: isoforms_result
      - id: stat
      - id: transcript_bam
      - id: transcript_sorted_bam
      - id: transcript_sorted_bam_bai
    run: >-
      ../../../tool/rsem/rsem_calculate-expression/rsem_calculate-expression-pe/rsem_calculate-expression-pe.cwl
    label: >-
      rsem-calculate-expression: calculate expression values (BAM input version
      CWL)
    'sbg:x': 948.2125854492188
    'sbg:y': 259
requirements: []
$schemas:
  - 'https://schema.org/docs/schema_org_rdfa.html'
  - 'http://edamontology.org/EDAM_1.18.owl'
's:author':
  - class: 's:Person'
    's:email': 'mailto:inutano@gmail.com'
    's:identifier': 'https://orcid.org/0000-0003-3777-5945'
    's:name': Tazro Ohta
's:codeRepository': 'https://github.com/pitagora-network/pitagora-cwl'
's:license': 'https://spdx.org/licenses/Apache-2.0'
