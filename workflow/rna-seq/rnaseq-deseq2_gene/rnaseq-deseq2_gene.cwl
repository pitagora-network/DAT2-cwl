class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: SraRunTable
    type: File
  - id: rsem_out
    type: "File[]"
outputs:
  - id: output
    outputSource:
      - deseq2/output
    type: Directory
steps:
  - id: sample2condition
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../tool/sample2condition/sample2condition.cwl
    label: sample2condition
  - id: deseq2
    in:
      - id: sample2condition.txt
        source: sample2condition/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: rsem_out
        source:
          - rsem_out
    out:
      - id: output
    run: ../../../tool/deseq2/deseq2.cwl
    label: deseq2
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
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
