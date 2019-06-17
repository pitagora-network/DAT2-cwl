class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - STAR
  - '--runMode'
  - genomeGenerate
inputs:
  - id: genomeFastaFiles
    type: 'File[]'
    inputBinding:
      position: 0
      prefix: '--genomeFastaFiles'
    label: Paths to genome fasta files
    doc: >-
      specified one or more FASTA files with the genome reference sequences.
      Multiple reference sequences (henceforth called chromosomes) are allowed
      for each fasta file. You can rename the chromosomes names in the
      chrName.txt keeping the order of the chromo- somes in the file: the names
      from this file will be used in all output alignment files (such as .sam).
      The tabs are not allowed in chromosomes names, and spaces are not
      recommended.
  - id: nthreads
    type: int
    inputBinding:
      position: 0
      prefix: '--runThreadN'
    label: Number of threads
    doc: >-
      defines the number of threads to be used for genome generation, it has to
      be set to the number of available cores on the server node.
  - id: sjdbGTFfile
    type: File
    inputBinding:
      position: 0
      prefix: '--sjdbGTFfile'
    label: Path to annotation gtf file
    doc: >-
      specifies the path to the file with annotated transcripts in the standard
      GTF format. STAR will extract splice junctions from this file and use them
      to greatly improve accuracy of the mapping. While this is optional, and
      STAR can be run without annotations, using annotations is highly
      recommended whenever they are available. Starting from 2.4.1a, the
      annotations can also be included on the fly at the mapping step.
  - default: 100
    id: sjdbOverhang
    type: int
    inputBinding:
      position: 0
      prefix: '--sjdbOverhang'
    label: >-
      ReadLength-1, a value to be used for spliced junction database
      construction
    doc: >-
      specifies the length of the genomic sequence around the annotated junction
      to be used in constructing the splice junctions database. Ideally, this
      length should be equal to the ReadLength-1, where ReadLength is the length
      of the reads. For instance, for Illumina 2x100b paired-end reads, the
      ideal value is 100-1=99. In case of reads of varying length, the ideal
      value is max(ReadLength)-1. In most cases, the default value of 100 will
      work as well as the ideal value
  - id: runMode
    type: string?
    inputBinding:
      position: 0
      prefix: '--runMode'
  - id: genomeDir
    type: Directory?
    inputBinding:
      position: 0
      prefix: '--genomeDir'
outputs:
  - id: starIndex
    type: 'File[]'
    outputBinding:
      glob: '*'
doc: >-
  STAR: Spliced Transcripts Alignment to a Reference.
  https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf
label: 'STAR genomeGenerate: Generating genome indexes.'
arguments:
  - position: 0
    prefix: '--genomeFastaFiles'
    valueFrom: genomeFastaFiles
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/star:2.6.0c--0'
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
