#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: BSseq workflow
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement
inputs:
  run_ids:
    type: string[]
    label: "list of SRA Run ID e.g. SRR1274307"
    doc: "list of SRA Run ID e.g. SRR1274307"
  url:
    doc: Download target URL
    type: string
    default: ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/analysisSet/hg38.analysisSet.chroms.tar.gz
  quality:
    type: int
    default: 20
    label: "trim_galore quality"
    doc: "trim_galore quality"
  nthreads:
    type: int
    default: 1
    label: "trim_galore thread number and bismark multicore"
    doc: "trim_galore thread number and bismark multicore"
steps:
  download_rawdata:
    run: download-rawdata/download-rawdata.cwl
    in:
      run_ids: run_ids
    out: [fastq_files]
  download_reference_fasta:
    run: download-reference-fasta/download-reference-fasta.cwl
    in:
      url: url
    out:
      - output_fasta
  fastqc_rawdata:
    run: fastqc/fastqc.cwl
    in:
      fastq_files: download_rawdata/fastq_files
    out: [output]
  trim_galore_rawdata:
    run: ../../tool/trim_galore/trim_galore.cwl
    in:
      nogroup:
        default: true
      quality: quality
      rrbs: download_rawdata/fastq_files
    scatter: rrbs
    out: [fq] # [fq, report]
  fastqc_trimmed_data:
    run: fastqc/fastqc.cwl
    in:
      fastq_files: trim_galore_rawdata/fq
    out: [output]
  bismark_genome_preparation:
    run: bismark-genome-preparation/bismark-genome-preparation.cwl
    in:
      fasta: download_reference_fasta/output_fasta
    out:
      - output
  bismark_exec:
    run: ../../tool/bismark/bismark/bismark.cwl
    in:
      genome_folder: bismark_genome_preparation/output
      fq: trim_galore_rawdata/fq
    scatter: fq
    out: [bam, report]
outputs:
  bam:
    type: File[]
    outputSource: bismark_exec/bam
  report:
    type: File[]
    outputSource: bismark_exec/report
  fastqc_result_rawdata:
    type: File[]
    outputSource: fastqc_rawdata/output
  fastqc_result_trimmed_data:
    type: File[]
    outputSource: fastqc_trimmed_data/output
