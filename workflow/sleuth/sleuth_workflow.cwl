class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs: []
outputs: []
steps:
  - id: sleuth
    in:
      - id: target2gene.txt
        source: target2gene/target2gene.txt
    out:
      - id: kallisto_res.txt
      - id: LRT_res.sorted.txt
      - id: ENST00000503567.5.png
      - id: heatmap.pdf
      - id: volcanoplot.png
      - id: WT_res.sorted.txt
      - id: ENST00000503567.5.pdf
    run: ../../tool/sleuth/sleuth.cwl
    label: sleuth
    'sbg:x': 98
    'sbg:y': -37
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../tool/target2gene/target2gene.cwl
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
