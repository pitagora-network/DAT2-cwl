class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs: []
outputs:
  - id: stderr
    outputSource:
      - wget/stderr
    type: stderr
    'sbg:x': -895.8462524414062
    'sbg:y': -216
steps:
  - id: kallisto_wf_pe
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 331.26568603515625
    'sbg:y': -441.1703796386719
  - id: kallisto_wf_pe_1
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 328
    'sbg:y': -275.7414245605469
  - id: kallisto_wf_pe_2
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 326
    'sbg:y': -110.04714965820312
  - id: kallisto_index
    in:
      - id: fasta_files
        source:
          - wget/downloaded
    out:
      - id: index_file
    run: ../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
    'sbg:x': -336.38897705078125
    'sbg:y': 59.96583557128906
  - id: kallisto_wf_pe_3
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 328.6522216796875
    'sbg:y': 76.86495208740234
  - id: kallisto_wf_pe_4
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 329.78216552734375
    'sbg:y': 247.4292755126953
  - id: kallisto_wf_pe_5
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 342.7388610839844
    'sbg:y': 429.03692626953125
  - id: kallisto_wf_pe_6
    in:
      - id: index_file
        source: kallisto_index/index_file
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 350.08660888671875
    'sbg:y': 600.6012573242188
  - id: wget
    in: []
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
    'sbg:x': -939.350830078125
    'sbg:y': 69.38896179199219
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
