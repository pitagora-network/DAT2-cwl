class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: genomeDir
    type: Directory
    'sbg:x': 286.9881896972656
    'sbg:y': -21.811023712158203
  - id: rsem_index_dir
    type: Directory
    'sbg:x': 617.8842163085938
    'sbg:y': 600.9019775390625
  - id: runid
    type: string
    'sbg:x': -86
    'sbg:y': 208.0264129638672
  - id: split_files
    type: boolean?
    'sbg:x': -50.37736129760742
    'sbg:y': 59.1987419128418
  - id: nthreads
    type: int
    'sbg:x': 362.7591247558594
    'sbg:y': -111.05148315429688
  - id: quantMode
    type: string
    'sbg:x': 728.74072265625
    'sbg:y': -177.4481201171875
  - id: outFileNamePrefix
    type: string?
    'sbg:x': 392.72418212890625
    'sbg:y': -254
  - id: outSAMtype
    type: 'string[]'
    'sbg:x': 507.32781982421875
    'sbg:y': -356.18963623046875
  - id: nthreads_1
    type: int
    'sbg:x': 846.3884887695312
    'sbg:y': 603.825927734375
  - id: rsem_output_prefix
    type: string
    'sbg:x': 383.0170593261719
    'sbg:y': 439.4827880859375
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
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: 'File[]'
    'sbg:x': 202.89132690429688
    'sbg:y': 382.14996337890625
steps:
  - id: star_mapping_pe
    in:
      - id: fq1
        source: fasterq_dump/forward
      - id: fq2
        source: fasterq_dump/reverse
      - id: genomeDir
        source: genomeDir
      - id: nthreads
        source: nthreads
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: outFileNamePrefix
        source: outFileNamePrefix
    out:
      - id: aligned
      - id: bamRemDups
      - id: mappingstats
      - id: readspergene
      - id: transcriptomesam
    run: ../../../tool/star_pre/star_mapping/star_mapping_pe/star_mapping_pe.cwl
    label: 'STAR mapping: running mapping jobs.'
    'sbg:x': 602.6754760742188
    'sbg:y': 169.8943328857422
  - id: rsem_calculate_expression_pe
    in:
      - id: nthreads
        source: nthreads_1
      - id: rsem_index_dir
        source: rsem_index_dir
      - id: rsem_output_prefix
        source: rsem_output_prefix
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
  - id: fasterq_dump
    in:
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
    'sbg:x': 163.41006469726562
    'sbg:y': 204.14590454101562
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
