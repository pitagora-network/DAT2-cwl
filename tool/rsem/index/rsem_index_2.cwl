class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - rsem-prepare-reference
inputs:
  - id: gtf
    type: File
    inputBinding:
      position: 0
      prefix: '--gtf'
    label: >-
      extract transcript reference sequences using the gene annotations
      specified in <file>
    doc: >-
      If this option is on, RSEM assumes that 'reference_fasta_file(s)' contains
      the sequence of a genome, and will extract transcript reference sequences
      using the gene annotations specified in <file>, which should be in GTF
      format.
  - id: reference_fasta_dir
    type: File
    inputBinding:
      position: 1
    label: A path to directory contains reference fasta files
    doc: >-
      Either a comma-separated list of Multi-FASTA formatted files OR a
      directory name. If a directory name is specified, RSEM will read all files
      with suffix '.fa' or '.fasta' in this directory. The files should contain
      either the sequences of transcripts or an entire genome, depending on
      whether the '--gtf' option is used.
  - id: reference_name
    type: string
    label: The name of the reference used
    doc: >-
      The name of the reference used. RSEM will generate several
      reference-related files that are prefixed by this name. This name can
      contain path information (e.g. '/ref/mm9').
outputs: []
doc: >-
  RSEM is a software package for estimating gene and isoform expression levels
  from RNA-Seq data. The RSEM package provides an user-friendly interface,
  supports threads for parallel computation of the EM algorithm, single-end and
  paired-end read data, quality scores, variable-length reads and RSPD
  estimation. In addition, it provides posterior mean and 95% credibility
  interval estimates for expression levels. 
  http://deweylab.github.io/RSEM/rsem-prepare-reference.html
label: 'rsem-prepare-reference: preparing reference sequences'
arguments:
  - position: 50
    valueFrom: $(runtime.outdir)/$(inputs.reference_name)
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/rsem:1.3.0--boost1.64_3'
requirements:
  - class: InlineJavascriptRequirement
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
