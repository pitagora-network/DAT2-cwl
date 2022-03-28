class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: runThreadN
    type: string?
  - id: url
    type: string
  - id: output_name
    type: string
  - id: url_1
    type: string
  - id: output_name_1
    type: string
outputs:
  - id: starIndex
    outputSource:
      - star_index/starIndex
    type: Directory
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
  - id: downloaded_1
    outputSource:
      - wget_1/downloaded
    type: File
steps:
  - id: star_index
    in:
      - id: genomeDir
        source:
          - mkdir_star/STAR_reference
      - id: genomeFastaFiles
        source: gunzip_1/decompressed
      - id: runThreadN
        source: runThreadN
      - id: sjdbGTFfile
        source: gunzip/decompressed
    out:
      - id: starIndex
    run: ../../../tool/star/star_index/star_index.cwl
    label: "STAR genomeGenerate: Generating genome indexes."
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
  - id: wget_1
    in:
      - id: output_name
        source: output_name_1
      - id: url
        source: url_1
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
  - id: gunzip_1
    in:
      - id: file
        source: wget_1/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
  - id: mkdir_star
    in: []
    out:
      - id: STAR_reference
    run: ../../../tool/mkdir_star/mkdir_star.cwl
    label: mkdir_star
requirements:
  - class: MultipleInputFeatureRequirement
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
