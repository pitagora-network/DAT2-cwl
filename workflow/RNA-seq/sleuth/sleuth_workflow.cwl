class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: sample.txt
    type: File?
    'sbg:x': -262
    'sbg:y': 50
outputs: []
steps:
  - id: sleuth
    in:
      - id: sample.txt
        source: sample.txt
      - id: target2gene.txt
        source: target2gene/target2gene.txt
    out:
      - id: output_gene
    run: ../../../tool/sleuth/sleuth_gene/sleuth_gene.cwl
    label: sleuth
    'sbg:x': 17.234201431274414
    'sbg:y': -63.02602005004883
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': -297
    'sbg:y': -152
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
