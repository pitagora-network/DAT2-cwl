#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  SubworkflowFeatureRequirement: {}
inputs:
  fastq1:
    type: File
  fastq2:
    type: File
  nthreads:
    type: int
    default: 4
  bowtie2_genome_index:
    type: File
    secondaryFiles:
      - ^.1.bt2
      - ^.2.bt2
      - ^.3.bt2
      - ^.4.bt2
      - ^.rev.1.bt2
      - ^.rev.2.bt2
  samtools_filter_alignments:
    type: string
    default: "0x4"
  samtools_skip_alignments:
    type: int
    default: 42
  macs2_control_bam:
    type: File
  macs2_organism:
    type: string
    default: mm
    label: "mouse: mm, human: hs"
  macs2_p_value:
    type: float
    default: 0.01

steps:
  macs2-fastq1:
    run: macs2/macs2.cwl
    in:
      fastq: fastq1
      bowtie2_genome_index: bowtie2_genome_index
      samtools_filter_alignments: samtools_filter_alignments
      samtools_skip_alignments: samtools_skip_alignments
      nthreads: nthreads
      macs2_p_value: macs2_p_value
      macs2_organism: macs2_organism
      macs2_control_bam: macs2_control_bam
    out:
      - fastqc-result
      - fastp-trimmed-fastq
      - fastp-html
      - bowtie2-sam
      - samtools-view-bam
      - samtools-index-bam-index
      - macs2-model-r
      - macs2-peaks-narrow-peak
      - macs2-peaks-xls
      - macs2-summits-bed
      - macs2-treat-pileup-bdg
      - macs2-control-lambda-bdg
  macs2-fastq2:
    run: macs2/macs2.cwl
    in:
      fastq: fastq2
      bowtie2_genome_index: bowtie2_genome_index
      samtools_filter_alignments: samtools_filter_alignments
      samtools_skip_alignments: samtools_skip_alignments
      nthreads: nthreads
      macs2_p_value: macs2_p_value
      macs2_organism: macs2_organism
      macs2_control_bam: macs2_control_bam
    out:
      - fastqc-result
      - fastp-trimmed-fastq
      - fastp-html
      - bowtie2-sam
      - samtools-view-bam
      - samtools-index-bam-index
      - macs2-model-r
      - macs2-peaks-narrow-peak
      - macs2-peaks-xls
      - macs2-summits-bed
      - macs2-treat-pileup-bdg
      - macs2-control-lambda-bdg
  bedtools-intersect-overlap:
    run: ../../tool/bedtools/bedtools_intersect_overlap/bedtools_intersect_overlap.cwl
    in:
      peaks_narrow_peak_a: macs2-fastq1/macs2-peaks-narrow-peak
      peaks_narrow_peak_b: macs2-fastq2/macs2-peaks-narrow-peak
    out:
      - result-narrow-peak
  bedtools-intersect-no-overlap:
    run: ../../tool/bedtools/bedtools_intersect_no_overlap/bedtools_intersect_no_overlap.cwl
    in:
      peaks_narrow_peak_a: macs2-fastq1/macs2-peaks-narrow-peak
      peaks_narrow_peak_b: macs2-fastq2/macs2-peaks-narrow-peak
    out:
      - result-narrow-peak

outputs:
  fastqc-result-fastq1:
    type: File[]
    outputSource: macs2-fastq1/fastqc-result
  fastp-trimmed-fastq-fastq1:
    type: File
    outputSource: macs2-fastq1/fastp-trimmed-fastq
  fastp-html-fastq1:
    type: File
    outputSource: macs2-fastq1/fastp-html
  bowtie2-sam-fastq1:
    type: File
    outputSource: macs2-fastq1/bowtie2-sam
  samtools-view-bam-fastq1:
    type: File
    outputSource: macs2-fastq1/samtools-view-bam
  samtools-index-bam-index-fastq1:
    type: File
    outputSource: macs2-fastq1/samtools-index-bam-index
  macs2-model-r-fastq1:
    type: File
    outputSource: macs2-fastq1/macs2-model-r
  macs2-peaks-narrow-peak-fastq1:
    type: File
    outputSource: macs2-fastq1/macs2-peaks-narrow-peak
  macs2-peaks-xls-fastq1:
    type: File
    outputSource: macs2-fastq1/macs2-peaks-xls
  macs2-summits-bed-fastq1:
    type: File
    outputSource: macs2-fastq1/macs2-summits-bed
  macs2-treat-pileup-bdg-fastq1:
    type: File
    outputSource: macs2-fastq1/macs2-treat-pileup-bdg
  macs2-control-lambda-bdg-fastq1:
    type: File
    outputSource: macs2-fastq1/macs2-control-lambda-bdg
  fastqc-result-fastq2:
    type: File[]
    outputSource: macs2-fastq2/fastqc-result
  fastp-trimmed-fastq-fastq2:
    type: File
    outputSource: macs2-fastq2/fastp-trimmed-fastq
  fastp-html-fastq2:
    type: File
    outputSource: macs2-fastq2/fastp-html
  bowtie2-sam-fastq2:
    type: File
    outputSource: macs2-fastq2/bowtie2-sam
  samtools-view-bam-fastq2:
    type: File
    outputSource: macs2-fastq2/samtools-view-bam
  samtools-index-bam-index-fastq2:
    type: File
    outputSource: macs2-fastq2/samtools-index-bam-index
  macs2-model-r-fastq2:
    type: File
    outputSource: macs2-fastq2/macs2-model-r
  macs2-peaks-narrow-peak-fastq2:
    type: File
    outputSource: macs2-fastq2/macs2-peaks-narrow-peak
  macs2-peaks-xls-fastq2:
    type: File
    outputSource: macs2-fastq2/macs2-peaks-xls
  macs2-summits-bed-fastq2:
    type: File
    outputSource: macs2-fastq2/macs2-summits-bed
  macs2-treat-pileup-bdg-fastq2:
    type: File
    outputSource: macs2-fastq2/macs2-treat-pileup-bdg
  macs2-control-lambda-bdg-fastq2:
    type: File
    outputSource: macs2-fastq2/macs2-control-lambda-bdg
  narrow-peak-overlap:
    type: File
    outputSource: bedtools-intersect-overlap/result-narrow-peak
  narrow-peak-no-overlap:
    type: File
    outputSource: bedtools-intersect-no-overlap/result-narrow-peak
