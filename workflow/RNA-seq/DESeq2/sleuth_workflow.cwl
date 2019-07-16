class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: SraRunTable
    type: File
    'sbg:x': -302.41400146484375
    'sbg:y': 82
outputs:
  - id: output
    outputSource:
      - deseq2/output
    type: Directory
    'sbg:x': 459.58599853515625
    'sbg:y': -75
steps:
  - id: sample2condition
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../tool/sample2condition/sample2condition.cwl
    label: sample2condition
    'sbg:x': -96
    'sbg:y': 85
  - id: deseq2
    in:
      - id: sample2condition.txt
        source: sample2condition/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
    out:
      - id: output
    run: ../../../tool/DESeq2/deseq2.cwl
    label: deseq2
    'sbg:x': 274
    'sbg:y': -75
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': -93
    'sbg:y': -161
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
