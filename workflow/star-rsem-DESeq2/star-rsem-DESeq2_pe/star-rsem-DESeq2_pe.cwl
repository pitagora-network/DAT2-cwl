class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference_dir
    type: Directory
    'sbg:x': -841.2445068359375
    'sbg:y': 287.9293212890625
outputs:
  - id: stderr
    outputSource:
      - wget/stderr
    type: stderr
    'sbg:x': -821.9163208007812
    'sbg:y': -506.50213623046875
  - id: stderr_1
    outputSource:
      - wget_1/stderr
    type: stderr
    'sbg:x': -1136.888427734375
    'sbg:y': 258.888427734375
steps:
  - id: wget
    in: []
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
    'sbg:x': -1084.6492919921875
    'sbg:y': -337.3507385253906
  - id: wget_1
    in: []
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
    'sbg:x': -1126.6416015625
    'sbg:y': -52.944210052490234
  - id: star_index
    in:
      - id: genomeFastaFiles
        source: wget_1/downloaded
      - id: sjdbGTFfile
        source: wget/downloaded
    out:
      - id: starIndex
    run: ../../../tool/star_pre/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': -602.9925537109375
    'sbg:y': -322.55224609375
  - id: rsem_index
    in:
      - id: gtf
        source: wget/downloaded
      - id: reference_fasta
        source: wget_1/downloaded
      - id: reference_dir
        source: reference_dir
    out:
      - id: rsem_index
    run: ../../../tool/rsem/rsem_index/rsem_index.cwl
    label: 'rsem-prepare-reference: preparing reference sequences'
    'sbg:x': -576.1394653320312
    'sbg:y': 7.4860520362854
  - id: star_rsem_wf_pe
    in:
      - id: genomeDir
        source: star_index/starIndex
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -191.45816040039062
    'sbg:y': -637.2393798828125
  - id: star_rsem_wf_pe_1
    in:
      - id: genomeDir
        source: star_index/starIndex
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -194.3228302001953
    'sbg:y': -412.65234375
  - id: star_rsem_wf_pe_2
    in:
      - id: genomeDir
        source: star_index/starIndex
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -192.1337127685547
    'sbg:y': -229.33714294433594
  - id: star_rsem_wf_pe_3
    in:
      - id: genomeDir
        source: star_index/starIndex
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -184.81088256835938
    'sbg:y': -46.79368209838867
  - id: star_rsem_wf_pe_4
    in:
      - id: genomeDir
        source: star_index/starIndex
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -180.47776794433594
    'sbg:y': 153.91380310058594
  - id: star_rsem_wf_pe_5
    in:
      - id: genomeDir
        source: rsem_index/rsem_index
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -164.60385131835938
    'sbg:y': 335.14111328125
  - id: star_rsem_wf_pe_6
    in:
      - id: genomeDir
        source: rsem_index/rsem_index
      - id: rsem_index_dir
        source: rsem_index/rsem_index
    out:
      - id: isoforms_result
      - id: genes_result
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -159.25979614257812
    'sbg:y': 484
requirements:
  - class: SubworkflowFeatureRequirement
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
