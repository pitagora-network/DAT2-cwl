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
  - id: rsem_out
    type: 'File[]'
    'sbg:x': 51
    'sbg:y': 198
outputs:
  - id: output_gene
    outputSource:
      - deseq2/output_gene
    type: Directory
    'sbg:x': 494.0078125
    'sbg:y': -88
steps:
  - id: sample2condition_gene
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../tool/sample2condition_gene/sample2condition_gene.cwl
    label: sample2condition_gene
    'sbg:x': -96
    'sbg:y': 85
  - id: deseq2
    in:
      - id: sample2condition.txt
        source:
          - sample2condition/output1
          - sample2condition_gene/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: rsem_out
        source:
          - rsem_out
    out:
      - id: output_gene
    run: ../../../tool/deseq2_gene/deseq2_gene.cwl
    label: deseq2_gene
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
requirements:
  - class: MultipleInputFeatureRequirement
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
