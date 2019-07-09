class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: bootstrap_samples
    type: int?
    'sbg:x': 422.5072326660156
    'sbg:y': 414.0433654785156
  - id: nthreads
    type: int
    'sbg:x': 153.67849731445312
    'sbg:y': -243
  - id: out_dir_name
    type: 'string[]'
    'sbg:x': 93.79763793945312
    'sbg:y': 363.3258972167969
  - id: repo
    type: string?
    'sbg:x': -12.089348793029785
    'sbg:y': 63
  - id: run_ids
    type: 'string[]'
    'sbg:x': 3.6951067447662354
    'sbg:y': -155.9748992919922
  - id: fasta_files
    type: 'File[]'
    'sbg:x': -18.34822654724121
    'sbg:y': -446.74639892578125
outputs:
  - id: 'quant_output[]'
    outputSource:
      - kallisto_quant/quant_output
    type: Directory
    'sbg:x': 1100.9803466796875
    'sbg:y': 118.53569793701172
steps:
  - id: download_sra
    in:
      - id: repo
        source: repo
      - id: run_ids
        source:
          - run_ids
    out:
      - id: sraFiles
    run: >-
      https://raw.githubusercontent.com/pitagora-network/pitagora-cwl/master/tools/download-sra/download-sra.cwl
    label: 'download-sra: A simple download tool to get .sra file'
    'sbg:x': 160.74465942382812
    'sbg:y': 160.95127868652344
  - id: kallisto_quant
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: fq1
        source: pfastq_dump/forward
      - id: fq2
        source: pfastq_dump/reverse
      - id: index_file
        source:
          - index_file
          - kallisto_index/index_file
      - id: out_dir_name
        source: out_dir_name
    out:
      - id: quant_output
    run: >-
      ../../../tool/kallisto/kallisto_quant/kallisto_quant_pe/kallisto_quant_pe.cwl
    label: 'kallisto quant: runs the quantification algorithm'
    'sbg:x': 791.6422119140625
    'sbg:y': 108.8572006225586
  - id: pfastq_dump
    in:
      - id: nthreads
        source: nthreads
      - id: sraFiles
        source:
          - download_sra/sraFiles
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: >-
      https://raw.githubusercontent.com/pitagora-network/pitagora-cwl/master/tools/pfastq-dump/pfastq-dump.cwl
    label: >-
      pfastq-dump: A bash implementation of parallel-fastq-dump, parallel
      fastq-dump wrapper
    'sbg:x': 409.0354919433594
    'sbg:y': -113.46430206298828
  - id: kallisto_index
    in:
      - id: fasta_files
        source:
          - fasta_files
    out:
      - id: index_file
    run: ../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
    'sbg:x': 263.2339172363281
    'sbg:y': -437.0223388671875
requirements:
  - class: MultipleInputFeatureRequirement
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
