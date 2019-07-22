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
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
    'sbg:x': -354.08599853515625
    'sbg:y': -405.5
  - id: downloaded_1
    outputSource:
      - wget_1/downloaded
    type: File
    'sbg:x': -537.0859985351562
    'sbg:y': 134.5
steps:
  - id: star_index
    in:
      - id: genomeDir
        source: for_star_index_dir_sh/STAR_reference
      - id: genomeFastaFiles
        source: gunzip_1/decompressed
      - id: runThreadN
        source: runThreadN
      - id: sjdbGTFfile
        source: gunzip/decompressed
    out:
      - id: starIndex
    run: ../../../tool/star:star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': 60
    'sbg:y': -108
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
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
    'sbg:x': -188.0859375
    'sbg:y': -261.5
  - id: gunzip_1
    in:
      - id: file
        source: wget_1/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
    'sbg:x': -364
    'sbg:y': 25
  - id: for_star_index_dir_sh
    in: []
    out:
      - id: STAR_reference
    run: ../../../tool/for_star_index_dir/for_star_index_dir.cwl
    label: for_star_index_dir
    'sbg:x': -257
    'sbg:y': 144
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
