#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.diversity.pipelines.core_metrics_phylogenetic
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Core diversity metrics (phylogenetic and non-phylogenetic)
doc: Applies a collection of diversity metrics (both phylogenetic and non-phylogenetic) to a feature table.

baseCommand: qiime
arguments:
  - diversity
  - core-metrics-phylogenetic

inputs:
  table:
    label: table
    doc: The feature table containing the samples over which diversity metrics should be computed.
    type: File
    inputBinding:
      prefix: --i-table
  phylogeny:
    label: phylogeny
    doc: Phylogenetic tree containing tip identifiers that correspond to the feature identifiers in the table. This tree can contain tip ids that are not present in the table, but all feature ids in the table must be present in this tree.
    type: File
    inputBinding:
      prefix: --i-phylogeny
  sampling_depth:
    default: null
    doc: The total frequency that each sample should be rarefied to prior to computing diversity metrics.
    type: long
    inputBinding:
      prefix: --p-sampling-depth
  metadata:
    doc: The sample metadata to use in the emperor plots.
    type:
    - File
    - File[]
    inputBinding:
      prefix: --m-metadata-file
  n_jobs:
    default: 1
    doc: '[beta/beta-phylogenetic methods only, excluding weighted_unifrac] - The number of jobs to use for the computation. This works by breaking down the pairwise matrix into n_jobs even slices and computing them in parallel. If -1 all CPUs are used. If 1 is given, no parallel computing code is used at all, which is useful for debugging. For n_jobs below -1, (n_cpus + 1 + n_jobs) are used. Thus for n_jobs = -2, all CPUs but one are used. (Description from sklearn.metrics.pairwise_distances)'
    type: long
    inputBinding:
      prefix: --p-n-jobs
  output_dir:
    type: Directory
    default: core-metrics-results
    inputBinding:
      prefix: --output-dir
  output_rarefied_table:
    type: string?
    default: rarefied_table.qza
    inputBinding:
      prefix: --o-rarefied-table
  output_faith_pd_vector:
    type: string?
    default: faith_pd_vector.qza
    inputBinding:
      prefix: --o-faith-pd-vector
  output_observed_otus_vector:
    type: string?
    default: observed_otus_vector.qza
    inputBinding:
      prefix: --o-observed-otus-vector
  output_shannon_vector:
    type: string?
    default: shannon_vector.qza
    inputBinding:
      prefix: --o-shannon-vector
  output_evenness_vector:
    type: string?
    default: evenness_vector.qza
    inputBinding:
      prefix: --o-evenness-vector
  output_unweighted_unifrac_distance_matrix:
    type: string?
    default: unweighted_unifrac_distance_matrix.qza
    inputBinding:
      prefix: --o-unweighted-unifrac-distance-matrix
  output_weighted_unifrac_distance_matrix:
    type: string?
    default: weighted_unifrac_distance_matrix.qza
    inputBinding:
      prefix: --o-weighted-unifrac-distance-matrix
  output_jaccard_distance_matrix:
    type: string?
    default: jaccard_distance_matrix.qza
    inputBinding:
      prefix: --o-jaccard-distance-matrix
  output_bray_curtis_distance_matrix:
    type: string?
    default: bray_curtis_distance_matrix.qza
    inputBinding:
      prefix: --o-bray-curtis-distance-matrix
  output_unweighted_unifrac_pcoa_results:
    type: string?
    default: unweighted_unifrac_pcoa_results.qza
    inputBinding:
      prefix: --o-unweighted-unifrac-pcoa-results
  output_weighted_unifrac_pcoa_results:
    type: string?
    default: weighted_unifrac_pcoa_results.qza
    inputBinding:
      prefix: --o-weighted-unifrac-pcoa-results
  output_jaccard_pcoa_results:
    type: string?
    default: jaccard_pcoa_results.qza
    inputBinding:
      prefix: --o-jaccard-pcoa-results
  output_bray_curtis_pcoa_results:
    type: string?
    default: bray_curtis_pcoa_results.qza
    inputBinding:
      prefix: --o-bray-curtis-pcoa-results
  output_unweighted_unifrac_emperor:
    type: string?
    default: unweighted_unifrac_emperor.qzv
    inputBinding:
      prefix: --o-unweighted-unifrac-emperor
  output_weighted_unifrac_emperor:
    type: string?
    default: weighted_unifrac_emperor.qzv
    inputBinding:
      prefix: --o-weighted-unifrac-emperor
  output_jaccard_emperor:
    type: string?
    default: jaccard_emperor.qzv
    inputBinding:
      prefix: --o-jaccard-emperor
  output_bray_curtis_emperor:
    type: string?
    default: bray_curtis_emperor.qzv
    inputBinding:
      prefix: --o-bray-curtis-emperor

outputs:
  rarefied_table:
    doc: "The resulting rarefied feature table."
    label: rarefied_table
    outputBinding:
      glob: $(inputs.output_rarefied_table)
    type: File
  faith_pd_vector:
    doc: "Vector of Faith PD values by sample."
    label: faith_pd_vector
    outputBinding:
      glob: $(inputs.output_faith_pd_vector)
    type: File
  observed_otus_vector:
    doc: "Vector of Observed OTUs values by sample."
    label: observed_otus_vector
    outputBinding:
      glob: $(inputs.output_observed_otus_vector)
    type: File
  shannon_vector:
    doc: "Vector of Shannon diversity values by sample."
    label: shannon_vector
    outputBinding:
      glob: $(inputs.output_shannon_vector)
    type: File
  evenness_vector:
    doc: "Vector of Pielou's evenness values by sample."
    label: evenness_vector
    outputBinding:
      glob: $(inputs.output_evenness_vector)
    type: File
  unweighted_unifrac_distance_matrix:
    doc: "Matrix of unweighted UniFrac distances between pairs of samples."
    label: unweighted_unifrac_distance_matrix
    outputBinding:
      glob: $(inputs.output_unweighted_unifrac_distance_matrix)
    type: File
  weighted_unifrac_distance_matrix:
    doc: "Matrix of weighted UniFrac distances between pairs of samples."
    label: weighted_unifrac_distance_matrix
    outputBinding:
      glob: $(inputs.output_weighted_unifrac_distance_matrix)
    type: File
  jaccard_distance_matrix:
    doc: "Matrix of Jaccard distances between pairs of samples."
    label: jaccard_distance_matrix
    outputBinding:
      glob: $(inputs.output_jaccard_distance_matrix)
    type: File
  bray_curtis_distance_matrix:
    doc: "Matrix of Bray-Curtis distances between pairs of samples."
    label: bray_curtis_distance_matrix
    outputBinding:
      glob: $(inputs.output_bray_curtis_distance_matrix)
    type: File
  unweighted_unifrac_pcoa_results:
    doc: "PCoA matrix computed from unweighted UniFrac distances between samples."
    label: unweighted_unifrac_pcoa_results
    outputBinding:
      glob: $(inputs.output_unweighted_unifrac_pcoa_results)
    type: File
  weighted_unifrac_pcoa_results:
    doc: "PCoA matrix computed from weighted UniFrac distances between samples."
    label: weighted_unifrac_pcoa_results
    outputBinding:
      glob: $(inputs.output_weighted_unifrac_pcoa_results)
    type: File
  jaccard_pcoa_results:
    doc: "PCoA matrix computed from Jaccard distances between samples."
    label: jaccard_pcoa_results
    outputBinding:
      glob: $(inputs.output_jaccard_pcoa_results)
    type: File
  bray_curtis_pcoa_results:
    doc: "PCoA matrix computed from Bray-Curtis distances between samples."
    label: bray_curtis_pcoa_results
    outputBinding:
      glob: $(inputs.output_bray_curtis_pcoa_results)
    type: File
  unweighted_unifrac_emperor:
    doc: "Emperor plot of the PCoA matrix computed from unweighted UniFrac."
    label: unweighted_unifrac_emperor
    outputBinding:
      glob: $(inputs.output_unweighted_unifrac_emperor)
    type: File
  weighted_unifrac_emperor:
    doc: "Emperor plot of the PCoA matrix computed from weighted UniFrac."
    label: weighted_unifrac_emperor
    outputBinding:
      glob: $(inputs.output_weighted_unifrac_emperor)
    type: File
  jaccard_emperor:
    doc: "Emperor plot of the PCoA matrix computed from Jaccard."
    label: jaccard_emperor
    outputBinding:
      glob: $(inputs.output_jaccard_emperor)
    type: File
  bray_curtis_emperor:
    doc: "Emperor plot of the PCoA matrix computed from Bray-Curtis."
    label: bray_curtis_emperor
    outputBinding:
      glob: $(inputs.output_bray_curtis_emperor)
    type: File
