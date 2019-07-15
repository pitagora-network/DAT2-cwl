class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: sample.txt
    type: File?
    'sbg:x': -281
    'sbg:y': 50
  - id: kallisto_out
    type: 'Directory[]'
    'sbg:x': -149
    'sbg:y': 178
outputs:
  - id: output
    outputSource:
      - sleuth/output
    type: Directory
    'sbg:x': 260.796875
    'sbg:y': -61.5
steps:
  - id: sleuth
    in:
      - id: sample.txt
        source: sample.txt
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: kallisto_out
        source:
          - kallisto_out
    out:
      - id: output
    run: ../../../tool/sleuth/sleuth.cwl
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
