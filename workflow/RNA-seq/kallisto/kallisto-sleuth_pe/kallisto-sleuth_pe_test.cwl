class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: SraRunTable
    type: File
    'sbg:x': -1010
    'sbg:y': 617.5669555664062
  - id: nthreads
    type: int
    'sbg:x': -179.0890655517578
    'sbg:y': -267.5570068359375
  - id: bootstrap_samples
    type: int?
    'sbg:x': 162.74644470214844
    'sbg:y': 420.227294921875
outputs:
  - id: stderr
    outputSource:
      - wget/stderr
    type: stderr
    'sbg:x': -617.1732177734375
    'sbg:y': -164.66929626464844
  - id: output
    outputSource:
      - sleuth/output
    type: 'Directory[]'
    'sbg:x': 1227.24462890625
    'sbg:y': 136.96673583984375
steps:
  - id: kallisto_wf_pe
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: runids/output1
      - id: run_ids
        source: runids/output1
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 240.47244262695312
    'sbg:y': 50.97637939453125
  - id: kallisto_index
    in:
      - id: fasta_files
        source:
          - wget/downloaded
    out:
      - id: index_file
    run: ../../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
    'sbg:x': -414.6282043457031
    'sbg:y': 60
  - id: wget
    in:
      - id: url
        default: >-
          ftp://ftp.ensembl.org/pub/release-95/fasta/homo_sapiens//cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz
    out:
      - id: downloaded
      - id: stderr
    run: ../../../../tool/wget/wget.cwl
    'sbg:x': -786.2283935546875
    'sbg:y': 40.67716979980469
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': 500.46453857421875
    'sbg:y': -320.0787353515625
  - id: sleuth
    in:
      - id: sample.txt
        source: sample_for_sleuth/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: kallisto_out
        source:
          - kallisto_wf_pe/quant_output
    out:
      - id: output
    run: ../../../../tool/sleuth/sleuth.cwl
    label: sleuth
    'sbg:x': 875.9205932617188
    'sbg:y': 142
  - id: sample_for_sleuth
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../../tool/sample_for_sleuth/sample_for_sleuth.cwl
    label: sample_for_sleuth
    'sbg:x': 115.17865753173828
    'sbg:y': 723.0748901367188
  - id: runids
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../../tool/runids/runids.cwl
    label: runids
    'sbg:x': -530.0631103515625
    'sbg:y': 339.9368591308594
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
