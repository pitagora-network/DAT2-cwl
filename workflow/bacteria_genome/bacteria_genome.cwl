#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements: {}
inputs:
  fastq1:
    type: File
  fastq2:
    type: File
steps:
  seqkit-stats-fastq1:
    run: ../../tool/seqkit/seqkit-stats/seqkit-stats.cwl
    in:
      fastq: fastq1
    out:
      - result
  seqkit-stats-fastq2:
    run: ../../tool/seqkit/seqkit-stats/seqkit-stats.cwl
    in:
      fastq: fastq2
    out:
      - result
  fastqc-fastq1:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: fastq1
    out:
      - html
      - result_files
  fastqc-fastq2:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: fastq2
    out:
      - html
      - result_files
  fastp:
    run: ../../tool/fastp/fastp-pe/fastp-pe.cwl
    in:
      fastq1: fastq1
      fastq2: fastq2
    out:
      - output_fastq1
      - output_fastq2
  fastqc-fastp-fastq1:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: fastp/output_fastq1
    out:
      - html
      - result_files
  fastqc-fastp-fastq2:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: fastp/output_fastq2
    out:
      - html
      - result_files
outputs:
  seqkit-stats-fastq1_result:
    type: File
    outputSource: seqkit-stats-fastq1/result
  seqkit-stats-fastq2_result:
    type: File
    outputSource: seqkit-stats-fastq2/result
  fastqc-fastq1_html:
    type: File
    outputSource: fastqc-fastq1/html
  fastqc-fastq1_result_files:
    type: File
    outputSource: fastqc-fastq1/result_files
  fastqc-fastq2_html:
    type: File
    outputSource: fastqc-fastq2/html
  fastqc-fastq2_result_files:
    type: File
    outputSource: fastqc-fastq2/result_files
  fastp_output_fastq1:
    type: File
    outputSource: fastp/output_fastq1
  fastp_output_fastq2:
    type: File
    outputSource: fastp/output_fastq2
  fastqc-fastp-fastq1_html:
    type: File
    outputSource: fastqc-fastp-fastq1/html
  fastqc-fastp-fastq1_result_files:
    type: File
    outputSource: fastqc-fastp-fastq1/result_files
  fastqc-fastp-fastq2_html:
    type: File
    outputSource: fastqc-fastp-fastq2/html
  fastqc-fastp-fastq2_result_files:
    type: File
    outputSource: fastqc-fastp-fastq2/result_files
