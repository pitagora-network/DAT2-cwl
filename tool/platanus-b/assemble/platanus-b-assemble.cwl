#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: A de novo assembler for isolated bacterial genomes.
requirements:
  - class: DockerRequirement
    dockerPull: ghcr.io/pitagora-network/platanus-b:1.0.0
  - class: InlineJavascriptRequirement
baseCommand:
  - platanus_b
  - assemble
inputs:
  - id: out_file_prefix
    doc: prefix of output files (default out, length <= 200)
    type: string
    default: out
    inputBinding:
      prefix: -o
      position: 0
  - id: read_files
    doc: reads file (fasta or fastq, number <= 100, uncompressed and compressed (gzip or bzip2) files are accepted)
    type: File[]
    inputBinding:
      prefix: -f
      position: 1
  - id: initial_kmer_size
    doc: initial k-mer size (default 32)
    type: int
    default: 32
    inputBinding:
      prefix: -k
      position: 2
  - id: max_kmer_factor
    doc: maximum-k-mer factor (maximum-k = FLOAT*read-length, default 0.5)
    type: float
    default: 0.5
    inputBinding:
      prefix: -K
      position: 3
  - id: step_size
    doc: step size of k-mer extension (>= 1, default 10)
    type: int
    default: 10
    inputBinding:
      prefix: -s
      position: 4
  - id: initial_kmer_cov_cutoff
    doc: initial k-mer coverage cutoff (default 0, 0 means auto)
    type: int
    default: 0
    inputBinding:
      prefix: -n
      position: 5
  - id: min_kmer_cov
    doc: minimum k-mer coverage (default 1)
    type: int
    default: 1
    inputBinding:
      prefix: -c
      position: 6
  - id: kmer_ext_safety_level
    doc: k-mer extension safety level (default 10.0)
    type: float
    default: 10.0
    inputBinding:
      prefix: -a
      position: 7
  - id: max_diff_bubble_crush
    doc: maximum difference for bubble crush (identity, default 0)
    type: float
    default: 0.0
    inputBinding:
      prefix: -u
      position: 8
  - id: max_diff_branch_cut
    doc: maximum difference for branch cutting (coverage ratio, default 0.5)
    type: float
    default: 0.5
    inputBinding:
      prefix: -d
      position: 9
  - id: kmer_cov_depth
    doc: k-mer coverage depth (k = initial k-mer size specified by -k) of homozygous region (default auto)
    type: float?
    inputBinding:
      prefix: -e
      position: 10
  - id: num_threads
    doc: number of threads (<= 100, default 1)
    type: int
    default: 1
    inputBinding:
      prefix: -t
      position: 11
  - id: mem_limit
    doc: memory limit for making kmer distribution (GB, >=1, default 16)
    type: int
    default: 16
    inputBinding:
      prefix: -m
      position: 12
  - id: tmp_dir
    doc: directory for temporary files (default .)
    type: Directory?
    inputBinding:
      prefix: -tmp
      position: 13
  - id: kmer_occ_only
    doc: only output k-mer occurrence table (out_kmer_occ.bin; default off)
    type: boolean
    default: false
    inputBinding:
      prefix: -kmer_occ_only
      position: 14
  - id: repeat
    doc: mode to assemble repetitive sequences (e.g. 16s rRNA)
    type: boolean
    default: false
    inputBinding:
      prefix: -repeat
      position: 15
outputs:
  contig_fa:
    type: File
    outputBinding:
      glob: $(inputs.out_file_prefix)_contig.fa
  kmer_frq:
    type: File
    outputBinding:
      glob: $(inputs.out_file_prefix)_$(inputs.initial_kmer_size)merFrq.tsv
  stdout: stdout
  stderr: stderr
stdout: platanus_b-assemble-stdout.log
stderr: platanus_b-assemble-stderr.log
