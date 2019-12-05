#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Animal Genome Assembly pipeline by Kazuharu Arakawa (@gaou_ak), CWLized by Tazro Ohta (@inutano). This workflow contains assembly step by canu which may take a few weeks to complete. Be careful to run!"
requirements:
  SubworkflowFeatureRequirement: {}

inputs:
  THREADS:
    type: int
  INPUT_LONGREAD:
    type: File
  INPUT_SHORTREAD:
    type: File
  ESTIMATED_GENOME_SIZE:
    type: string

steps:
  bbmap-stats-initial:
    run: ../../tool/bbmap/bbmap-stats/bbmap-stats.cwl
    in:
      input_fastq: INPUT_LONGREAD
    out:
      - stats
  jellyfish-count:
    run: ../../tool/jellyfish/count/jellyfish-count.cwl
    in:
      input_file: INPUT_SHORTREAD
      threads: THREADS
    out:
      - kmer0
  jellyfish-histo:
    run: ../../tool/jellyfish/histo/jellyfish-histo.cwl
    in:
      kmer_db: jellyfish-count/kmer0
      threads: THREADS
    out:
      - stdout
  nanoplot:
    run: ../../tool/nanoplot/nanoplot.cwl
    in:
      sequence: INPUT_LONGREAD
      threads: THREADS
    out:
      - HistogramReadlength
      - LogTransformed_HistogramReadlength
      - Yield_By_Length
      - LengthvsQualityScatterPlot_dot
      - Weighted_HistogramReadlength
      - LengthvsQualityScatterPlot_kde
      - Weighted_LogTransformed_HistogramReadlength
      - NanoPlot-report
      - NanoStats
  canu:
    run: ../../tool/canu/canu.cwl
    in:
      input_fastq: INPUT_LONGREAD
      genomeSize: ESTIMATED_GENOME_SIZE
      maxThreads: THREADS
    out:
      - contigs
  bbmap-stats-canu-contigs:
    run: ../../tool/bbmap/bbmap-stats/bbmap-stats.cwl
    in:
      input_fastq: canu/contigs
    out:
      - stats
  wtdbg2:
    run: ../../tool/wtdbg2/wtdbg2/wtdbg2.cwl
    in:
      sequence: INPUT_LONGREAD
      genome_size: ESTIMATED_GENOME_SIZE
      threads: THREADS
    out:
      - dot_file_initialized_graph
      - nodes
      - reads
      - dot_file_after_transitive_reduction
      - dot_file_after_merging_bubble
      - kbmap
      - binkmer
      - closed_bins
      - clps
      - dot_contig
      - contig_layout
      - events
      - dot_unitigs
      - nodes_unitigs
      - kmerdep
  wtpoa-cns:
    run: ../../tool/wtdbg2/wtpoa-cns/wtpoa-cns.cwl
    in:
      input_contigs: wtdbg2/contig_layout
      threads: THREADS
    out:
      - output_file
  bbmap-stats-wtdbg2-contigs:
    run: ../../tool/bbmap/bbmap-stats/bbmap-stats.cwl
    in:
      input_fastq: wtpoa-cns/output_file
    out:
      - stats
  error_correction1:
    run: hybrid_error_correction.cwl
    in:
      THREADS: THREADS
      INPUT_FASTA: wtpoa-cns/output_file
      INPUT_SHORTREAD: INPUT_SHORTREAD
    out:
      - fasta
  error_correction2:
    run: hybrid_error_correction.cwl
    in:
      THREADS: THREADS
      INPUT_FASTA: error_correction1/fasta
      INPUT_SHORTREAD: INPUT_SHORTREAD
    out:
      - fasta
  error_correction3:
    run: hybrid_error_correction.cwl
    in:
      THREADS: THREADS
      INPUT_FASTA: error_correction2/fasta
      INPUT_SHORTREAD: INPUT_SHORTREAD
    out:
      - fasta
  error_correction4:
    run: hybrid_error_correction.cwl
    in:
      THREADS: THREADS
      INPUT_FASTA: error_correction3/fasta
      INPUT_SHORTREAD: INPUT_SHORTREAD
    out:
      - fasta

outputs:
  bbmap-stats-initial_stats:
    type: File
    outputSource: bbmap-stats-initial/stats
  jellyfish-histo_stdout:
    type: File
    outputSource: jellyfish-histo/stdout
  nanoplot_HistogramReadlength:
    type: File
    outputSource: nanoplot/HistogramReadlength
  nanoplot_LogTransformed_HistogramReadlength:
    type: File
    outputSource: nanoplot/LogTransformed_HistogramReadlength
  nanoplot_Yield_By_Length:
    type: File
    outputSource: nanoplot/Yield_By_Length
  nanoplot_LengthvsQualityScatterPlot_dot:
    type: File
    outputSource: nanoplot/LengthvsQualityScatterPlot_dot
  nanoplot_Weighted_HistogramReadlength:
    type: File
    outputSource: nanoplot/Weighted_HistogramReadlength
  nanoplot_LengthvsQualityScatterPlot_kde:
    type: File
    outputSource: nanoplot/LengthvsQualityScatterPlot_kde
  nanoplot_Weighted_LogTransformed_HistogramReadlength:
    type: File
    outputSource: nanoplot/Weighted_LogTransformed_HistogramReadlength
  nanoplot_NanoPlot-report:
    type: File
    outputSource: nanoplot/NanoPlot-report
  nanoplot_NanoStats:
    type: File
    outputSource: nanoplot/NanoStats
  wtpoa-cns_output_file:
    type: File
    outputSource: wtpoa-cns/output_file
  bbmap-stats-wtdbg2-contigs_stats:
    type: File
    outputSource: bbmap-stats-wtdbg2-contigs/stats
  error_corrected_fasta_1:
    type: File
    outputSource: error_correction1/fasta
  error_corrected_fasta_2:
    type: File
    outputSource: error_correction2/fasta
  error_corrected_fasta_3:
    type: File
    outputSource: error_correction3/fasta
  error_corrected_fasta_4:
    type: File
    outputSource: error_correction4/fasta
