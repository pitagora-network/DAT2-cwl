class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: url
    type: string
    'sbg:x': -500.64801025390625
    'sbg:y': -111.5
  - id: output_name
    type: string
    'sbg:x': -497.64801025390625
    'sbg:y': 56.5
outputs:
  - id: decompressed
    outputSource:
      - gunzip/decompressed
    type: stdout
    'sbg:x': 210.35198974609375
    'sbg:y': 100.5
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
    'sbg:x': -251.64801025390625
    'sbg:y': 91.5
  - id: stderr
    outputSource:
      - gunzip/stderr
    type: stderr
    'sbg:x': 191.35198974609375
    'sbg:y': -140.5
  - id: stderr_1
    outputSource:
      - wget/stderr
    type: stderr
    'sbg:x': -203.64801025390625
    'sbg:y': -228.5
steps:
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
    'sbg:x': -335.6484375
    'sbg:y': -28.5
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
    'sbg:x': -47.64801025390625
    'sbg:y': -15.5
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
