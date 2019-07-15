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
outputs:
  - id: WT_res.sorted.txt
    outputSource:
      - sleuth/WT_res.sorted.txt
    type: File
    'sbg:x': 370
    'sbg:y': -378.9877624511719
  - id: volcanoplot.png
    outputSource:
      - sleuth/volcanoplot.png
    type: File
    'sbg:x': 511
    'sbg:y': -294
  - id: LRT_res.sorted.txt
    outputSource:
      - sleuth/LRT_res.sorted.txt
    type: File
    'sbg:x': 394
    'sbg:y': -159
  - id: kallisto_res.txt
    outputSource:
      - sleuth/kallisto_res.txt
    type: File
    'sbg:x': 520
    'sbg:y': -58
  - id: heatmap.pdf
    outputSource:
      - sleuth/heatmap.pdf
    type: File
    'sbg:x': 395
    'sbg:y': 16
  - id: ENST00000503567.5.png
    outputSource:
      - sleuth/ENST00000503567.5.png
    type: File
    'sbg:x': 526.6065063476562
    'sbg:y': 88.00071716308594
  - id: ENST00000503567.5.pdf
    outputSource:
      - sleuth/ENST00000503567.5.pdf
    type: File
    'sbg:x': 384.60650634765625
    'sbg:y': 179.00071716308594
steps:
  - id: sleuth
    in:
      - id: sample.txt
        source: sample.txt
      - id: target2gene.txt
        source: target2gene/target2gene.txt
    out:
      - id: output
    run: ../../../tool/sleuth/sleuth.cwl
    label: sleuth
    'sbg:x': 16
    'sbg:y': -26
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
