cwlVersion: v1.0
class: Workflow
doc: Meta 16S Sequence data analysis pipeline originally developed by Yuh Shiwa, implemented by Tazro Ohta

inputs:
  INPUT:
    type: Directory
  METADATA:
    type: File
  CLASSIFIER:
    type: File

$namespaces:
  dat2: https://github.com/pitagora-network/DAT2-cwl/raw/develop/ # dev
  # dat2: https://github.com/pitagora-network/DAT2-cwl/raw/master/ # master
  # dat2: /Users/inutano/repos/cwl/DAT2-CWL/ # local

steps:
  import:
    run: dat2:tool/qiime2/import.cwl
    in:
      input_data: INPUT
    out:
      - artifact # demux.qza

  demux.visualizers.summarize:
    run: dat2:tool/qiime2/demux.visualizers.summarize.cwl
    in:
      data: import/artifact
      output_name:
        default: demux.qzv
    out:
      - visualization # demux.qzv

  dada2.methods.denoise_paired:
    run: dat2:tool/qiime2/dada2.methods.denoise_paired.cwl
    in:
      demultiplexed_seqs: import/artifact
      output_denoising_stats:
        default: stats-dada2.qza
      output_representative_sequences:
        default: rep-seqs.qza
      output_table:
        default: table.qza
      trunc_len_f:
        default: 290
      trunc_len_r:
        default: 250
      trim_left_f:
        default: 17
      trim_left_r:
        default: 21
    out:
      - table # table.qza
      - representative_sequences # rep-seqs.qza
      - denoising_stats # stats-dada2.qza

  metadata.visualizers.tabulate.stats-dada2:
    run: dat2:tool/qiime2/metadata.visualizers.tabulate.cwl
    in:
      input: dada2.methods.denoise_paired/denoising_stats
      output_name:
        default: stats-dada2.qzv
    out:
      - visualization # stats-dada2.qzv

  feature_table.visualizers.summarize:
    run: dat2:tool/qiime2/feature_table.visualizers.summarize.cwl
    in:
      table: dada2.methods.denoise_paired/table
      sample_metadata: METADATA
      output_name:
        default: table.qzv
    out:
      - visualization # table.qzv

  feature_table.visualizers.tabulate_seqs:
    run: dat2:tool/qiime2/feature_table.visualizers.tabulate_seqs.cwl
    in:
      data: dada2.methods.denoise_paired/representative_sequences
      output_name:
        default: rep-seqs.qzv
    out:
      - visualization # rep-seqs.qzv

  phylogeny.pipelines.align_to_tree_mafft_fasttree:
    run: dat2:tool/qiime2/phylogeny.pipelines.align_to_tree_mafft_fasttree.cwl
    in:
      sequences: dada2.methods.denoise_paired/representative_sequences
      output_alignment:
        default: aligned-rep-seqs.qza
      output_masked_alignemnt:
        default: masked-aligned-rep-seqs.qza
      output_rooted_tree:
        default: rooted-tree.qza
      output_tree:
        default: unrooted-tree.qza
    out:
      - alignment # aligned-rep-seqs.qza
      - masked_alignment # masked-aligned-rep-seqs.qza
      - tree # unrooted-tree.qza
      - rooted_tree # rooted-tree.qza

  diversity.pipelines.core_metrics_phylogenetic:
    run: dat2:tool/qiime2/diversity.pipelines.core_metrics_phylogenetic.cwl
    in:
      table: dada2.methods.denoise_paired/table
      phylogeny: phylogeny.pipelines.align_to_tree_mafft_fasttree/rooted_tree
      metadata: METADATA
      sampling_depth:
        default: 43256 # Use the number of reads of the sample with the smallest number of reads from feature-table summarize
    out:
      - rarefied_table
      - faith_pd_vector
      - observed_otus_vector
      - shannon_vector
      - evenness_vector
      - unweighted_unifrac_distance_matrix # unweighted_unifrac_distance_matrix.qza
      - weighted_unifrac_distance_matrix
      - jaccard_distance_matrix
      - bray_curtis_distance_matrix
      - unweighted_unifrac_pcoa_results
      - weighted_unifrac_pcoa_results
      - jaccard_pcoa_results
      - bray_curtis_pcoa_results
      - unweighted_unifrac_emperor
      - weighted_unifrac_emperor
      - jaccard_emperor
      - bray_curtis_emperor

  diversity.visualizers.alpha_group_significance.observed_otus_vector:
    run: dat2:tool/qiime2/diversity.visualizers.alpha_group_significance.cwl
    in:
      alpha_diversity: diversity.pipelines.core_metrics_phylogenetic/observed_otus_vector
      metadata: METADATA
      output_name:
        default: observed_otus-group-significance.qzv
    out:
      - visualization # observed_otus-group-significance.qzv

  diversity.visualizers.alpha_group_significance.shannon_vector:
    run: dat2:tool/qiime2/diversity.visualizers.alpha_group_significance.cwl
    in:
      alpha_diversity: diversity.pipelines.core_metrics_phylogenetic/shannon_vector
      metadata: METADATA
      output_name:
        default: shannon-group-significance.qzv
    out:
      - visualization # shannon-group-significance.qzv

  diversity.visualizers.alpha_group_significance.faith_pd_vector:
    run: dat2:tool/qiime2/diversity.visualizers.alpha_group_significance.cwl
    in:
      alpha_diversity: diversity.pipelines.core_metrics_phylogenetic/faith_pd_vector
      metadata: METADATA
      output_name:
        default: observed_otus-group-significance.qzv
    out:
      - visualization # faith-pd-group-significance.qzv

  diversity.visualizers.beta_group_significance.unweighted_unifrac_distance_matrix:
    run: dat2:tool/qiime2/diversity.visualizers.beta_group_significance.cwl
    in:
      distance_matrix: diversity.pipelines.core_metrics_phylogenetic/unweighted_unifrac_distance_matrix
      metadata: METADATA
      metadata_column:
        default: group
      pairwise:
        default: true
      output_name:
        default: unweighted-unifrac-group-significance.qzv
    out:
      - visualization # unweighted-unifrac-group-significance.qzv

  diversity.visualizers.beta_group_significance.weighted_unifrac_distance_matrix:
    run: dat2:tool/qiime2/diversity.visualizers.beta_group_significance.cwl
    in:
      distance_matrix: diversity.pipelines.core_metrics_phylogenetic/weighted_unifrac_distance_matrix
      metadata: METADATA
      metadata_column:
        default: group
      pairwise:
        default: true
      output_name:
        default: weighted-unifrac-group-significance.qzv
    out:
      - visualization # weighted-unifrac-group-significance.qzv

  diversity.visualizers.alpha_rarefaction:
    run: dat2:tool/qiime2/diversity.visualizers.alpha_rarefaction.cwl
    in:
      table: dada2.methods.denoise_paired/table
      phylogeny: phylogeny.pipelines.align_to_tree_mafft_fasttree/rooted_tree
      output_name:
        default: alpha-rarefaction.qzv
      max_depth:
        default: 114279 # Use the number of reads of the sample with the largest number of reads from feature-table summarize
    out:
      - visualization # alpha-rarefaction.qzv

  feature_classifier.methods.classify_sklearn:
    run: dat2:tool/qiime2/feature_classifier.methods.classify_sklearn.cwl
    in:
      reads: dada2.methods.denoise_paired/representative_sequences
      classifier: CLASSIFIER
      output_name:
        default: taxonomy.qza
    out:
      - classification # taxonomy.qza

  metadata.visualizers.tabulate.taxonomy:
    run: dat2:tool/qiime2/metadata.visualizers.tabulate.cwl
    in:
      input: feature_classifier.methods.classify_sklearn/classification
      output_name:
        default: taxonomy.qzv
    out:
      - visualization # taxonomy.qzv

  taxa.visualizers.barplot:
    run: dat2:tool/qiime2/taxa.visualizers.barplot.cwl
    in:
      table: dada2.methods.denoise_paired/table
      metadata: METADATA
      taxonomy: feature_classifier.methods.classify_sklearn/classification
      output_name:
        default: taxa-bar-plots.qzv
    out:
      - visualization # taxa-bar-plots.qzv

  taxa.methods.collapse.table:
    run: dat2:tool/qiime2/taxa.methods.collapse.cwl
    in:
      table: dada2.methods.denoise_paired/table
      taxonomy: feature_classifier.methods.classify_sklearn/classification
      level:
        default: 5
      output_name:
        default: table-l5.qza
    out:
      - collapsed_table # table-l5.qza

  feature_table.visualizers.heatmap:
    run: dat2:tool/qiime2/feature_table.visualizers.heatmap.cwl
    in:
      table: taxa.methods.collapse.table/collapsed_table
      metadata: METADATA
      metadata_column:
        default: group
      output_name:
        default: heatmap_l5_group.qzv
    out:
      - visualization # heatmap_l5_group.qzv

  feature_table.methods.filter_samples:
    run: dat2:tool/qiime2/feature_table.methods.filter_samples.cwl
    in:
      table: dada2.methods.denoise_paired/table
      metadata: METADATA
      where:
        default: host_genotype='ob'
      output_name:
        default: table_ob.qza
    out:
      - filtered_table # table_ob.qza

  taxa.methods.collapse.table_ob:
    run: dat2:tool/qiime2/taxa.methods.collapse.cwl
    in:
      table: feature_table.methods.filter_samples/filtered_table
      taxonomy: feature_classifier.methods.classify_sklearn/classification
      level:
        default: 5
      output_name:
        default: table_ob_l5.qza
    out:
      - collapsed_table # table_ob_l5.qza

  composition.methods.add_pseudocount:
    run: dat2:tool/qiime2/composition.methods.add_pseudocount.cwl
    in:
      table: taxa.methods.collapse.table_ob/collapsed_table
    out:
      - composition_table # comp_table_ob_l5.qza

  composition.visualizers.ancom:
    run: dat2:tool/qiime2/composition.visualizers.ancom.cwl
    in:
      table: composition.methods.add_pseudocount/composition_table
      metadata: METADATA
      metadata_column:
        default: host_diet
      output_name:
        default: ancom_table_ob_l5_diet.qzv
    out:
      - visualization

outputs:
  demux.vis:
    type: File
    outputSource: demux.visualizers.summarize/visualization
  stats-dada2.vis:
    type: File
    outputSource: metadata.visualizers.tabulate.stats-dada2/visualization
  table.vis:
    type: File
    outputSource: feature_table.visualizers.summarize/visualization
  rep-seqs.vis:
    type: File
    outputSource: feature_table.visualizers.tabulate_seqs/visualization
  observed_otus-group-significance.vis:
    type: File
    outputSource: diversity.visualizers.alpha_group_significance.observed_otus_vector/visualization
  shannon-group-significance.vis:
    type: File
    outputSource: diversity.visualizers.alpha_group_significance.shannon_vector/visualization
  faith-pd-group-significance.vis:
    type: File
    outputSource: diversity.visualizers.alpha_group_significance.faith_pd_vector/visualization
  unweighted-unifrac-group-significance.vis:
    type: File
    outputSource: diversity.visualizers.beta_group_significance.unweighted_unifrac_distance_matrix/visualization
  weighted-unifrac-group-significance.vis:
    type: File
    outputSource: diversity.visualizers.beta_group_significance.weighted_unifrac_distance_matrix/visualization
  alpha-rarefaction.vis:
    type: File
    outputSource: diversity.visualizers.alpha_rarefaction/visualization
  taxonomy.vis:
    type: File
    outputSource: metadata.visualizers.tabulate.taxonomy/visualization
  taxa-bar-plots.vis:
    type: File
    outputSource: taxa.visualizers.barplot/visualization
  heatmap_l5_group.vis:
    type: File
    outputSource: feature_table.visualizers.heatmap/visualization
  ancom_table_ob_l5_diet.vis:
    type: File
    outputSource: composition.visualizers.ancom/visualization
