class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: bootstrap_samples
    type: int?
    'sbg:x': 407.0354919433594
    'sbg:y': 438.946533203125
  - id: index_file
    type: File
    'sbg:x': 386.97637939453125
    'sbg:y': 97.44567108154297
  - id: nthreads
    type: int
    'sbg:x': 153.67849731445312
    'sbg:y': -243
  - id: out_dir_name
    type: string?
    'sbg:x': 154.85536193847656
    'sbg:y': 314.828857421875
  - id: repo
    type: string?
    'sbg:x': -18.20472526550293
    'sbg:y': 51.83149719238281
  - id: run_ids
    type: string
    'sbg:x': 3.6951067447662354
    'sbg:y': -155.9748992919922
outputs:
  - id: quant_output
    outputSource:
      - kallisto_quant/quant_output
    type: Directory
    'sbg:x': 1052
    'sbg:y': 108
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
    'sbg:x': 160
    'sbg:y': 48.36818313598633
  - id: kallisto_quant
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: fq1
        source: pfastq_dump/forward
      - id: fq2
        source: pfastq_dump/reverse
      - id: index_file
        source: index_file
      - id: out_dir_name
        source:
          - out_dir_name
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
