class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: bootstrap_samples
    type: int?
  - id: index_file
    type: File
  - id: out_dir_name
    type: string?
  - id: runid
    type: string
  - id: nthreads
    type: int?
  - id: split_files
    type: boolean?
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
