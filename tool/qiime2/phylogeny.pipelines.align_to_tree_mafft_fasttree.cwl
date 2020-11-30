#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.phylogeny.pipelines.align_to_tree_mafft_fasttree
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.8
    dockerImageId: qiime2/core:2020.8
    dockerOutputDirectory: /home/qiime2
label: Build a phylogenetic tree using fasttree and mafft alignment
doc: This pipeline will start by creating a sequence alignment using MAFFT, after which any alignment columns that are phylogenetically uninformative or ambiguously aligned will be removed (masked). The resulting masked alignment will be used to infer a phylogenetic tree and then subsequently rooted at its midpoint. Output files from each step of the pipeline will be saved. This includes both the unmasked and masked MAFFT alignment from q2-alignment methods, and both the rooted and unrooted phylogenies from q2-phylogeny methods.

baseCommand: qiime
arguments:
  - phylogeny
  - align-to-tree-mafft-fasttree

inputs:
  sequences:
    label: sequences
    doc: The sequences to be used for creating a fasttree based rooted phylogenetic
      tree.
    type: File
    inputBinding:
      prefix: --i-sequences
  n_threads:
    default: 1
    doc: The number of threads. (Use 0 to automatically use all available cores) This value is used when aligning the sequences and creating the tree with fasttree.
    type: long
    inputBinding:
      prefix: --p-n-threads
  mask_max_gap_frequency:
    default: 1.0
    doc: The maximum relative frequency of gap characters in a column for the column to be retained. This relative frequency must be a number between 0.0 and 1.0 (inclusive), where 0.0 retains only those columns without gap characters, and 1.0 retains all columns  regardless of gap character frequency. This value is used when masking the aligned sequences.
    type: double
    inputBinding:
      prefix: --p-mask-max-gap-frequency
  mask_min_conservation:
    default: 0.4
    doc: The minimum relative frequency of at least one non-gap character in a column for that column to be retained. This relative frequency must be a number between 0.0 and 1.0 (inclusive). For example, if a value of  0.4 is provided, a column will only be retained  if it contains at least one character that is present in at least 40% of the sequences. This value is used when masking the aligned sequences.
    type: double
    inputBinding:
      prefix: --p-mask-min-conservation
  output_alignment:
    type: string
    inputBinding:
      prefix: --o-alignment
  output_masked_alignemnt:
    type: string
    inputBinding:
      prefix: --o-masked-alignment
  output_tree:
    type: string
    inputBinding:
      prefix: --o-tree
  output_rooted_tree:
    type: string
    inputBinding:
      prefix: --o-rooted-tree

outputs:
  alignment:
    doc: The aligned sequences.
    label: alignment
    outputBinding:
      glob: $(inputs.output_alignment)
    type: File
  masked_alignment:
    doc: The masked alignment.
    label: masked_alignment
    outputBinding:
      glob: $(inputs.output_masked_alignemnt)
    type: File
  tree:
    doc: The unrooted phylogenetic tree.
    label: tree
    outputBinding:
      glob: $(inputs.output_tree)
    type: File
  rooted_tree:
    doc: The rooted phylogenetic tree.
    label: rooted_tree
    outputBinding:
      glob: $(inputs.output_rooted_tree)
    type: File
