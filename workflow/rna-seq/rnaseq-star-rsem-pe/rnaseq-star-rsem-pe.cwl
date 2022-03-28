class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: split_files
    type: boolean?
  - id: runid
    type: string
  - id: nthreads
    type: int?
  - id: genomeDir
    type: Directory
  - id: nthreads_1
    type: int
  - id: outFileNamePrefix
    type: string?
  - id: outSAMtype
    type: "string[]"
  - id: quantMode
    type: string
  - id: rsem_index_dir
    type: Directory
  - id: rsem_output_prefix
    type: string
  - id: nthreads_2
    type: int
  - id: rsem_index_prefix
    type: string?
outputs:
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: "File[]"
  - id: SJ.out.tab
    outputSource:
      - star_mapping_pe/SJ.out.tab
    type: File?
  - id: readspergene
    outputSource:
      - star_mapping_pe/readspergene
    type: File?
  - id: mappingstats
    outputSource:
      - star_mapping_pe/mappingstats
    type: File?
  - id: Log.progress.out
    outputSource:
      - star_mapping_pe/Log.progress.out
    type: File?
  - id: Log.out
    outputSource:
      - star_mapping_pe/Log.out
    type: File?
  - id: bamRemDups
    outputSource:
      - star_mapping_pe/bamRemDups
    type: File?
  - id: transcript_sorted_bam_bai
    outputSource:
      - rsem_calculate_expression_pe/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam
    outputSource:
      - rsem_calculate_expression_pe/transcript_sorted_bam
    type: File?
  - id: transcript_bam
    outputSource:
      - rsem_calculate_expression_pe/transcript_bam
    type: File
  - id: stat
    outputSource:
      - rsem_calculate_expression_pe/stat
    type: Directory
  - id: isoforms_result
    outputSource:
      - rsem_calculate_expression_pe/isoforms_result
    type: File
  - id: genes_result
    outputSource:
      - rsem_calculate_expression_pe/genes_result
    type: File
  - id: aligned
    outputSource:
      - star_mapping_pe/aligned
    type: File
  - id: transcriptomesam
    outputSource:
      - star_mapping_pe/transcriptomesam
    type: File?
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
    label: "fasterq-dump: dump .sra format file to generate fastq file"
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
      ../../../tool/rsem/rsem_calculate-expression-pe/rsem_calculate-expression-pe.cwl
    label: >-
      rsem-calculate-expression: calculate expression values (BAM input version
      CWL)
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
    run: ../../../tool/star/star_mapping-pe/star_mapping-pe.cwl
    label: "STAR mapping: running mapping jobs."
requirements: []
$schemas:
  - "https://schema.org/version/latest/schemaorg-current-http.rdf"
  - "http://edamontology.org/EDAM_1.18.owl"
"s:author":
  - class: "s:Person"
    "s:email": "mailto:inutano@gmail.com"
    "s:identifier": "https://orcid.org/0000-0003-3777-5945"
    "s:name": Tazro Ohta
"s:codeRepository": "https://github.com/pitagora-network/pitagora-cwl"
"s:license": "https://spdx.org/licenses/Apache-2.0"
