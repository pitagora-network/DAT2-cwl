#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: A de novo assembler for isolated bacterial genomes.
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/platanus-b:1.3.2
  - class: InlineJavascriptRequirement
baseCommand:
  - platanus_b
  - iterate
inputs:
  - id: out_file_dir_prefix
    doc: prefix of output file and directory (do not use "/", default out, length <= 200)
    type: string
    default: out
    inputBinding:
      prefix: -o
      position: 0
  - id: contig_files
    doc: contig (or scaffold) file (fasta format)
    type: File[]?
    inputBinding:
      prefix: -c
      position: 1
  - id: num_of_iteration
    doc: number of iterations (default 6)
    type: int
    default: 6
    inputBinding:
      prefix: -i
      position: 2
  - id: sccaffold_val
    doc: -l value of "scaffold" step
    type: int?
    inputBinding:
      prefix: -l
      position: 3
  - id: max_diff_bubble_crush
    doc: maximum difference for bubble crush (identity, default 0)
    type: float
    default: 0.0
    inputBinding:
      prefix: -u
      position: 4
  - id: inward_pair_file_in_1_file
    doc: lib_id inward_pair_file (reads in 1 file, fasta or fastq)
    type: File?
    inputBinding:
      prefix: -ip1
      position: 5
  - id: inward_pair_file_in_2_file
    doc: lib_id inward_pair_files (reads in 2 files, fasta or fastq)
    type: File[]?
    inputBinding:
      prefix: -IP1
      position: 6
  - id: outward_pair_file_in_1_file
    doc: lib_id outward_pair_file (reads in 1 file, fasta or fastq)
    type: File?
    inputBinding:
      prefix: -op1
      position: 7
  - id: outward_pair_file_in_2_file
    doc: lib_id outward_pair_files (reads in 2 files, fasta or fastq)
    type: File[]?
    inputBinding:
      prefix: -OP1
      position: 8
  - id: nanopore_reads
    doc: Oxford Nanopore long-read file (fasta or fastq)
    type: File[]?
    inputBinding:
      prefix: -ont
      position: 9
  - id: pacbio_reads
    doc: PacBio long-read file (fasta or fastq)
    type: File[]?
    inputBinding:
      prefix: -p
      position: 10
  - id: guide_contig
    doc: Guiding contig file; i.e. other assemblies, synthetic long-reads or corrected reads (fasta or fastq)
    type: File[]?
    inputBinding:
      prefix: -gc
      position: 11
  - id: num_threads
    doc: number of threads (default 1)
    type: int
    default: 1
    inputBinding:
      prefix: -t
      position: 12
  - id: mem_limit
    doc: memory limit for making kmer distribution (GB, >=1, default 1)
    type: int
    default: 1
    inputBinding:
      prefix: -m
      position: 13
  - id: tmp_dir
    doc: directory for temporary files (default .)
    type: Directory?
    inputBinding:
      prefix: -tmp
      position: 14
  - id: sub_bin_dir
    doc: directory for binary files which platanus_b use internally (e.g. minimap2) (default /opt/Platanus_B/sub_bin)
    type: Directory?
    inputBinding:
      prefix: -sub_bin
      position: 15
  - id: keep_file
    doc: keep intermediate files (default off)
    type: boolean
    default: false
    inputBinding:
      prefix: -keep_file
      position: 16
  - id: trim_overlap
    doc: trim overlapping edges of scaffolds (default, off)
    type: boolean
    default: false
    inputBinding:
      prefix: -trim_overlap
      position: 17
outputs:
  combined_fa:
    type: File
    outputBinding:
      glob: "$(inputs.out_file_dir_prefix)_iterativeAssembly.fa"
  stdout: stdout
  stderr: stderr
stdout: platanus_b-iterate-stdout.log
stderr: platanus_b-iterate-stderr.log
