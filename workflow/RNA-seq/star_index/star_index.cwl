class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: runThreadN
    type: string?
    'sbg:x': -94
    'sbg:y': 154
  - id: url
    type: string
    'sbg:x': -607
    'sbg:y': -378
  - id: output_name
    type: string
    'sbg:x': -630
    'sbg:y': -227.9956817626953
  - id: url_1
    type: string
    'sbg:x': -679
    'sbg:y': -90.99568176269531
  - id: output_name_1
    type: string
    'sbg:x': -675
    'sbg:y': 50.00431823730469
outputs:
  - id: starIndex
    outputSource:
      - star_index/starIndex
    type: Directory
    'sbg:x': 313
    'sbg:y': -55
steps:
  - id: for_star_index_dir_sh
    in: []
    out:
      - id: STAR_reference
    run: ../../../tool/for_star_index_dir/for_star_index_dir.cwl
    label: for_star_index_dir
    'sbg:x': -249
    'sbg:y': 81
  - id: star_index
    in:
      - id: genomeDir
        source: for_star_index_dir_sh/STAR_reference
      - id: genomeFastaFiles
        source: wget_1/downloaded
      - id: runThreadN
        source: runThreadN
      - id: sjdbGTFfile
        source: wget/downloaded
    out:
      - id: starIndex
    run: ../../../tool/star_pre/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': 57
    'sbg:y': -54
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
    'sbg:x': -450
    'sbg:y': -265
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
    'sbg:x': -538
    'sbg:y': -61
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
