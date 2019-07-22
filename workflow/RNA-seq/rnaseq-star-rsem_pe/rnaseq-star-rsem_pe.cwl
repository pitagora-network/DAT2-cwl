class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: split_files
    type: boolean?
    'sbg:x': -30.349365234375
    'sbg:y': -42.816593170166016
  - id: runid
    type: string
    'sbg:x': -116.53096008300781
    'sbg:y': 117.61375427246094
  - id: nthreads
    type: int?
    'sbg:x': -68.43781280517578
    'sbg:y': 255
  - id: genomeDir
    type: Directory
    'sbg:x': 368.01031494140625
    'sbg:y': 404.5412292480469
  - id: nthreads_1
    type: int
    'sbg:x': 309.0735168457031
    'sbg:y': 12.869974136352539
  - id: outFileNamePrefix
    type: string?
    'sbg:x': 484.75372314453125
    'sbg:y': -256.9253845214844
  - id: outSAMtype
    type: 'string[]'
    'sbg:x': 431.78607177734375
    'sbg:y': -56.02238845825195
  - id: quantMode
    type: string
    'sbg:x': 605.236328125
    'sbg:y': -239.85572814941406
  - id: rsem_index_dir
    type: Directory
    'sbg:x': 724.071044921875
    'sbg:y': 613.4893798828125
  - id: rsem_output_prefix
    type: string
    'sbg:x': 952.1207885742188
    'sbg:y': 699.6709594726562
  - id: nthreads_2
    type: int
    'sbg:x': 772.1691284179688
    'sbg:y': 393.73382568359375
  - id: rsem_index_prefix
    type: string?
    'sbg:x': 607
    'sbg:y': 507.3333435058594
outputs:
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: 'File[]'
    'sbg:x': 222.8919219970703
    'sbg:y': -201.9210662841797
  - id: SJ.out.tab
    outputSource:
      - star_mapping_pe/SJ.out.tab
    type: File?
    'sbg:x': 998.383056640625
    'sbg:y': -463.7437744140625
  - id: readspergene
    outputSource:
      - star_mapping_pe/readspergene
    type: File?
    'sbg:x': 963.5945434570312
    'sbg:y': -332.9801025390625
  - id: mappingstats
    outputSource:
      - star_mapping_pe/mappingstats
    type: File?
    'sbg:x': 1072.7750244140625
    'sbg:y': -250.97923278808594
  - id: Log.progress.out
    outputSource:
      - star_mapping_pe/Log.progress.out
    type: File?
    'sbg:x': 1023.7177734375
    'sbg:y': -130.32501220703125
  - id: Log.out
    outputSource:
      - star_mapping_pe/Log.out
    type: File?
    'sbg:x': 966.7053833007812
    'sbg:y': 12.869019508361816
  - id: bamRemDups
    outputSource:
      - star_mapping_pe/bamRemDups
    type: File?
    'sbg:x': 1153.653076171875
    'sbg:y': -14.974264144897461
  - id: transcript_sorted_bam_bai
    outputSource:
      - rsem_calculate_expression_pe/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 1474.5137939453125
    'sbg:y': -215.18072509765625
  - id: transcript_sorted_bam
    outputSource:
      - rsem_calculate_expression_pe/transcript_sorted_bam
    type: File?
    'sbg:x': 1465.232666015625
    'sbg:y': -25.58123016357422
  - id: transcript_bam
    outputSource:
      - rsem_calculate_expression_pe/transcript_bam
    type: File
    'sbg:x': 1559.3695068359375
    'sbg:y': 64.57797241210938
  - id: stat
    outputSource:
      - rsem_calculate_expression_pe/stat
    type: Directory
    'sbg:x': 1478.491455078125
    'sbg:y': 193.1874237060547
  - id: isoforms_result
    outputSource:
      - rsem_calculate_expression_pe/isoforms_result
    type: File
    'sbg:x': 1575.280029296875
    'sbg:y': 332.4038391113281
  - id: genes_result
    outputSource:
      - rsem_calculate_expression_pe/genes_result
    type: File
    'sbg:x': 1449.322265625
    'sbg:y': 438.4735107421875
  - id: aligned
    outputSource:
      - star_mapping_pe/aligned
    type: File
    'sbg:x': 592.5216674804688
    'sbg:y': 358.278076171875
  - id: transcriptomesam
    outputSource:
      - star_mapping_pe/transcriptomesam
    type: File?
    'sbg:x': 810.0989990234375
    'sbg:y': -472.29791259765625
steps:
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
    'sbg:x': 138.03628540039062
    'sbg:y': 124.2431411743164
  - id: rsem_calculate_expression_pe
    in:
      - id: nthreads
        source: nthreads_2
      - id: rsem_index_dir
        source: rsem_index_dir
      - id: rsem_index_prefix
        source: rsem_index_prefix
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
      ../../../tool/rsem:rsem_calculate-expression:rsem_calculate-expression_pe/rsem_calculate-expression_pe.cwl
    label: >-
      rsem-calculate-expression: calculate expression values (BAM input version
      CWL)
    'sbg:x': 1261.5155029296875
    'sbg:y': 229.28866577148438
  - id: star_mapping_pe
    in:
      - id: fq1
        source: fasterq_dump/forward
      - id: fq2
        source: fasterq_dump/reverse
      - id: genomeDir
        source: genomeDir
      - id: nthreads
        source: nthreads_1
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
      - id: Log.out
      - id: Log.progress.out
      - id: SJ.out.tab
    run: ../../../tool/star:star_mapping:star_mapping_pe/star_mapping_pe.cwl
    label: 'STAR mapping: running mapping jobs.'
    'sbg:x': 645.68408203125
    'sbg:y': 171.9577178955078
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
