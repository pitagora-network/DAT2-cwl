#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
inputs:
  fastq:
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
  fastqc:
    run: https://github.com/pitagora-network/pitagora-cwl/raw/master/tools/fastqc/fastqc.cwl
    in:
      nogroup:
        default: true
      nthreads: nthreads
      seqfile:
        source:
          - fastq
        linkMerge: merge_nested
    out:
      - fastqc_result
  fastp:
    run: ../../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: fastq
    out:
      - trimmed_fastq
      - html
  bowtie2:
    run: ../../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: bowtie2_genome_index
      fastq: fastp/trimmed_fastq
      num_process: nthreads
    out:
      - sam
  samtools-view:
    run: ../../../tool/samtools/view/samtools-view.cwl
    in:
      threads: nthreads
      output_bam:
        default: true
      output_filename:
        valueFrom: $(inputs.fastq.nameroot).trim.uniq.bam
      input_file: bowtie2/sam
      include_header:
        default: true
      ignore_previous_version:
        default: true
      filter_alignments: samtools_filter_alignments
      skip_alignments: samtools_skip_alignments
    out:
      - bam
  samtools-index:
    run: ../../../tool/samtools/index/samtools-index.cwl
    in:
      input_bamfile: samtools-view/bam
    out:
      - bam_index
  macs2:
    run: ../../../tool/MACS2/MACS2-callpeak/MACS2-callpeak.cwl
    in:
      target_bam: samtools-view/bam
      control_bam: macs2_control_bam
      organism: macs2_organism
      p-value: macs2_p_value
    out:
      - model-r
      - peaks-narrow-peak
      - peaks-xls
      - summits-bed
      - treat-pileup-bdg
      - control-lambda-bdg

outputs:
  fastqc-result:
    type: File[]
    outputSource: fastqc/fastqc_result
  fastp-trimmed-fastq:
    type: File
    outputSource: fastp/trimmed_fastq
  fastp-html:
    type: File
    outputSource: fastp/html
  bowtie2-sam:
    type: File
    outputSource: bowtie2/sam
  samtools-view-bam:
    type: File
    outputSource: samtools-view/bam
  samtools-index-bam-index:
    type: File
    outputSource: samtools-index/bam_index
  macs2-model-r:
    type: File
    outputSource: macs2/model-r
  macs2-peaks-narrow-peak:
    type: File
    outputSource: macs2/peaks-narrow-peak
  macs2-peaks-xls:
    type: File
    outputSource: macs2/peaks-xls
  macs2-summits-bed:
    type: File
    outputSource: macs2/summits-bed
  macs2-treat-pileup-bdg:
    type: File
    outputSource: macs2/treat-pileup-bdg
  macs2-control-lambda-bdg:
    type: File
    outputSource: macs2/control-lambda-bdg
