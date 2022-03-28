class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: reference_prefix
    type: string
  - id: num_threads
    type: int?
  - id: SraRunTable
    type: File
  - id: url
    type: string
  - id: output_name
    type: string
  - id: url_1
    type: string
  - id: output_name_1
    type: string
  - id: runThreadN
    type: string?
  - id: split_files
    type: boolean?
  - id: runid
    type: string
  - id: rsem_index_prefix
    type: string?
  - id: nthreads
    type: int?
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
  - id: quantMode
    type: string
  - id: outSAMtype
    type: "string[]"
  - id: nthreads_1
    type: int?
  - id: nthreads_2
    type: int?
  - id: nthreads_3
    type: int?
  - id: nthreads_4
    type: int?
  - id: nthreads_5
    type: int?
  - id: nthreads_6
    type: int?
outputs:
  - id: starIndex
    outputSource:
      - star_index/starIndex
    type: Directory
  - id: rsem_index_1
    outputSource:
      - rsem_index/rsem_index
    type: Directory
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
  - id: downloaded_1
    outputSource:
      - wget_1/downloaded
    type: File
  - id: transcriptomesam
    outputSource:
      - star_rsem_wf_pe/transcriptomesam
    type: File?
  - id: transcript_sorted_bam_bai
    outputSource:
      - star_rsem_wf_pe/transcript_sorted_bam_bai
    type: File?
  - id: transcriptomesam_1
    outputSource:
      - star_rsem_wf_pe_1/transcriptomesam
    type: File?
  - id: genes_result
    outputSource:
      - star_rsem_wf_pe/genes_result
    type: File
  - id: transcript_sorted_bam
    outputSource:
      - star_rsem_wf_pe/transcript_sorted_bam
    type: File?
  - id: transcript_bam
    outputSource:
      - star_rsem_wf_pe/transcript_bam
    type: File
  - id: stat
    outputSource:
      - star_rsem_wf_pe/stat
    type: Directory
  - id: SJ.out.tab
    outputSource:
      - star_rsem_wf_pe/SJ.out.tab
    type: File?
  - id: readspergene
    outputSource:
      - star_rsem_wf_pe/readspergene
    type: File?
  - id: mappingstats
    outputSource:
      - star_rsem_wf_pe/mappingstats
    type: File?
  - id: Log.progress.out
    outputSource:
      - star_rsem_wf_pe/Log.progress.out
    type: File?
  - id: Log.out
    outputSource:
      - star_rsem_wf_pe/Log.out
    type: File?
  - id: isoforms_result
    outputSource:
      - star_rsem_wf_pe/isoforms_result
    type: File
  - id: fastqFiles
    outputSource:
      - star_rsem_wf_pe/fastqFiles
    type: "File[]"
  - id: bamRemDups
    outputSource:
      - star_rsem_wf_pe/bamRemDups
    type: File?
  - id: aligned
    outputSource:
      - star_rsem_wf_pe/aligned
    type: File
  - id: transcript_sorted_bam_bai_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_sorted_bam
    type: File?
  - id: transcript_bam_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_bam
    type: File
  - id: stat_1
    outputSource:
      - star_rsem_wf_pe_1/stat
    type: Directory
  - id: SJ.out.tab_1
    outputSource:
      - star_rsem_wf_pe_1/SJ.out.tab
    type: File?
  - id: readspergene_1
    outputSource:
      - star_rsem_wf_pe_1/readspergene
    type: File?
  - id: mappingstats_1
    outputSource:
      - star_rsem_wf_pe_1/mappingstats
    type: File?
  - id: Log.progress.out_1
    outputSource:
      - star_rsem_wf_pe_1/Log.progress.out
    type: File?
  - id: Log.out_1
    outputSource:
      - star_rsem_wf_pe_1/Log.out
    type: File?
  - id: isoforms_result_1
    outputSource:
      - star_rsem_wf_pe_1/isoforms_result
    type: File
  - id: genes_result_1
    outputSource:
      - star_rsem_wf_pe_1/genes_result
    type: File
  - id: fastqFiles_1
    outputSource:
      - star_rsem_wf_pe_1/fastqFiles
    type: "File[]"
  - id: bamRemDups_1
    outputSource:
      - star_rsem_wf_pe_1/bamRemDups
    type: File?
  - id: aligned_1
    outputSource:
      - star_rsem_wf_pe_1/aligned
    type: File
  - id: transcriptomesam_2
    outputSource:
      - star_rsem_wf_pe_2/transcriptomesam
    type: File?
  - id: transcript_sorted_bam_bai_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_sorted_bam
    type: File?
  - id: transcript_bam_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_bam
    type: File
  - id: stat_2
    outputSource:
      - star_rsem_wf_pe_2/stat
    type: Directory
  - id: SJ.out.tab_2
    outputSource:
      - star_rsem_wf_pe_2/SJ.out.tab
    type: File?
  - id: readspergene_2
    outputSource:
      - star_rsem_wf_pe_2/readspergene
    type: File?
  - id: mappingstats_2
    outputSource:
      - star_rsem_wf_pe_2/mappingstats
    type: File?
  - id: Log.progress.out_2
    outputSource:
      - star_rsem_wf_pe_2/Log.progress.out
    type: File?
  - id: Log.out_2
    outputSource:
      - star_rsem_wf_pe_2/Log.out
    type: File?
  - id: isoforms_result_2
    outputSource:
      - star_rsem_wf_pe_2/isoforms_result
    type: File
  - id: genes_result_2
    outputSource:
      - star_rsem_wf_pe_2/genes_result
    type: File
  - id: fastqFiles_2
    outputSource:
      - star_rsem_wf_pe_2/fastqFiles
    type: "File[]"
  - id: bamRemDups_2
    outputSource:
      - star_rsem_wf_pe_2/bamRemDups
    type: File?
  - id: aligned_2
    outputSource:
      - star_rsem_wf_pe_2/aligned
    type: File
  - id: transcriptomesam_3
    outputSource:
      - star_rsem_wf_pe_3/transcriptomesam
    type: File?
  - id: transcript_sorted_bam_bai_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_sorted_bam
    type: File?
  - id: transcript_bam_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_bam
    type: File
  - id: stat_3
    outputSource:
      - star_rsem_wf_pe_3/stat
    type: Directory
  - id: SJ.out.tab_3
    outputSource:
      - star_rsem_wf_pe_3/SJ.out.tab
    type: File?
  - id: readspergene_3
    outputSource:
      - star_rsem_wf_pe_3/readspergene
    type: File?
  - id: mappingstats_3
    outputSource:
      - star_rsem_wf_pe_3/mappingstats
    type: File?
  - id: Log.progress.out_3
    outputSource:
      - star_rsem_wf_pe_3/Log.progress.out
    type: File?
  - id: Log.out_3
    outputSource:
      - star_rsem_wf_pe_3/Log.out
    type: File?
  - id: isoforms_result_3
    outputSource:
      - star_rsem_wf_pe_3/isoforms_result
    type: File
  - id: genes_result_3
    outputSource:
      - star_rsem_wf_pe_3/genes_result
    type: File
  - id: fastqFiles_3
    outputSource:
      - star_rsem_wf_pe_3/fastqFiles
    type: "File[]"
  - id: bamRemDups_3
    outputSource:
      - star_rsem_wf_pe_3/bamRemDups
    type: File?
  - id: aligned_3
    outputSource:
      - star_rsem_wf_pe_3/aligned
    type: File
  - id: transcriptomesam_4
    outputSource:
      - star_rsem_wf_pe_4/transcriptomesam
    type: File?
  - id: transcript_sorted_bam_bai_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_sorted_bam
    type: File?
  - id: transcript_bam_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_bam
    type: File
  - id: stat_4
    outputSource:
      - star_rsem_wf_pe_4/stat
    type: Directory
  - id: SJ.out.tab_4
    outputSource:
      - star_rsem_wf_pe_4/SJ.out.tab
    type: File?
  - id: readspergene_4
    outputSource:
      - star_rsem_wf_pe_4/readspergene
    type: File?
  - id: mappingstats_4
    outputSource:
      - star_rsem_wf_pe_4/mappingstats
    type: File?
  - id: Log.progress.out_4
    outputSource:
      - star_rsem_wf_pe_4/Log.progress.out
    type: File?
  - id: Log.out_4
    outputSource:
      - star_rsem_wf_pe_4/Log.out
    type: File?
  - id: isoforms_result_4
    outputSource:
      - star_rsem_wf_pe_4/isoforms_result
    type: File
  - id: genes_result_4
    outputSource:
      - star_rsem_wf_pe_4/genes_result
    type: File
  - id: fastqFiles_4
    outputSource:
      - star_rsem_wf_pe_4/fastqFiles
    type: "File[]"
  - id: bamRemDups_4
    outputSource:
      - star_rsem_wf_pe_4/bamRemDups
    type: File?
  - id: aligned_4
    outputSource:
      - star_rsem_wf_pe_4/aligned
    type: File
  - id: transcriptomesam_5
    outputSource:
      - star_rsem_wf_pe_5/transcriptomesam
    type: File?
  - id: transcript_sorted_bam_bai_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_sorted_bam
    type: File?
  - id: transcript_bam_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_bam
    type: File
  - id: stat_5
    outputSource:
      - star_rsem_wf_pe_5/stat
    type: Directory
  - id: SJ.out.tab_5
    outputSource:
      - star_rsem_wf_pe_5/SJ.out.tab
    type: File?
  - id: readspergene_5
    outputSource:
      - star_rsem_wf_pe_5/readspergene
    type: File?
  - id: mappingstats_5
    outputSource:
      - star_rsem_wf_pe_5/mappingstats
    type: File?
  - id: Log.progress.out_5
    outputSource:
      - star_rsem_wf_pe_5/Log.progress.out
    type: File?
  - id: Log.out_5
    outputSource:
      - star_rsem_wf_pe_5/Log.out
    type: File?
  - id: isoforms_result_5
    outputSource:
      - star_rsem_wf_pe_5/isoforms_result
    type: File
  - id: genes_result_5
    outputSource:
      - star_rsem_wf_pe_5/genes_result
    type: File
  - id: fastqFiles_5
    outputSource:
      - star_rsem_wf_pe_5/fastqFiles
    type: "File[]"
  - id: bamRemDups_5
    outputSource:
      - star_rsem_wf_pe_5/bamRemDups
    type: File?
  - id: aligned_5
    outputSource:
      - star_rsem_wf_pe_5/aligned
    type: File
  - id: transcriptomesam_6
    outputSource:
      - star_rsem_wf_pe_6/transcriptomesam
    type: File?
  - id: transcript_sorted_bam_bai_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_sorted_bam_bai
    type: File?
  - id: transcript_sorted_bam_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_sorted_bam
    type: File?
  - id: transcript_bam_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_bam
    type: File
  - id: stat_6
    outputSource:
      - star_rsem_wf_pe_6/stat
    type: Directory
  - id: SJ.out.tab_6
    outputSource:
      - star_rsem_wf_pe_6/SJ.out.tab
    type: File?
  - id: readspergene_6
    outputSource:
      - star_rsem_wf_pe_6/readspergene
    type: File?
  - id: mappingstats_6
    outputSource:
      - star_rsem_wf_pe_6/mappingstats
    type: File?
  - id: Log.progress.out_6
    outputSource:
      - star_rsem_wf_pe_6/Log.progress.out
    type: File?
  - id: Log.out_6
    outputSource:
      - star_rsem_wf_pe_6/Log.out
    type: File?
  - id: isoforms_result_6
    outputSource:
      - star_rsem_wf_pe_6/isoforms_result
    type: File
  - id: genes_result_6
    outputSource:
      - star_rsem_wf_pe_6/genes_result
    type: File
  - id: fastqFiles_6
    outputSource:
      - star_rsem_wf_pe_6/fastqFiles
    type: "File[]"
  - id: bamRemDups_6
    outputSource:
      - star_rsem_wf_pe_6/bamRemDups
    type: File?
  - id: aligned_6
    outputSource:
      - star_rsem_wf_pe_6/aligned
    type: File
  - id: output
    outputSource:
      - deseq2/output
    type: Directory
steps:
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
  - id: gunzip_1
    in:
      - id: file
        source: wget_1/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../tool/gunzip/gunzip.cwl
  - id: star_index
    in:
      - id: genomeDir
        source: for_star_index_dir_sh/STAR_reference
      - id: genomeFastaFiles
        source: gunzip_1/decompressed
      - id: runThreadN
        source: runThreadN
      - id: sjdbGTFfile
        source: gunzip/decompressed
    out:
      - id: starIndex
    run: ../../../tool/star/star_index/star_index.cwl
    label: "STAR genomeGenerate: Generating genome indexes."
  - id: rsem_index
    in:
      - id: gtf
        source: gunzip/decompressed
      - id: reference_fasta
        source: gunzip_1/decompressed
      - id: num_threads
        source: num_threads
      - id: reference_dir
        source: for_rsem_index_dir_sh/RSEM_reference
      - id: reference_prefix
        source: reference_prefix
    out:
      - id: rsem_index
    run: ../../../tool/rsem/rsem_index/rsem_index.cwl
    label: "rsem-prepare-reference: preparing reference sequences"
  - id: for_star_index_dir_sh
    in: []
    out:
      - id: STAR_reference
    run: ../../../tool/mkdir_star/mkdir_star.cwl
    label: mkdir_star
  - id: for_rsem_index_dir_sh
    in: []
    out:
      - id: RSEM_reference
    run: ../../../tool/mkdir_rsem/mkdir_rsem.cwl
    label: mkdir_rsem
  - id: deseq2
    in:
      - id: sample2condition.txt
        source: sample2condition/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: rsem_out
        source:
          - star_rsem_wf_pe/genes_result
          - star_rsem_wf_pe_1/genes_result
          - star_rsem_wf_pe_2/genes_result
          - star_rsem_wf_pe_3/genes_result
          - star_rsem_wf_pe_4/genes_result
          - star_rsem_wf_pe_5/genes_result
          - star_rsem_wf_pe_6/genes_result
    out:
      - id: output
    run: ../../../tool/deseq2/deseq2.cwl
    label: deseq2
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
  - id: sample2condition
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../tool/sample2condition/sample2condition.cwl
    label: sample2condition
  - id: wget
    in:
      - id: output_name
        source: output_name
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
  - id: wget_1
    in:
      - id: output_name
        source: output_name_1
      - id: url
        source: url_1
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
  - id: star_rsem_wf_pe
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid
      - id: nthreads
        source: nthreads
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads
      - id: outFileNamePrefix
        source: runid
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid
      - id: nthreads_2
        source: nthreads
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
  - id: star_rsem_wf_pe_1
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_1
      - id: nthreads
        source: nthreads_1
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_1
      - id: outFileNamePrefix
        source: runid_1
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_1
      - id: nthreads_2
        source: nthreads_1
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
  - id: star_rsem_wf_pe_2
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_2
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
      - id: outFileNamePrefix
        source: runid_2
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_2
      - id: nthreads_2
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
  - id: star_rsem_wf_pe_3
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_3
      - id: nthreads
        source: nthreads_3
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_3
      - id: outFileNamePrefix
        source: runid_3
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_3
      - id: nthreads_2
        source: nthreads_3
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
  - id: star_rsem_wf_pe_4
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_4
      - id: nthreads
        source: nthreads_4
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_4
      - id: outFileNamePrefix
        source: runid_4
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_4
      - id: nthreads_2
        source: nthreads_4
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
  - id: star_rsem_wf_pe_5
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_5
      - id: nthreads
        source: nthreads_5
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_5
      - id: outFileNamePrefix
        source: runid_5
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_5
      - id: nthreads_2
        source: nthreads_5
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
  - id: star_rsem_wf_pe_6
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_6
      - id: nthreads
        source: nthreads_6
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_6
      - id: outFileNamePrefix
        source: runid_6
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_6
      - id: nthreads_2
        source: nthreads_6
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../rnaseq-star-rsem-pe/rnaseq-star-rsem-pe.cwl
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - "https://schema.org/version/latest/schemaorg-current-http.rdf"
  - "http://edamontology.org/EDAM_1.18.owl"
"s:author":
  - class: "s:Person"
    "s:email": "mailto:inutano@gmail.com"
    "s:identifier": "https://orcid.org/0000-0003-3777-5945"
    "s:name": Tazro Ohta
"s:codeRepository": "https://github.com/pitagora-network/pitagora-cwl"
"s:license": "https://spdx.org/licenses/Apache-2.0"
