class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - rsem-calculate-expression
  - '--paired-end'
inputs:
  - id: nthreads
    type: int
    inputBinding:
      position: 0
      prefix: '--num-threads'
    label: Number of threads to use
    doc: >-
      Number of threads to use. Both Bowtie/Bowtie2, expression estimation and
      'samtools sort' will use this many threads. (Default: 1)
  - id: rsem_index_dir
    type: Directory
    label: A path to the directory contains RSEM index files
    doc: A path to the directory contains RSEM index files
  - id: rsem_index_prefix
    type: string
    label: The name of RSEM index files
    doc: The name of RSEM index files
  - id: rsem_output_prefix
    type: string
    inputBinding:
      position: 4
    label: The name of the sample analyzed
    doc: >-
      The name of the sample analyzed. All output files are prefixed by this
      name (e.g., sample_name.genes.results)
  - id: bam
    type: File?
    inputBinding:
      position: 0
      prefix: '--bam'
outputs:
  - id: genes_result
    type: File
    outputBinding:
      glob: $(inputs.rsem_output_prefix+'.genes.results')
  - id: isoforms_result
    type: File
    outputBinding:
      glob: $(inputs.rsem_output_prefix+'.isoforms.results')
  - id: star_output
    type: Directory
    outputBinding:
      glob: $(inputs.rsem_output_prefix.basename)
  - id: stat
    type: Directory
    outputBinding:
      glob: $(inputs.rsem_output_prefix.basename)
doc: >-
  RSEM is a software package for estimating gene and isoform expression levels
  from RNA-Seq data. The RSEM package provides an user-friendly interface,
  supports threads for parallel computation of the EM algorithm, single-end and
  paired-end read data, quality scores, variable-length reads and RSPD
  estimation. In addition, it provides posterior mean and 95% credibility
  interval estimates for expression levels. 
  http://deweylab.biostat.wisc.edu/rsem/rsem-calculate-expression.html
label: 'rsem-calculate-expression: calculate expression values (BAM input version CWL)'
arguments:
  - position: 3
    valueFrom: $(inputs.rsem_index_dir.path)/$(inputs.rsem_index_prefix)
requirements:
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.rsem_index_dir.basename)
        writable: true
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/rsem:1.3.0--boost1.64_3'
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
