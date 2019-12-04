cwlVersion: v1.0
class: Workflow
doc: "Animal Genome Assembly pipeline by Kazuharu Arakawa (@gaou_ak), CWLized by Tazro Ohta (@inutano), with the steps to download demo data."
requirements: {}
inputs: {}
steps:
  download_longread_fq:
    run:
    in:
      accession:
        default: "ERR2092776"
    out:
      - fastq
  download_shortread_fq:
    run: 
    in:
      accession:
        default: "ERR2092781"
    out:
      - fastq
  animal_genome_assembly_wf:
    run: animal_genome_assembly.cwl
    in:
      THREADS:
        default: $(system.cores) ## TODO: check system environment definition
      INPUT_LONGREAD:
        default: download_longread_fq/fastq
      INPUT_SHORTREAD:
        default: download_shortread_fq/fastq
      ESTIMATED_GENOME_SIZE:
        default: 95m
    out:
      - bbmap-stats-initial_stats
      - jellyfish-histo_stdout
      - nanoplot_HistogramReadlength
      - nanoplot_LogTransformed_HistogramReadlength
      - nanoplot_Yield_By_Length
      - nanoplot_LengthvsQualityScatterPlot_dot
      - nanoplot_Weighted_HistogramReadlength
      - nanoplot_LengthvsQualityScatterPlot_kde
      - nanoplot_Weighted_LogTransformed_HistogramReadlength
      - nanoplot_NanoPlot-report
      - nanoplot_NanoStats
      - wtpoa-cns_output_file
      - bbmap-stats-wtdbg2-contigs_stats
      - samtools-sort_sorted_bam
      - samtools-index_bam_index
      - pilon-1_output_files

outputs:
  bbmap-stats-initial_stats:
    type: File
    outputSource: animal_genome_assembly_wf/bbmap-stats-initial_stats
  jellyfish-histo_stdout:
    type: File
    outputSource: animal_genome_assembly_wf/jellyfish-histo_stdout
  nanoplot_HistogramReadlength:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_HistogramReadlength
  nanoplot_LogTransformed_HistogramReadlength:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_LogTransformed_HistogramReadlength
  nanoplot_Yield_By_Length:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_Yield_By_Length
  nanoplot_LengthvsQualityScatterPlot_dot:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_LengthvsQualityScatterPlot_dot
  nanoplot_Weighted_HistogramReadlength:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_Weighted_HistogramReadlength
  nanoplot_LengthvsQualityScatterPlot_kde:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_LengthvsQualityScatterPlot_kde
  nanoplot_Weighted_LogTransformed_HistogramReadlength:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_Weighted_LogTransformed_HistogramReadlength
  nanoplot_NanoPlot-report:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_NanoPlot-report
  nanoplot_NanoStats:
    type: File
    outputSource: animal_genome_assembly_wf/nanoplot_NanoStats
  wtpoa-cns_output_file:
    type: File
    outputSource: animal_genome_assembly_wf/wtpoa-cns_output_file
  bbmap-stats-wtdbg2-contigs_stats:
    type: File
    outputSource: animal_genome_assembly_wf/bbmap-stats-wtdbg2-contigs_stats
  samtools-sort_sorted_bam:
    type: File
    outputSource: animal_genome_assembly_wf/samtools-sort_sorted_bam
  samtools-index_bam_index:
    type: File
    outputSource: animal_genome_assembly_wf/samtools-index_bam_index
  pilon-1_output_files:
    type: File[]
    outputSource: animal_genome_assembly_wf/pilon-1_output_files
