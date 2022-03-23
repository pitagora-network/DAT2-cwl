#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Sub workflow used in the Animal Genome Assembly pipeline by Kazuharu Arakawa (@gaou_ak), CWLized by Tazro Ohta (@inutano)"
requirements: {}

inputs:
  THREADS:
    type: int
  INPUT_FASTA:
    type: File
  INPUT_SHORTREAD:
    type: File

steps:
  bwa-index:
    run: ../../tool/bwa/index/bwa-index.cwl
    in:
      input_fasta: INPUT_FASTA
    out:
      - amb
      - ann
      - bwt
      - pac
      - sa
  bwa-mem:
    run: ../../tool/bwa/mem/bwa-mem.cwl
    in:
      fastq_forward: INPUT_SHORTREAD
      index_base: INPUT_FASTA
      amb: bwa-index/amb
      ann: bwa-index/ann
      bwt: bwa-index/bwt
      pac: bwa-index/pac
      sa: bwa-index/sa
      threads: THREADS
    out:
      - output
  samtools-view:
    run: ../../tool/samtools/view/samtools-view.cwl
    in:
      threads: THREADS
      input_file: bwa-mem/output
    out:
      - bam
  samtools-sort:
    run: ../../tool/samtools/sort/samtools-sort.cwl
    in:
      input_bamfile: samtools-view/bam
      threads: THREADS
    out:
      - sorted_bam
  samtools-index:
    run: ../../tool/samtools/index/samtools-index.cwl
    in:
      input_bamfile: samtools-sort/sorted_bam
    out:
      - bam_index
  pilon:
    run: ../../tool/pilon/pilon.cwl
    in:
      genome_fasta: INPUT_FASTA
      aligned_bam: samtools-sort/sorted_bam
      bam_index: samtools-index/bam_index
      threads: THREADS
    out:
      - fasta

outputs:
  fasta:
    type: File
    outputSource: pilon/fasta
