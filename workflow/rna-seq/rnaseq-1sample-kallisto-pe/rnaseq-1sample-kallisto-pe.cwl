class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: bootstrap_samples
    type: int?
  - id: out_dir_name
    type: string?
  - id: runid
    type: string
  - id: nthreads
    type: int?
  - id: split_files
    type: boolean?
  - id: index_name
    type: string?
  - id: url
    type: string
  - id: output_name
    type: string
  - id: nthreads_1
    type: int?
outputs:
  - id: quant_output
    outputSource:
      - kallisto_quant/quant_output
    type: Directory
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: "File[]"
  - id: index_file
    outputSource:
      - kallisto_index/index_file
    type: File
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
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
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads_1
      - id: out_dir_name
        source: out_dir_name
    out:
      - id: quant_output
    run: >-
      ../../../tool/kallisto/kallisto_quant-pe/kallisto_quant-pe.cwl
    label: "kallisto quant: runs the quantification algorithm"
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
  - id: kallisto_index
    in:
      - id: fasta_files
        source: wget/downloaded
      - id: index_name
        source: index_name
    out:
      - id: index_file
    run: ../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
  - id: wget
    in:
      - id: output_name
        source: output_name
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
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
