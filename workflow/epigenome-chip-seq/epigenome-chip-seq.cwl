#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements: {}
inputs:
  input_fastq1:
    type: File
  input_fastq2:
    type: File
  input_fastq3:
    type: File
  input_fastq1_name:
    type: string
  input_fastq2_name:
    type: string
  input_fastq3_name:
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
steps:
  rename-fastq1:
    run: ../../tool/cp/cp.cwl
    in:
      file: input_fastq1
      renamed_name: input_fastq1_name
    out:
      - renamed_file
  rename-fastq2:
    run: ../../tool/cp/cp.cwl
    in:
      file: input_fastq2
      renamed_name: input_fastq2_name
    out:
      - renamed_file
  rename-fastq3:
    run: ../../tool/cp/cp.cwl
    in:
      file: input_fastq3
      renamed_name: input_fastq3_name
    out:
      - renamed_file
  fastqc-fastq1:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: rename-fastq1/renamed_file
    out:
      - html
      - result_files
  fastqc-fastq2:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: rename-fastq2/renamed_file
    out:
      - html
      - result_files
  fastqc-fastq3:
    run: ../../tool/fastqc/fastqc.cwl
    in:
      fastq: rename-fastq3/renamed_file
    out:
      - html
      - result_files
  fastp-fastq1:
    run: ../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: rename-fastq1/renamed_file
    out:
      - trimed_fastq
      - html
  fastp-fastq2:
    run: ../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: rename-fastq2/renamed_file
    out:
      - trimed_fastq
      - html
  fastp-fastq3:
    run: ../../tool/fastp/fastp-se-html/fastp-se-html.cwl
    in:
      fastq: rename-fastq3/renamed_file
    out:
      - trimed_fastq
      - html
  bowtie2-fastq1:
    run: ../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: genome_index
      fastq: fastp-fastq1/trimed_fastq
      num_process: num_process
    out:
      - sam
  bowtie2-fastq2:
    run: ../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: genome_index
      fastq: fastp-fastq2/trimed_fastq
      num_process: num_process
    out:
      - sam
  bowtie2-fastq3:
    run: ../../tool/bowtie2/bowtie2-se/bowtie2-se.cwl
    in:
      genome_index: genome_index
      fastq: fastp-fastq3/trimed_fastq
      num_process: num_process
    out:
      - sam
outputs:
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
  fastqc-fastq3_html:
    type: File
    outputSource: fastqc-fastq3/html
  fastqc-fastq3_result_files:
    type: File
    outputSource: fastqc-fastq3/result_files
  fastp-fastq1_trimed_fastq:
    type: File
    outputSource: fastp-fastq1/trimed_fastq
  fastp-fastq1_html:
    type: File
    outputSource: fastp-fastq1/html
  fastp-fastq2_trimed_fastq:
    type: File
    outputSource: fastp-fastq2/trimed_fastq
  fastp-fastq2_html:
    type: File
    outputSource: fastp-fastq2/html
  fastp-fastq3_trimed_fastq:
    type: File
    outputSource: fastp-fastq3/trimed_fastq
  fastp-fastq3_html:
    type: File
    outputSource: fastp-fastq3/html
  bowtie2-fastq1_sam:
    type: File
    outputSource: bowtie2-fastq1/sam
  bowtie2-fastq2_sam:
    type: File
    outputSource: bowtie2-fastq2/sam
  bowtie2-fastq3_sam:
    type: File
    outputSource: bowtie2-fastq3/sam
