class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - kallisto
  - quant
inputs:
  - id: bias
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--bias'
    label: Perform sequence based bias correction
    doc: Perform sequence based bias correction
  - default: 0
    id: bootstrap_samples
    type: int
    inputBinding:
      position: 0
      prefix: '--bootstrap-samples='
      separate: false
    label: Number of bootstrap samples
    doc: 'Number of bootstrap samples (default: 0)'
  - id: chromosome
    type: File?
    inputBinding:
      position: 0
      prefix: '--chromosome'
    label: Tab separated file with chrosome names and lengths
    doc: >-
      Tab separated file with chrosome names and lengths (optional for
      --genomebam, but recommended)
  - id: fq1
    type: File
    inputBinding:
      position: 50
    label: Input forward FASTQ file
    doc: Input FASTQ file
  - id: fq2
    type: File
    inputBinding:
      position: 60
    label: Input reverse FASTQ file
    doc: Input FASTQ file
  - id: fr_stranded
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--fr-stranded'
    label: 'Strand specific reads, first read forward'
    doc: 'Strand specific reads, first read forward'
  - id: fragment_length
    type: double?
    inputBinding:
      position: 0
      prefix: '--fragment-length='
      separate: false
    label: Estimated average fragment length
    doc: Estimated average fragment length
  - id: fusion
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--fusion'
    label: Search for fusions for Pizzly
    doc: Search for fusions for Pizzly
  - id: genome_bam
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--genomebam'
    label: Project pseudoalignments to genome sorted BAM file
    doc: Project pseudoalignments to genome sorted BAM file
  - id: gtf
    type: File?
    inputBinding:
      position: 0
      prefix: '--gtf'
    label: GTF file for transcriptome information
    doc: GTF file for transcriptome information (required for --genomebam)
  - id: index_file
    type: File
    inputBinding:
      position: 0
      prefix: '-i'
    label: '[Required] Filename for the kallisto index'
    doc: Filename for the kallisto index to be used for quantification
  - default: 1
    id: nthreads
    type: int?
    inputBinding:
      position: 0
      prefix: '--threads='
      separate: false
    label: Number of threads
    doc: 'Number of threads to use (default: 1)'
  - default: kallisto_quant
    id: out_dir_name
    type: string
    label: Name of the directory to write output to
    doc: 'Name of the directory to write output to (default: kallisto_quant)'
  - id: plain_text
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--plaintext'
    label: Output plaintext instead of HDF5
    doc: Output plaintext instead of HDF5
  - id: pseudo_bam
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--pseudobam'
    label: Save pseudoalignments to transcriptome to BAM file
    doc: Save pseudoalignments to transcriptome to BAM file
  - id: rf_stranded
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--rf-stranded'
    label: 'Strand specific reads, first read reverse'
    doc: 'Strand specific reads, first read reverse'
  - default: 42
    id: seed
    type: int
    inputBinding:
      position: 0
      prefix: '--seed='
      separate: false
    label: Seed for the bootstrap sampling
    doc: 'Seed for the bootstrap sampling (default: 42)'
  - id: standard_deviation
    type: double?
    inputBinding:
      position: 0
      prefix: '--sd='
      separate: false
    label: Estimated standard deviation of fragment length
    doc: >-
      Estimated standard deviation of fragment length (default: -l, -s values
      are estimated from paired end data, but are required when using --single)
outputs:
  - id: quant_output
    type: Directory
    outputBinding:
      glob: $(inputs.out_dir_name)
doc: >-
  kallisto is a program for quantifying abundances of transcripts from RNA-Seq
  data, or more generally of target sequences using high-throughput sequencing
  reads. https://pachterlab.github.io/kallisto/manual.html#quant
label: 'kallisto quant: runs the quantification algorithm'
arguments:
  - position: 0
    prefix: '-o'
    valueFrom: $(runtime.outdir)/$(inputs.out_dir_name)
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/kallisto:0.44.0--h7d86c95_2'
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
