class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: url
    type: string
    'sbg:x': -436.39886474609375
    'sbg:y': -110
  - id: output_name
    type: string
    'sbg:x': -444.39886474609375
    'sbg:y': 27
outputs:
  - id: stderr
    outputSource:
      - gunzip/stderr
    type: stderr
    'sbg:x': 153
    'sbg:y': -131
  - id: decompressed
    outputSource:
      - gunzip/decompressed
    type: stdout
    'sbg:x': 154.03125
    'sbg:y': 61.5
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
    'sbg:x': -306.3984375
    'sbg:y': -6
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
    'sbg:x': -75
    'sbg:y': -36
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
