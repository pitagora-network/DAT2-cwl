#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/inutano/wtdbg2:v2.2
baseCommand: wtdbg2

inputs:
  threads:
    type: int
    label: "Number of threads, 0 for all cores"
    default: 0
    inputBinding:
      prefix: -t
  sequence:
    type: File
    label: "Long reads sequences file (REQUIRED; can be multiple)"
    inputBinding:
      prefix: -i
  genome_size:
    type: string
    label: "Provide genome size, e.g. 100.4m, 2.3g. In this version, it is used with -X/--rdcov-cutoff in selecting reads just after readed all."
    inputBinding:
      prefix: --genome-size
  overwrite:
    type: boolean
    label: "Force to overwrite output files"
    default: true
    inputBinding:
      prefix: -f
  output_prefix:
    type: string
    label: "Prefix of output files (REQUIRED)"
    default: worm.wtdbg2
    inputBinding:
      prefix: -o

outputs:
  dot_file_initialized_graph:
    type: File
    label: "DOT file for initialized graph"
    outputBinding:
      glob: $(inputs.output_prefix).1.dot*
  nodes:
    type: File
    label: "nodes and their positions in reads"
    outputBinding:
      glob: $(inputs.output_prefix).1.nodes*
  reads:
    type: File
    label: "reads and their nodes"
    outputBinding:
      glob: $(inputs.output_prefix).1.reads*
  dot_file_after_transitive_reduction:
    type: File
    label: "DOT file after transitive reduction"
    outputBinding:
      glob: $(inputs.output_prefix).2.dot*
  dot_file_after_merging_bubble:
    type: File
    label: "DOT file after merging bubble and remove tips"
    outputBinding:
      glob: $(inputs.output_prefix).3.dot*
  kbmap:
    type: File
    label: "KBMAP file, all vs all alignments"
    outputBinding:
      glob: $(inputs.output_prefix).alignments*
  binkmer:
    type: File
    label: "Distribution of number of k-mers in a BIN"
    outputBinding:
      glob: $(inputs.output_prefix).binkmer*
  closed_bins:
    type: File
    label: "Filtered BINs"
    outputBinding:
      glob: $(inputs.output_prefix).closed_bins*
  clps:
    type: File
    label: "Reads clip information"
    outputBinding:
      glob: $(inputs.output_prefix).clps*
  dot_contig:
    type: File
    label: "DOT file for contigs"
    outputBinding:
      glob: $(inputs.output_prefix).ctg.dot*
  contig_layout:
    type: File
    label: "Contigs layout file. Will be read by wtdbg-cns. This file is the main result of wtdbg"
    outputBinding:
      glob: $(inputs.output_prefix).ctg.lay*
  events:
    type: File
    label: "Log file of graph simplification"
    outputBinding:
      glob: $(inputs.output_prefix).events*
  dot_unitigs:
    type: File
    label: "DOT file for unitigs"
    outputBinding:
      glob: $(inputs.output_prefix).frg.dot*
  nodes_unitigs:
    type: File
    label: "unitigs and their nodes"
    outputBinding:
      glob: $(inputs.output_prefix).frg.nodes*
  kmerdep:
    type: File
    label: "Distribution of k-mer depth"
    outputBinding:
      glob: $(inputs.output_prefix).kmerdep*
  stdout: stdout
  stderr:
    type: stderr
    label: "wtdbg print runtime information on progrom's STDERR stream. --quiet to disiable it"
stdout: wtdbg2-stdout.log
stderr: wtdbg2-stderr.log
