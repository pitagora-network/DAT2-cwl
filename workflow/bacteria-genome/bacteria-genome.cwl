#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: DAT2-cwl bacteria genome data analysis workflow. see https://github.com/pitagora-network/DAT2-cwl/blob/main/workflow/bacteria-genome/README.md
requirements:
  MultipleInputFeatureRequirement: {}
inputs:
  fastq1:
    type: File
  fastq2:
    type: File
  mem_limit:
    type: int
    default: 4
  num_threads:
    type: int
    default: 2
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
  platanus-b-assemble:
    run: ../../tool/platanus-b/assemble/platanus-b-assemble.cwl
    in:
      read_files:
        - fastp/output_fastq1
        - fastp/output_fastq2
      mem_limit: mem_limit
      num_threads: num_threads
    out:
      - contig_fa
      - kmer_frq
  platanus-b-iterate:
    run: ../../tool/platanus-b/iterate/platanus-b-iterate.cwl
    in:
      inward_pair_file_in_2_file:
        - fastp/output_fastq1
        - fastp/output_fastq2
      contig_files:
        source:
          - platanus-b-assemble/contig_fa
        linkMerge: merge_nested
      mem_limit: mem_limit
      num_threads: num_threads
    out:
      - combined_fa
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
  platanus-b-assemble_contig_fa:
    type: File
    outputSource: platanus-b-assemble/contig_fa
  platanus-b-assemble_kmer_frq:
    type: File
    outputSource: platanus-b-assemble/kmer_frq
  platanus-b-iterate_combined_fa:
    type: File
    outputSource: platanus-b-iterate/combined_fa
