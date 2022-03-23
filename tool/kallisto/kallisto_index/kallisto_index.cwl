class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - kallisto
  - index
inputs:
  - id: fasta_files
    type: File
    inputBinding:
      position: 10
    label: The Fasta file supplied can be either in plaintext or gzipped format
    doc: The Fasta file supplied can be either in plaintext or gzipped format
  - id: index_name
    type: string?
    label: Filename for the kallisto index to be constructed
    doc: Filename for the kallisto index to be constructed
  - default: 31
    id: kmer_size
    type: int
    inputBinding:
      position: 0
      prefix: '-k'
    label: 'k-mer (odd) length (default: 31, max value: 31)'
    doc: 'k-mer (odd) length (default: 31, max value: 31)'
  - default: true
    id: make_unique
    type: boolean
    inputBinding:
      position: 0
      prefix: '--make-unique'
    label: Replace repeated target names with unique names
    doc: Replace repeated target names with unique names
outputs:
  - id: index_file
    type: File
    outputBinding:
      glob: $(inputs.index_name)
doc: >-
  kallisto is a program for quantifying abundances of transcripts from RNA-Seq
  data, or more generally of target sequences using high-throughput sequencing
  reads. https://pachterlab.github.io/kallisto/manual.html#index
label: >-
  kallisto index: builds an index from a FASTA formatted file of target
  sequences
arguments:
  - position: 0
    prefix: '-i'
    valueFrom: $(runtime.outdir)/$(inputs.index_name)
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/kallisto:0.44.0--h7d86c95_2'
requirements:
  - class: InlineJavascriptRequirement
$schemas:
  - 'https://schema.org/version/latest/schemaorg-current-http.rdf'
  - 'http://edamontology.org/EDAM_1.18.owl'
's:author':
  - class: 's:Person'
    's:email': 'mailto:inutano@gmail.com'
    's:identifier': 'https://orcid.org/0000-0003-3777-5945'
    's:name': Tazro Ohta
's:codeRepository': 'https://github.com/pitagora-network/pitagora-cwl'
's:license': 'https://spdx.org/licenses/Apache-2.0'
