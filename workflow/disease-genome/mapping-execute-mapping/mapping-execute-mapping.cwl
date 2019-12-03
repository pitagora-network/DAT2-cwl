#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Process mapping (See chapter: マッピングの実行)"
requirements:
  InlineJavascriptRequirement: {}
inputs:
  reference_id:
    type: string
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
  generate-group-header:
    run:
      class: ExpressionTool
      inputs:
        id: string
      expression: |
        ${
          var id = inputs.id;
          return {
            header: '@RG\\tID:'+id+'\\tSM:'+id+'\\tPL:illumina\\tLB:'+id,
          };
        }
      outputs:
        header: string
    in:
      id: reference_id
    out:
      - header
  bwa-mem:
    run: bwa-mem.cwl
    in:
      group_header_line: generate-group-header/header
      index_base: reference_genome
      fastq_forward: fastq_forward
      fastq_reverse: fastq_reverse
    out:
      - output
  samtools-view:
    run: samtools-view.cwl
    in:
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
