#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Process mapping (See chapter: マッピングの実行)"
inputs:
  reference_genome:
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
  fastq_forward:
    type: File
  fastq_reverse:
    type: File
steps:
  bwa-mem:
    run: bwa-mem.cwl
    in:
      groupp_header_line:
        default: "@RG\tID:${id}\tSM:${id}\tPL:illumina\tLB:${id}"
      index_base: reference_genome
      fastq_forward: fastq_forward
      fastq_reverse: fastq_reverse
    out:
      - output
  samtools-view:
    run: samtools-view.cwl
    in:
      threads:
        default: 4
      output_bam:
        default: true
      # TODO:  -u       uncompressed BAM output (implies -b)
      input_file: bwa-mem/output
    out:
      - bam
  samtools-sort:
    run: samtools-sort.cwl
    in:
      input_bamfile: samtools-view/bam
    out:
      - sorted_bam
  samtools-index:
    run: samtools-index.cwl
    in:
      input_bamfile: samtools-sort/sorted_bam
    out:
      - bam_index
outputs:
  sorted-bam:
    type: File
    outputSource: samtools-sort/sorted_bam
  bam-index:
    type: File
    outputSource: samtools-index/bam_index
