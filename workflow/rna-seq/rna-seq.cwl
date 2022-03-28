#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: DAT2 workflow RNA-seq
requirements:
  SubworkflowFeatureRequirement: {}
  MultipleInputFeatureRequirement: {}
inputs:
  - id: nthreads
    type: int?
    default: 4
  - id: fasta_url # url
    type: string
  - id: fasta_name # output_name
    type: string
  - id: gtf_url # url_1
    type: string
  - id: gtf_name # output_name_1
    type: string
  - id: fastrq_dump_split_files # split_files
    type: boolean?
    default: true
  - id: runid_0 # runid
    type: string
  - id: runid_1
    type: string
  - id: runid_2
    type: string
  - id: runid_3
    type: string
  - id: runid_4
    type: string
  - id: runid_5
    type: string
  - id: runid_6
    type: string
  - id: target2gene_SraRunTable # SraRunTable
    type: File
  - id: rsem_index_prefix # rsem_index
    type: string
  - id: star_quantMode
    type: string
  - id: star_outSAMtype
    type: string[]
  - id: kallisto_fasta_url
    type: string
  - id: kallisto_fasta_name
    type: string
  - id: kallisto_index_name
    type: string
  - id: kallisto_bootstrap_samples
    type: int?
    default: 100

steps:
  star-rsem-deseq2:
    run: rnaseq-star-rsem-deseq2/rnaseq-star-rsem-deseq2.cwl
    in:
      reference_prefix: rsem_index_prefix
      num_threads: nthreads
      SraRunTable: target2gene_SraRunTable
      url: fasta_url
      output_name: fasta_name
      url_1: gtf_url
      output_name_1: gtf_name
      runThreadN: nthreads
      split_files: fastrq_dump_split_files
      runid: runid_0
      rsem_index_prefix: rsem_index_prefix
      nthreads: nthreads
      runid_1: runid_1
      runid_2: runid_2
      runid_3: runid_3
      runid_4: runid_4
      runid_5: runid_5
      runid_6: runid_6
      quantMode: star_quantMode
      outSAMtype: star_outSAMtype
      nthreads_1: nthreads
      nthreads_2: nthreads
      nthreads_3: nthreads
      nthreads_4: nthreads
      nthreads_5: nthreads
      nthreads_6: nthreads
    out:
      - aligned
      - aligned_1
      - aligned_2
      - aligned_3
      - aligned_4
      - aligned_5
      - aligned_6
      - bamRemDups
      - bamRemDups_1
      - bamRemDups_2
      - bamRemDups_3
      - bamRemDups_4
      - bamRemDups_5
      - bamRemDups_6
      - downloaded
      - downloaded_1
      - fastqFiles
      - fastqFiles_1
      - fastqFiles_2
      - fastqFiles_3
      - fastqFiles_4
      - fastqFiles_5
      - fastqFiles_6
      - genes_result
      - genes_result_1
      - genes_result_2
      - genes_result_3
      - genes_result_4
      - genes_result_5
      - genes_result_6
      - isoforms_result
      - isoforms_result_1
      - isoforms_result_2
      - isoforms_result_3
      - isoforms_result_4
      - isoforms_result_5
      - isoforms_result_6
      - Log.out
      - Log.out_1
      - Log.out_2
      - Log.out_3
      - Log.out_4
      - Log.out_5
      - Log.out_6
      - Log.progress.out
      - Log.progress.out_1
      - Log.progress.out_2
      - Log.progress.out_3
      - Log.progress.out_4
      - Log.progress.out_5
      - Log.progress.out_6
      - mappingstats
      - mappingstats_1
      - mappingstats_2
      - mappingstats_3
      - mappingstats_4
      - mappingstats_5
      - mappingstats_6
      - output
      - readspergene
      - readspergene_1
      - readspergene_2
      - readspergene_3
      - readspergene_4
      - readspergene_5
      - readspergene_6
      - rsem_index_1
      - SJ.out.tab
      - SJ.out.tab_1
      - SJ.out.tab_2
      - SJ.out.tab_3
      - SJ.out.tab_4
      - SJ.out.tab_5
      - SJ.out.tab_6
      - starIndex
      - stat
      - stat_1
      - stat_2
      - stat_3
      - stat_4
      - stat_5
      - stat_6
      - transcript_bam
      - transcript_bam_1
      - transcript_bam_2
      - transcript_bam_3
      - transcript_bam_4
      - transcript_bam_5
      - transcript_bam_6
      - transcript_sorted_bam
      - transcript_sorted_bam_1
      - transcript_sorted_bam_2
      - transcript_sorted_bam_3
      - transcript_sorted_bam_4
      - transcript_sorted_bam_5
      - transcript_sorted_bam_6
      - transcript_sorted_bam_bai
      - transcript_sorted_bam_bai_1
      - transcript_sorted_bam_bai_2
      - transcript_sorted_bam_bai_3
      - transcript_sorted_bam_bai_4
      - transcript_sorted_bam_bai_5
      - transcript_sorted_bam_bai_6
      - transcriptomesam
      - transcriptomesam_1
      - transcriptomesam_2
      - transcriptomesam_3
      - transcriptomesam_4
      - transcriptomesam_5
      - transcriptomesam_6
  kallisto-sleuth:
    run: rnaseq-kallisto-sleuth/rnaseq-kallisto-sleuth.cwl
    in:
      url: kallisto_fasta_url
      output_name: kallisto_fasta_name
      index_name: kallisto_index_name
      runid: runid_0
      nthreads: nthreads
      bootstrap_samples: kallisto_bootstrap_samples
      runid_1: runid_1
      runid_2: runid_2
      runid_3: runid_3
      runid_4: runid_4
      runid_5: runid_5
      runid_6: runid_6
      nthreads_1: nthreads
      SraRunTable: target2gene_SraRunTable
    out:
      - downloaded
      - fastqFiles
      - fastqFiles_1
      - fastqFiles_2
      - fastqFiles_3
      - fastqFiles_4
      - fastqFiles_5
      - fastqFiles_6
      - index_file
      - output

outputs:
  star-bam-results:
    type: File[]
    outputSource:
      - star-rsem-deseq2/aligned
      - star-rsem-deseq2/aligned_1
      - star-rsem-deseq2/aligned_2
      - star-rsem-deseq2/aligned_3
      - star-rsem-deseq2/aligned_4
      - star-rsem-deseq2/aligned_5
      - star-rsem-deseq2/aligned_6
  star-bam-rem-dups-results:
    type: File[]
    outputSource:
      - star-rsem-deseq2/bamRemDups
      - star-rsem-deseq2/bamRemDups_1
      - star-rsem-deseq2/bamRemDups_2
      - star-rsem-deseq2/bamRemDups_3
      - star-rsem-deseq2/bamRemDups_4
      - star-rsem-deseq2/bamRemDups_5
      - star-rsem-deseq2/bamRemDups_6
  star-mapping-stats-results:
    type: File[]
    outputSource:
      - star-rsem-deseq2/mappingstats
      - star-rsem-deseq2/mappingstats_1
      - star-rsem-deseq2/mappingstats_2
      - star-rsem-deseq2/mappingstats_3
      - star-rsem-deseq2/mappingstats_4
      - star-rsem-deseq2/mappingstats_5
      - star-rsem-deseq2/mappingstats_6
  star-read-per-gene-results:
    type: File[]
    outputSource:
      - star-rsem-deseq2/readspergene
      - star-rsem-deseq2/readspergene_1
      - star-rsem-deseq2/readspergene_2
      - star-rsem-deseq2/readspergene_3
      - star-rsem-deseq2/readspergene_4
      - star-rsem-deseq2/readspergene_5
      - star-rsem-deseq2/readspergene_6
  rsem-genes-results:
    type: File[]
    outputSource:
      - star-rsem-deseq2/genes_result
      - star-rsem-deseq2/genes_result_1
      - star-rsem-deseq2/genes_result_2
      - star-rsem-deseq2/genes_result_3
      - star-rsem-deseq2/genes_result_4
      - star-rsem-deseq2/genes_result_5
      - star-rsem-deseq2/genes_result_6
  rsem-isoforms-results:
    type: File[]
    outputSource:
      - star-rsem-deseq2/isoforms_result
      - star-rsem-deseq2/isoforms_result_1
      - star-rsem-deseq2/isoforms_result_2
      - star-rsem-deseq2/isoforms_result_3
      - star-rsem-deseq2/isoforms_result_4
      - star-rsem-deseq2/isoforms_result_5
      - star-rsem-deseq2/isoforms_result_6
  rsem-stat-results:
    type: Directory[]
    outputSource:
      - star-rsem-deseq2/stat
      - star-rsem-deseq2/stat_1
      - star-rsem-deseq2/stat_2
      - star-rsem-deseq2/stat_3
      - star-rsem-deseq2/stat_4
      - star-rsem-deseq2/stat_5
      - star-rsem-deseq2/stat_6
  deseq2-results:
    type: Directory
    outputSource: star-rsem-deseq2/output
  kallisto-results:
    type: File[]
    outputSource:
      - kallisto-sleuth/fastqFiles
      - kallisto-sleuth/fastqFiles_1
      - kallisto-sleuth/fastqFiles_2
      - kallisto-sleuth/fastqFiles_3
      - kallisto-sleuth/fastqFiles_4
      - kallisto-sleuth/fastqFiles_5
      - kallisto-sleuth/fastqFiles_6
    linkMerge: merge_flattened
  sleuth-results:
    type: Directory
    outputSource: kallisto-sleuth/output
