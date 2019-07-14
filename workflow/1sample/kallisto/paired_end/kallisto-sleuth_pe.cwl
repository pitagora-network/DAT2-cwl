class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: bootstrap_samples
    type: int?
    'sbg:x': 743.11474609375
    'sbg:y': 449.393798828125
  - id: out_dir_name
    type: string?
    'sbg:x': 544.4996948242188
    'sbg:y': 416.59735107421875
  - id: runid
    type: string
    'sbg:x': 23.035512924194336
    'sbg:y': -175.34051513671875
  - id: nthreads
    type: int?
    'sbg:x': -22.539627075195312
    'sbg:y': -48.13252258300781
  - id: split_files
    type: boolean?
    'sbg:x': 112.40266418457031
    'sbg:y': -294.3493957519531
  - id: index_name
    type: string?
    'sbg:x': -123.93341064453125
    'sbg:y': 226.54916381835938
  - id: url
    type: string
    'sbg:x': -333.5840148925781
    'sbg:y': 512.977783203125
outputs:
  - id: quant_output
    outputSource:
      - kallisto_quant/quant_output
    type: Directory
    'sbg:x': 1069.9866943359375
    'sbg:y': 58.836402893066406
  - id: fastqFiles
    outputSource:
      - fasterq_dump/fastqFiles
    type: 'File[]'
    'sbg:x': 487
    'sbg:y': -209
  - id: stderr
    outputSource:
      - wget/stderr
    type: stderr?
    'sbg:x': -192.7574462890625
    'sbg:y': 386.2242736816406
steps:
  - id: kallisto_quant
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: fq1
        source: fasterq_dump/forward
      - id: fq2
        source: fasterq_dump/reverse
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: out_dir_name
    out:
      - id: quant_output
    run: >-
      ../../../../tool/kallisto/kallisto_quant/kallisto_quant_pe/kallisto_quant_pe.cwl
    label: 'kallisto quant: runs the quantification algorithm'
    'sbg:x': 789.8097534179688
    'sbg:y': 64.03107452392578
  - id: fasterq_dump
    in:
      - id: nthreads
        source: nthreads
      - id: split_files
        source: split_files
      - id: runid
        source: runid
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: ../../../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fasterq-dump: dump .sra format file to generate fastq file'
    'sbg:x': 329
    'sbg:y': -118.56182098388672
  - id: kallisto_index
    in:
      - id: fasta_files
        source:
          - wget/downloaded
      - id: index_name
        source: index_name
    out:
      - id: index_file
    run: ../../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
    'sbg:x': 181.15472412109375
    'sbg:y': 276.3982238769531
  - id: wget
    in:
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../../../tool/wget/wget.cwl
    'sbg:x': -197.8097686767578
    'sbg:y': 534.78759765625
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
