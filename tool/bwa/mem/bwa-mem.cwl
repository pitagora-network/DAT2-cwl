#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bwa:0.7.17--h84994c4_5
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.index_base)
        entryname: $(inputs.index_base.basename)
      - entry: $(inputs.amb)
        entryname: $(inputs.amb.basename)
      - entry: $(inputs.ann)
        entryname: $(inputs.ann.basename)
      - entry: $(inputs.bwt)
        entryname: $(inputs.bwt.basename)
      - entry: $(inputs.pac)
        entryname: $(inputs.pac.basename)
      - entry: $(inputs.sa)
        entryname: $(inputs.sa.basename)

baseCommand: [bwa, mem]

inputs:
  threads:
    type: int
    label: "number of threads"
    default: 4
    inputBinding:
      prefix: -t
  output_sam:
    type: string
    label: "sam file to output results to"
    default: "out.sam"
    inputBinding:
      prefix: -o
  group_header_line:
    type: string?
    label: "read group header line such as '@RG\tID:foo\tSM:bar'"
    inputBinding:
      prefix: -R
  index_base:
    type: File
    label: "fasta file for index basename"
    inputBinding:
      position: 1
  amb:
    type: File
  ann:
    type: File
  bwt:
    type: File
  pac:
    type: File
  sa:
    type: File
  fastq_forward:
    type: File
    label: "input fastq file to map (single-end or forward for pair-end)"
    inputBinding:
      position: 2
  fastq_reverse:
    type: File?
    label: "input fastq file to map (reverse for pair-end)"
    inputBinding:
      position: 3

outputs:
  output:
    type: File
    outputBinding:
      glob: "$(inputs.output_sam)"
  stdout: stdout
  stderr: stderr
stdout: bwa-mem-stdout.log
stderr: bwa-mem-stderr.log
