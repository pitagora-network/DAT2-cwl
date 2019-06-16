class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - fasterq-dump
inputs:
  - id: bases
    type: int?
    inputBinding:
      position: 0
      prefix: '--bases'
    label: filter by bases
  - id: bufsize
    type: string?
    inputBinding:
      position: 0
      prefix: '--bufsize'
    label: size of file-buffer dflt=1MB
  - id: concatenate_reads
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--concatenate-reads'
    label: writes whole spots into one file
  - id: curcache
    type: string?
    inputBinding:
      position: 0
      prefix: '--curcache'
    label: size of cursor-cache dflt=10MB
  - id: details
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--details'
    label: print details
  - id: force_overwrite
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--force'
    label: force to overwrite existing file(s)
  - id: include_technical
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--include-technical'
    label: include technical reads
  - id: log_level
    type: int?
    inputBinding:
      position: 0
      prefix: '--log-level <level>'
    label: >-
      Logging level as number or enum string. One of
      (fatal|sys|int|err|warn|info|debug) or (0-6) Current/default is warn
  - id: mem
    type: string?
    inputBinding:
      position: 0
      prefix: '--mem'
    label: memory limit for sorting dflt=100MB
  - id: min_read_len
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--min-read-len'
    label: filter by sequence-len
  - id: nthreads
    type: int?
    inputBinding:
      position: 0
      prefix: '--threads'
    label: how many thread dflt=6
  - id: option_file
    type: File?
    inputBinding:
      position: 0
      prefix: '--option-file <file>'
    label: Read more options and parameters from the file.
  - id: outfile
    type: string?
    inputBinding:
      position: 0
      prefix: '--outfile'
    label: output-file
  - id: print_help
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--help'
    label: Output brief explanation for the program.
  - id: print_read_nr
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--print-read-nr'
    label: print read-numbers
  - id: print_stdout
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--stdout'
    label: print output to stdout
  - id: print_version
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--version'
    label: Display the version of the program then quit.
  - id: progress
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--progress'
    label: show progress
  - id: quiet
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--quiet'
    label: Turn off all status messages for the program. Negated by verbose.
  - id: rowid_as_name
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--rowid-as-name'
    label: use row-id as name
  - default: true
    id: skip_technical
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--skip-technical'
    label: skip technical reads
  - id: split_3
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--split-3'
    label: writes single reads in special file
  - default: true
    id: split_files
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--split-files'
    label: write reads into different files
  - default: true
    id: split_spot
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--split-spot'
    label: split spots into reads
  - id: runid
    type: string
    inputBinding:
      position: -1
    label: SRR run id to dump to fastq
  - id: strict
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--strict'
    label: terminate on invalid read
  - id: table
    type: string?
    inputBinding:
      position: 0
      prefix: '--table'
    label: which seq-table to use in case of pacbio
  - id: temp
    type: Directory?
    inputBinding:
      position: 0
      prefix: '--temp'
    label: where to put temp. files dflt=curr dir
  - id: verbose
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--verbose'
    label: >-
      Increase the verbosity of the program status messages. Use multiple times
      for more verbosity. Negates quiet.
outputs:
  - id: fastqFiles
    type: 'File[]'
    outputBinding:
      glob: '*fastq*'
  - id: forward
    type: File?
    outputBinding:
      glob: '*_1.fastq*'
  - id: reverse
    type: File?
    outputBinding:
      glob: '*_2.fastq*'
doc: 'sra-toolkit: https://github.com/ncbi/sra-tools/wiki/Download-On-Demand'
label: 'fasterq-dump: dump .sra format file to generate fastq file'
arguments:
  - position: 0
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/inutano/sra-toolkit:v2.9.2'
'sbg:toolAuthor': inutano
