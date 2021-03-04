cwlVersion: v1.0
class: Workflow
doc: load meta16s FASTQ files, denosing by DADA2, and perform taxonomy classification

inputs:
  INPUT:
    type: Directory
  METADATA:
    type: File
  CLASSIFIER:
    type: File

outputs:
  # Artifacts
  demux.qza:
    type: File
    outputSource: import/artifact
  table.qza:
    type: File
    outputSource: dada2.methods.denoise_paired/table
  rep-seqs.qza:
    type: File
    outputSource: dada2.methods.denoise_paired/representative_sequences
  stats-dada2.qza:
    type: File
    outputSource: dada2.methods.denoise_paired/denoising_stats
  taxonomy.qza:
    type: File
    outputSource: feature_classifier.methods.classify_sklearn/classification

  # Visualizations
  demux.vis:
    type: File
    outputSource: demux.visualizers.summarize/visualization
  table.vis:
    type: File
    outputSource: feature_table.visualizers.summarize/visualization
  rep-seqs.vis:
    type: File
    outputSource: feature_table.visualizers.tabulate_seqs/visualization
  stats-dada2.vis:
    type: File
    outputSource: metadata.visualizers.tabulate.stats-dada2/visualization
  taxonomy.vis:
    type: File
    outputSource: metadata.visualizers.tabulate.taxonomy/visualization

steps:
  import:
    run: ../../tool/qiime2/import.cwl
    in:
      input_data: INPUT
    out:
      - artifact # demux.qza

  demux.visualizers.summarize:
    run: ../../tool/qiime2/demux.visualizers.summarize.cwl
    in:
      data: import/artifact
      output_name:
        default: demux.qzv
    out:
      - visualization # demux.qzv

  dada2.methods.denoise_paired:
    run: ../../tool/qiime2/dada2.methods.denoise_paired.cwl
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

  feature_table.visualizers.summarize:
    run: ../../tool/qiime2/feature_table.visualizers.summarize.cwl
    in:
      table: dada2.methods.denoise_paired/table
      sample_metadata: METADATA
      output_name:
        default: table.qzv
    out:
      - visualization # table.qzv

  feature_table.visualizers.tabulate_seqs:
    run: ../../tool/qiime2/feature_table.visualizers.tabulate_seqs.cwl
    in:
      data: dada2.methods.denoise_paired/representative_sequences
      output_name:
        default: rep-seqs.qzv
    out:
      - visualization # rep-seqs.qzv

  metadata.visualizers.tabulate.stats-dada2:
    run: ../../tool/qiime2/metadata.visualizers.tabulate.cwl
    in:
      input: dada2.methods.denoise_paired/denoising_stats
      output_name:
        default: stats-dada2.qzv
    out:
      - visualization # stats-dada2.qzv

  feature_classifier.methods.classify_sklearn:
    run: ../../tool/qiime2/feature_classifier.methods.classify_sklearn.cwl
    in:
      reads: dada2.methods.denoise_paired/representative_sequences
      classifier: CLASSIFIER
      output_name:
        default: taxonomy.qza
    out:
      - classification # taxonomy.qza

  metadata.visualizers.tabulate.taxonomy:
    run: ../../tool/qiime2/metadata.visualizers.tabulate.cwl
    in:
      input: feature_classifier.methods.classify_sklearn/classification
      output_name:
        default: taxonomy.qzv
    out:
      - visualization # taxonomy.qzv
