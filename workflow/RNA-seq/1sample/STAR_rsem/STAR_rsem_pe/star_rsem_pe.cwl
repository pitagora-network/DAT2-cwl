class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: split_files
    type: boolean?
    'sbg:x': 63.578125
    'sbg:y': -170.5
  - id: runid
    type: string
    'sbg:x': -53
    'sbg:y': -51
  - id: nthreads
    type: int?
    'sbg:x': 49
    'sbg:y': 16
  - id: outSAMtype
    type: 'string[]'
    'sbg:x': 594.737548828125
    'sbg:y': -139.2462615966797
  - id: nthreads_1
    type: int
    'sbg:x': 442.49749755859375
    'sbg:y': -188.26368713378906
  - id: outFileNamePrefix
    type: string?
    'sbg:x': 702.6878051757812
    'sbg:y': -279.81964111328125
  - id: quantMode
    type: string
    'sbg:x': 863.7288818359375
    'sbg:y': -276.7984924316406
  - id: rsem_output_prefix
    type: string
    'sbg:x': 1351.030517578125
    'sbg:y': -117.96273803710938
  - id: nthreads_2
    type: int
    'sbg:x': 1214.0328369140625
    'sbg:y': 306.4683837890625
  - id: reference_prefix
    type: string
    'sbg:x': 897.921142578125
    'sbg:y': 498.4407653808594
  - id: num_threads
    type: int?
    'sbg:x': 1015.3621826171875
    'sbg:y': 822.696044921875
  - id: rsem_index_prefix
    type: string?
    'sbg:x': 1298.7064208984375
    'sbg:y': 57.05970001220703
  - id: runThreadN
    type: string?
    'sbg:x': 382.23968505859375
    'sbg:y': 185.78221130371094
  - id: url
    type: string
    'sbg:x': -192.08668518066406
    'sbg:y': 250.10882568359375
  - id: output_name
    type: string
    'sbg:x': -180.9623260498047
    'sbg:y': 401.9412536621094
  - id: url_1
    type: string
    'sbg:x': -216.14300537109375
    'sbg:y': 561.18017578125
  - id: output_name_1
    type: string
    'sbg:x': -168.0010223388672
    'sbg:y': 709.3093872070312
outputs:
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: 'File[]'
    'sbg:x': 397.6965026855469
    'sbg:y': -337.4228820800781
  - id: rsem_index_1
    outputSource:
      - rsem_index/rsem_index
    type: Directory
    'sbg:x': 1353.44140625
    'sbg:y': 675.0596923828125
  - id: transcript_sorted_bam_bai
    outputSource:
      - rsem_calculate_expression_pe/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 1716.6353759765625
    'sbg:y': -182.92042541503906
  - id: transcript_sorted_bam
    outputSource:
      - rsem_calculate_expression_pe/transcript_sorted_bam
    type: File?
    'sbg:x': 1723.2149658203125
    'sbg:y': -30.273653030395508
  - id: transcript_bam
    outputSource:
      - rsem_calculate_expression_pe/transcript_bam
    type: File
    'sbg:x': 1746.901611328125
    'sbg:y': 114.47759246826172
  - id: stat
    outputSource:
      - rsem_calculate_expression_pe/stat
    type: Directory
    'sbg:x': 1739.006103515625
    'sbg:y': 252.64923095703125
  - id: isoforms_result
    outputSource:
      - rsem_calculate_expression_pe/isoforms_result
    type: File
    'sbg:x': 1731.110595703125
    'sbg:y': 398.7164001464844
  - id: genes_result
    outputSource:
      - rsem_calculate_expression_pe/genes_result
    type: File
    'sbg:x': 1727.1627197265625
    'sbg:y': 539.5089721679688
  - id: transcriptomesam
    outputSource:
      - star_mapping_pe/transcriptomesam
    type: File?
    'sbg:x': 1093.938232421875
    'sbg:y': -435
  - id: SJ.out.tab
    outputSource:
      - star_mapping_pe/SJ.out.tab
    type: File?
    'sbg:x': 1149.4737548828125
    'sbg:y': -306.6141052246094
  - id: mappingstats
    outputSource:
      - star_mapping_pe/mappingstats
    type: File?
    'sbg:x': 1183.6876220703125
    'sbg:y': -178.96981811523438
  - id: Log.progress.out
    outputSource:
      - star_mapping_pe/Log.progress.out
    type: File?
    'sbg:x': 1149.4737548828125
    'sbg:y': -55.27329635620117
  - id: Log.out
    outputSource:
      - star_mapping_pe/Log.out
    type: File?
    'sbg:x': 1109.99609375
    'sbg:y': 78.9505844116211
  - id: bamRemDups
    outputSource:
      - star_mapping_pe/bamRemDups
    type: File?
    'sbg:x': 1075.3731689453125
    'sbg:y': 216.52487182617188
  - id: aligned
    outputSource:
      - star_mapping_pe/aligned
    type: File
    'sbg:x': 887.6240234375
    'sbg:y': 174.61489868164062
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
    'sbg:x': 57.46524429321289
    'sbg:y': 390.6058044433594
  - id: downloaded_1
    outputSource:
      - wget_1/downloaded
    type: File
    'sbg:x': 93.07672119140625
    'sbg:y': 740.7868041992188
  - id: starIndex
    outputSource:
      - star_index/starIndex
    type: Directory
    'sbg:x': 717.4619140625
    'sbg:y': 656.6461791992188
steps:
  - id: star_mapping_pe
    in:
      - id: fq1
        source: fasterq_dump/forward
      - id: fq2
        source: fasterq_dump/reverse
      - id: genomeDir
        source: star_index/starIndex
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
    run: >-
      ../../../../../tool/star/star_mapping/star_mapping_pe/star_mapping_pe.cwl
    label: 'STAR mapping: running mapping jobs.'
    'sbg:x': 841.53271484375
    'sbg:y': -26.69127655029297
  - id: rsem_index
    in:
      - id: gtf
        source: gunzip/decompressed
      - id: reference_fasta
        source: gunzip_1/decompressed
      - id: num_threads
        source: num_threads
      - id: reference_dir
        source: for_rsem_index_dir_sh/RSEM_reference
      - id: reference_prefix
        source: reference_prefix
    out:
      - id: rsem_index
    run: ../../../../../tool/rsem/rsem_index/rsem_index.cwl
    label: 'rsem-prepare-reference: preparing reference sequences'
    'sbg:x': 1066.9779052734375
    'sbg:y': 564.1251831054688
  - id: rsem_calculate_expression_pe
    in:
      - id: nthreads
        source: nthreads_2
      - id: rsem_index_dir
        source: rsem_index/rsem_index
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
      ../../../../../tool/rsem/rsem_calculate-expression/rsem_calculate-expression-pe/rsem_calculate-expression-pe.cwl
    label: >-
      rsem-calculate-expression: calculate expression values (BAM input version
      CWL)
    'sbg:x': 1466.7064208984375
    'sbg:y': 145.46517944335938
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
    run: ../../../../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fasterq-dump: dump .sra format file to generate fastq file'
    'sbg:x': 241
    'sbg:y': -88.47512817382812
  - id: for_star_index_dir_sh
    in: []
    out:
      - id: STAR_reference
    run: ../../../../../tool/for_star_index_dir/for_star_index_dir.cwl
    label: for_star_index_dir
    'sbg:x': 448.2990417480469
    'sbg:y': 668.261474609375
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../../../tool/gunzip/gunzip.cwl
    'sbg:x': 235.87713623046875
    'sbg:y': 312.9230041503906
  - id: gunzip_1
    in:
      - id: file
        source: wget_1/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../../../tool/gunzip/gunzip.cwl
    'sbg:x': 314.4669189453125
    'sbg:y': 570.039794921875
  - id: for_rsem_index_dir_sh
    in: []
    out:
      - id: RSEM_reference
    run: ../../../../../tool/for_rsem_index_dir/for_rsem_index_dir.cwl
    label: for_rsem_index_dir
    'sbg:x': 750.696044921875
    'sbg:y': 917.0963134765625
  - id: star_index
    in:
      - id: genomeDir
        source: for_star_index_dir_sh/STAR_reference
      - id: genomeFastaFiles
        source: gunzip_1/decompressed
      - id: runThreadN
        source: runThreadN
      - id: sjdbGTFfile
        source: gunzip/decompressed
    out:
      - id: starIndex
    run: ../../../../../tool/star/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': 608.2809448242188
    'sbg:y': 366.4420166015625
  - id: wget
    in:
      - id: output_name
        source: output_name
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../../../../tool/wget/wget.cwl
    'sbg:x': -58.83025360107422
    'sbg:y': 321.8041076660156
  - id: wget_1
    in:
      - id: output_name
        source: output_name_1
      - id: url
        source: url_1
    out:
      - id: downloaded
      - id: stderr
    run: ../../../../../tool/wget/wget.cwl
    'sbg:x': -47.54941940307617
    'sbg:y': 583.1447143554688
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
