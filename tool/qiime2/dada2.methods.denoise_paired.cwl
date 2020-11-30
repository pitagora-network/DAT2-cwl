#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.dada2.methods.denoise_paired
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.8
    dockerImageId: qiime2/core:2020.8
    dockerOutputDirectory: /home/qiime2
  InitialWorkDirRequirement:
    listing:
    - entryname: inputs.json
      entry: '{"inputs": $(inputs)}'
label: Denoise and dereplicate paired-end sequences
doc: This method denoises paired-end sequences, dereplicates them, and filters chimeras.

baseCommand: qiime
arguments:
  - dada2
  - denoise-paired

inputs:
  demultiplexed_seqs:
    label: demultiplexed_seqs
    doc: The paired-end demultiplexed sequences to be denoised.
    type: File
    inputBinding:
      prefix: --i-demultiplexed-seqs
  trunc_len_f:
    default: null
    doc: "Position at which forward read sequences should be truncated due to decrease in quality. This truncates the 3' end of the of the input sequences, which will be the bases that were sequenced in the last cycles. Reads that are shorter than this value will be discarded. After this parameter is applied there must still be at least a 20 nucleotide overlap between the forward and reverse reads. If 0 is provided, no truncation or length filtering will be performed"
    type: long
    inputBinding:
      prefix: --p-trunc-len-f
  trunc_len_r:
    default: null
    doc: "Position at which reverse read sequences should be truncated due to decrease in quality. This truncates the 3' end of the of the input sequences, which will be the bases that were sequenced in the last cycles. Reads that are shorter than this value will be discarded. After this parameter is applied there must still be at least a 20 nucleotide overlap between the forward and reverse reads. If 0 is provided, no truncation or length filtering will be performed"
    type: long
    inputBinding:
      prefix: --p-trunc-len-r
  trim_left_f:
    default: 0
    doc: "Position at which forward read sequences should be trimmed due to low quality. This trims the 5' end of the input sequences, which will be the bases that were sequenced in the first cycles."
    type: long
    inputBinding:
      prefix: --p-trim-left-f
  trim_left_r:
    default: 0
    doc: "Position at which reverse read sequences should be trimmed due to low quality. This trims the 5' end of the input sequences, which will be the bases that were sequenced in the first cycles."
    type: long
    inputBinding:
      prefix: --p-trim-left-r
  max_ee:
    default: 2.0
    doc: "Reads with number of expected errors higher than this value will be discarded."
    type: double
    inputBinding:
      prefix: --p-max-ee
  trunc_q:
    default: 2
    doc: "Reads are truncated at the first instance of a quality score less than or equal to this value. If the resulting read is then shorter than `trunc_len_f` or `trunc_len_r` (depending on the direction of the read) it is discarded."
    type: long
    inputBinding:
      prefix: --p-trunc-q
  chimera_method:
    default: consensus
    doc: 'The method used to remove chimeras. "none": No chimera removal is performed. "pooled": All reads are pooled prior to chimera detection. "consensus": Chimeras are detected in samples individually, and sequences found chimeric in a sufficient fraction of samples are removed.'
    type: string
    inputBinding:
      prefix: --p-chimera-method
  min_fold_parent_over_abundance:
    default: 1.0
    doc: 'The minimum abundance of potential parents of a sequence being tested as chimeric, expressed as a fold-change versus the abundance of the sequence being tested. Values should be greater than or equal to 1 (i.e. parents should be more abundant than the sequence being tested). This parameter has no effect if chimera_method is "none".'
    type: double
    inputBinding:
      prefix: --p-min-fold-parent-over-abundance
  n_threads:
    default: 0
    doc: "The number of threads to use for multithreaded processing. If 0 is provided, all available cores will be used."
    type: long
    inputBinding:
      prefix: --p-n-threads
  n_reads_learn:
    default: 1000000
    doc: "The number of reads to use when training the error model. Smaller numbers will result in a shorter run time but a less reliable error model."
    type: long
    inputBinding:
      prefix: --p-n-reads-learn
  hashed_feature_ids:
    default: true
    doc: "If true, the feature ids in the resulting table will be presented as hashes of the sequences defining each feature. The hash will always be the same for the same sequence so this allows feature tables to be merged across runs of this method. You should only merge tables if the exact same parameters are used for each run."
    type: boolean
    inputBinding:
      prefix: --p-hashed-feature-ids
  output_table:
    type: string
    inputBinding:
      prefix: --o-table
  output_representative_sequences:
    type: string
    inputBinding:
      prefix: --o-representative-sequences
  output_denoising_stats:
    type: string
    inputBinding:
      prefix: --o-denoising-stats

outputs:
  table:
    doc: "The resulting feature table."
    label: table
    outputBinding:
      glob: $(inputs.output_table)
    type: File
  representative_sequences:
    doc: "The resulting feature sequences. Each feature in the feature table will be represented by exactly one sequence, and these sequences will be the joined paired-end sequences."
    label: representative_sequences
    outputBinding:
      glob: $(inputs.output_representative_sequences)
    type: File
  denoising_stats:
    doc: null
    label: denoising_stats
    outputBinding:
      glob: $(inputs.output_denoising_stats)
    type: File
