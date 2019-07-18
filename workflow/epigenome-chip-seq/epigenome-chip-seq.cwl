#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
inputs:
  input_fastq_posi1:
    type: File
  input_fastq_posi2:
    type: File
  input_fastq_nega:
    type: File
  input_fastq_posi1_name:
    type: string
  input_fastq_posi2_name:
    type: string
  input_fastq_nega_name:
    type: string
  genome_index:
    type: File
    secondaryFiles:
      - ^.1.bt2
      - ^.2.bt2
      - ^.3.bt2
      - ^.4.bt2
      - ^.rev.1.bt2
      - ^.rev.2.bt2
  num_process:
    type: int
    default: 4
  samtools_filter_alignments:
    type: string
    default: "0x4"
  samtools_skip_alignments:
    type: int
    default: 42
  macs2_organism:
    type: enum
    symbols:
      - mm
      - hs
    label: "mouse: mm, human: hs"
  macs2_p-value:
    type: float
    default: 0.01
steps:
  rename-fastq-posi1:
    run: ../../tool/cp/cp.cwl
    in:
      file: input_fastq_posi1
      renamed_name: input_fastq_posi1_name
    out:
      - renamed_file
  rename-fastq-posi2:
    run: ../../tool/cp/cp.cwl
    in:
      file: input_fastq_posi2
      renamed_name: input_fastq_posi2_name
    out:
      - renamed_file
  rename-fastq-nega:
    run: ../../tool/cp/cp.cwl
    in:
      file: input_fastq_nega
      renamed_name: input_fastq_nega_name
    out:
      - renamed_file
  fastqc-fastq-posi1:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: rename-fastq-posi1/renamed_file
    out:
      - html
      - result_files
  fastqc-fastq-posi2:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: rename-fastq-posi2/renamed_file
    out:
      - html
      - result_files
  fastqc-fastq-nega:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: rename-fastq-nega/renamed_file
    out:
      - html
      - result_files
  fastp-fastq-posi1:
    run: ../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: rename-fastq-posi1/renamed_file
    out:
      - trimed_fastq
      - html
  fastp-fastq-posi2:
    run: ../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: rename-fastq-posi2/renamed_file
    out:
      - trimed_fastq
      - html
  fastp-fastq-nega:
    run: ../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: rename-fastq-nega/renamed_file
    out:
      - trimed_fastq
      - html
  bowtie2-fastq-posi1:
    run: ../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: genome_index
      fastq: fastp-fastq-posi1/trimed_fastq
      num_process: num_process
    out:
      - sam
  bowtie2-fastq-posi2:
    run: ../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: genome_index
      fastq: fastp-fastq-posi2/trimed_fastq
      num_process: num_process
    out:
      - sam
  bowtie2-fastq-nega:
    run: ../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: genome_index
      fastq: fastp-fastq-nega/trimed_fastq
      num_process: num_process
    out:
      - sam
  sam2bam-fastq-posi1:
    run: ../../tool/samtools/view/samtools-view.cwl
    in:
      threads: num_process
      output_filename:
        valueFrom: $(inputs.input_file.basename.replace('.sam', '')).uniq.bam
      input_file: bowtie2-fastq-posi1/sam
      include_header:
        valueFrom: $(true)
      ignore_previous_version:
        valueFrom: $(true)
      filter_alignments: samtools_filter_alignments
      skip_alignments: samtools_skip_alignments
    out:
      - output_bam
  sam2bam-fastq-posi2:
    run: ../../tool/samtools/view/samtools-view.cwl
    in:
      threads: num_process
      output_filename:
        valueFrom: $(inputs.input_file.basename.replace('.sam', '')).uniq.bam
      input_file: bowtie2-fastq-posi2/sam
      include_header:
        valueFrom: $(true)
      ignore_previous_version:
        valueFrom: $(true)
      filter_alignments: samtools_filter_alignments
      skip_alignments: samtools_skip_alignments
    out:
      - output_bam
  sam2bam-fastq-nega:
    run: ../../tool/samtools/view/samtools-view.cwl
    in:
      threads: num_process
      output_filename:
        valueFrom: $(inputs.input_file.basename.replace('.sam', '')).uniq.bam
      input_file: bowtie2-fastq-nega/sam
      include_header:
        valueFrom: $(true)
      ignore_previous_version:
        valueFrom: $(true)
      filter_alignments: samtools_filter_alignments
      skip_alignments: samtools_skip_alignments
    out:
      - output_bam
  bam-sort-fastq-posi1:
    run: ../../tool/samtools/sort/samtools-sort.cwl
    in:
      threads: num_process
      tmpfile:
        valueFrom: $(inputs.input_bamfile.basename).tmp
      output_bam:
        valueFrom: $(inputs.input_bamfile.basename.replace('.bam', '')).sorted.bam
      input_bamfile: sam2bam-fastq-posi1/output_bam
    out:
      - sorted_bam
  bam-sort-fastq-posi2:
    run: ../../tool/samtools/sort/samtools-sort.cwl
    in:
      threads: num_process
      tmpfile:
        valueFrom: $(inputs.input_bamfile.basename).tmp
      output_bam:
        valueFrom: $(inputs.input_bamfile.basename.replace('.bam', '')).sorted.bam
      input_bamfile: sam2bam-fastq-posi2/output_bam
    out:
      - sorted_bam
  bam-sort-fastq-nega:
    run: ../../tool/samtools/sort/samtools-sort.cwl
    in:
      threads: num_process
      tmpfile:
        valueFrom: $(inputs.input_bamfile.basename).tmp
      output_bam:
        valueFrom: $(inputs.input_bamfile.basename.replace('.bam', '')).sorted.bam
      input_bamfile: sam2bam-fastq-nega/output_bam
    out:
      - sorted_bam
  samtools-index-fastq-posi1:
    run: ../../tool/samtools/index/samtools-index.cwl
    in:
      input_bamfile: bam-sort-fastq-posi1/sorted_bam
    out:
      - bam_index
  samtools-index-fastq-posi2:
    run: ../../tool/samtools/index/samtools-index.cwl
    in:
      input_bamfile: bam-sort-fastq-posi2/sorted_bam
    out:
      - bam_index
  samtools-index-fastq-nega:
    run: ../../tool/samtools/index/samtools-index.cwl
    in:
      input_bamfile: bam-sort-fastq-nega/sorted_bam
    out:
      - bam_index
  peak-call-posi1:
    run: ../../tool/MACS2/MACS2-callpeak/MACS2-callpeak.cwl
    in:
      target_bam: bam-sort-fastq-posi1/sorted_bam
      control_bam: bam-sort-fastq-nega/sorted_bam
      organism: macs2_organism
      p-value: macs2_p-value
    out:
      - model-r
      - peaks-narrow-peak
      - peaks-xls
      - summits-bed
      - treat-pileup-bdg
      - control-lambda-bdg
  peak-call-posi2:
    run: ../../tool/MACS2/MACS2-callpeak/MACS2-callpeak.cwl
    in:
      target_bam: bam-sort-fastq-posi2/sorted_bam
      control_bam: bam-sort-fastq-nega/sorted_bam
      organism: macs2_organism
      p-value: macs2_p-value
    out:
      - model-r
      - peaks-narrow-peak
      - peaks-xls
      - summits-bed
      - treat-pileup-bdg
      - control-lambda-bdg
  # bedtools-intersect-overlapped-posi1:
  #   run: ../../tool/bedtools/bedtools_intersect_overlap/bedtools_intersect_overlap.cwl
  #   in:
  #     peaks_narrow_peak_a:
  #     peaks_narrow_peak_b:
  #   out:
  #     - result-narrow-peak
  # bedtools-intersect-not-overlapped-posi1:
  #   run: ../../
  #   in:
  #   out:
  # bedtools-intersect-overlapped-posi2:
  #   run: ../../tool/bedtools/bedtools_intersect_overlap/bedtools_intersect_overlap.cwl
  #   in:
  #   out:
  # bedtools-intersect-not-overlapped-posi2:
  #   run: ../../
  #   in:
  #   out:
  # bedtools intersect -u -a BRD4_ChIP_IFNy_peaks.narrowPeak -b IRF1_ChIP_IFNy_peaks.narrowPeak > BRD4_ChIP_IFNy_peaks.overlapped_with_IRF1_ChIP_IFNy_peaks.narrowPeak
  # bedtools intersect -v -a BRD4_ChIP_IFNy_peaks.narrowPeak -b IRF1_ChIP_IFNy_peaks.narrowPeak > BRD4_ChIP_IFNy_peaks.not_overlapped_with_IRF1_ChIP_IFNy_peaks.narrowPeak
  # bedtools intersect -u -a IRF1_ChIP_IFNy_peaks.narrowPeak -b BRD4_ChIP_IFNy_peaks.narrowPeak > IRF1_ChIP_IFNy_peaks.overlapped_with_BRD4_ChIP_IFNy_peaks.narrowPeak
  # bedtools intersect -v -a IRF1_ChIP_IFNy_peaks.narrowPeak -b BRD4_ChIP_IFNy_peaks.narrowPeak > IRF1_ChIP_IFNy_peaks.not_overlapped_with_BRD4_ChIP_IFNy_peaks.narrowPeak
outputs:
  fastqc-fastq-posi1_html:
    type: File
    outputSource: fastqc-fastq-posi1/html
  fastqc-fastq-posi1_result_files:
    type: File
    outputSource: fastqc-fastq-posi1/result_files
  fastqc-fastq-posi2_html:
    type: File
    outputSource: fastqc-fastq-posi2/html
  fastqc-fastq-posi2_result_files:
    type: File
    outputSource: fastqc-fastq-posi2/result_files
  fastqc-fastq-nega_html:
    type: File
    outputSource: fastqc-fastq-nega/html
  fastqc-fastq-nega_result_files:
    type: File
    outputSource: fastqc-fastq-nega/result_files
  fastp-fastq-posi1_trimed_fastq:
    type: File
    outputSource: fastp-fastq-posi1/trimed_fastq
  fastp-fastq-posi1_html:
    type: File
    outputSource: fastp-fastq-posi1/html
  fastp-fastq-posi2_trimed_fastq:
    type: File
    outputSource: fastp-fastq-posi2/trimed_fastq
  fastp-fastq-posi2_html:
    type: File
    outputSource: fastp-fastq-posi2/html
  fastp-fastq-nega_trimed_fastq:
    type: File
    outputSource: fastp-fastq-nega/trimed_fastq
  fastp-fastq-nega_html:
    type: File
    outputSource: fastp-fastq-nega/html
  bowtie2-fastq-posi1_sam:
    type: File
    outputSource: bowtie2-fastq-posi1/sam
  bowtie2-fastq-posi2_sam:
    type: File
    outputSource: bowtie2-fastq-posi2/sam
  bowtie2-fastq-nega_sam:
    type: File
    outputSource: bowtie2-fastq-nega/sam
  sam2bam-fastq-posi1_bam:
    type: File
    outputSource: sam2bam-fastq-posi1/output_bam
  sam2bam-fastq-posi2_bam:
    type: File
    outputSource: sam2bam-fastq-posi2/output_bam
  sam2bam-fastq-nega_bam:
    type: File
    outputSource: sam2bam-fastq-nega/output_bam
  bam-sort-fastq-posi1_bam:
    type: File
    outputSource: bam-sort-fastq-posi1/sorted_bam
  bam-sort-fastq-posi2_bam:
    type: File
    outputSource: bam-sort-fastq-posi2/sorted_bam
  bam-sort-fastq-nega_bam:
    type: File
    outputSource: bam-sort-fastq-nega/sorted_bam
  samtools-index-fastq-posi1_bam_index:
    type: File
    outputSource: samtools-index-fastq-posi1/bam_index
  samtools-index-fastq-posi2_bam_index:
    type: File
    outputSource: samtools-index-fastq-posi2/bam_index
  samtools-index-fastq-nega_bam_index:
    type: File
    outputSource: samtools-index-fastq-nega/bam_index
  peak-call-posi1_model-r:
    type: File
    outputSource: peak-call-posi1/model-r
  peak-call-posi1_peaks-narrow-peak:
    type: File
    outputSource: peak-call-posi1/peaks-narrow-peak
  peak-call-posi1_peaks-xls:
    type: File
    outputSource: peak-call-posi1/peaks-xls
  peak-call-posi1_summits-bed:
    type: File
    outputSource: peak-call-posi1/summits-bed
  peak-call-posi1_treat-pileup-bdg:
    type: File
    outputSource: peak-call-posi1/treat-pileup-bdg
  peak-call-posi1_control-lambda-bdg:
    type: File
    outputSource: peak-call-posi1/control-lambda-bdg
  peak-call-posi2_model-r:
    type: File
    outputSource: peak-call-posi2/model-r
  peak-call-posi2_peaks-narrow-peak:
    type: File
    outputSource: peak-call-posi2/peaks-narrow-peak
  peak-call-posi2_peaks-xls:
    type: File
    outputSource: peak-call-posi2/peaks-xls
  peak-call-posi2_summits-bed:
    type: File
    outputSource: peak-call-posi2/summits-bed
  peak-call-posi2_treat-pileup-bdg:
    type: File
    outputSource: peak-call-posi2/treat-pileup-bdg
  peak-call-posi2_control-lambda-bdg:
    type: File
    outputSource: peak-call-posi2/control-lambda-bdg
