class: Workflow
cwlVersion: v1.0
id: transdecoder_hmm
label: transdecoder_hmm
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: transcripts
    type: File
    'sbg:x': -634.3968505859375
    'sbg:y': -116.5
  - id: domtblout
    type: string
    'sbg:exposed': true
  - id: cpu
    type: int?
    'sbg:exposed': true
  - id: minimum_protein_length
    type: int
    'sbg:exposed': true
  - id: hmm
    type: File
    'sbg:x': -304.3968505859375
    'sbg:y': 220.5
outputs:
  - id: output
    outputSource:
      - transdecoder/output
    type: Directory?
    'sbg:x': -312
    'sbg:y': -7
  - id: pep
    outputSource:
      - transdecoder/pep
    type: File?
    'sbg:x': -323.3968505859375
    'sbg:y': -227.5
  - id: output_1
    outputSource:
      - hmmsearch/output
    type: File?
    'sbg:x': 68.359375
    'sbg:y': -67.5
steps:
  - id: transdecoder
    in:
      - id: transcripts
        source: transcripts
      - id: minimum_protein_length
        source: minimum_protein_length
    out:
      - id: output
      - id: pep
    run: ./transdecoder.cwl
    label: transdecoder
    'sbg:x': -437
    'sbg:y': -122
  - id: hmmsearch
    in:
      - id: cpu
        source: cpu
      - id: domtblout
        source: domtblout
      - id: hmm
        source: hmm
      - id: pep
        source: transdecoder/pep
    out:
      - id: output
    run: ../hmmer/hmmsearch.cwl
    label: hmmsearch
    'sbg:x': -104.3968505859375
    'sbg:y': -73.5
requirements: []
