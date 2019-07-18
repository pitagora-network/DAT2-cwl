class: Workflow
cwlVersion: v1.0
id: transcriptome_assemble
label: transcriptome_assemble
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: split_spot
    type: boolean?
    'sbg:exposed': true
  - id: split_files
    type: boolean?
    'sbg:exposed': true
  - id: split_3
    type: boolean?
    'sbg:exposed': true
  - id: skip_technical
    type: boolean?
    'sbg:exposed': true
  - id: runid
    type: string
    'sbg:exposed': true
  - id: output_name
    type: string
    'sbg:exposed': true
  - id: url
    type: string
    'sbg:exposed': true
  - id: minimum_protein_length
    type: int
    'sbg:exposed': true
  - id: domtblout
    type: string
    'sbg:exposed': true
  - id: output_1
    type: string
    'sbg:exposed': true
  - id: cpu
    type: int
    'sbg:x': 131
    'sbg:y': -273
  - id: out_flag_1
    type: string
    'sbg:exposed': true
  - id: outfmt_flag
    type: string
    'sbg:exposed': true
  - id: max_target_seqs
    type: int?
    'sbg:exposed': true
  - id: db_flag_1
    type: string
    'sbg:exposed': true
  - id: url_1
    type: string
    'sbg:exposed': true
  - id: output_name_1
    type: string
    'sbg:exposed': true
  - id: max_memory
    type: string
    'sbg:x': 183.18011474609375
    'sbg:y': -25.5
  - id: seq_type
    type: string
    'sbg:exposed': true
  - id: est_method
    type: string
    'sbg:exposed': true
  - id: output_dir
    type: string?
    'sbg:exposed': true
  - id: seqType
    type: string?
    'sbg:exposed': true
  - id: db_flag
    type: string
    'sbg:exposed': true
  - id: out_flag
    type: string
    'sbg:exposed': true
outputs:
  - id: output2
    outputSource:
      - for_trinity/output2
    type: File
    'sbg:x': 455
    'sbg:y': -7
  - id: output1
    outputSource:
      - for_trinity/output1
    type: File
    'sbg:x': 420
    'sbg:y': 360
  - id: output
    outputSource:
      - transdecoder/output
    type: Directory?
    'sbg:x': 921
    'sbg:y': 286
  - id: out
    outputSource:
      - extract_transcript_id/out
    type: File?
    'sbg:x': 1347
    'sbg:y': -70
  - id: reverse
    outputSource:
      - fasterq_dump/reverse
    type: File?
    'sbg:x': -233.8203125
    'sbg:y': 74.5
  - id: forward
    outputSource:
      - fasterq_dump/forward
    type: File?
    'sbg:x': -203.8203125
    'sbg:y': 438.5
  - id: blast_results
    outputSource:
      - blastp/blast_results
    type: File
    'sbg:x': 1613.68310546875
    'sbg:y': 403.5
  - id: output_2
    outputSource:
      - aaea/output
    type: Directory?
    'sbg:x': 849
    'sbg:y': 427
  - id: trinity_results
    outputSource:
      - trinity_pe/trinity_results
    type: File
    'sbg:x': 654.1796875
    'sbg:y': 42.5
  - id: blastdbcmd_results
    outputSource:
      - blastdbcmd/blastdbcmd_results
    type: File
    'sbg:x': 1350.1796875
    'sbg:y': 86.5
  - id: db_dir
    outputSource:
      - makeblastdb/db_dir
    type: Directory?
    'sbg:x': 1183.18017578125
    'sbg:y': 318.5
  - id: db_dir_1
    outputSource:
      - makeblastdb_1/db_dir
    type: Directory?
    'sbg:x': 1392.18017578125
    'sbg:y': 672.5
  - id: pep
    outputSource:
      - transdecoder/pep
    type: File?
    'sbg:x': 903
    'sbg:y': 75
steps:
  - id: for_trinity
    in:
      - id: IN1
        source: trim_galore/out1
      - id: IN2
        source: trim_galore/out2
    out:
      - id: output1
      - id: output2
    run: ../../tool/for_trinity/for_trinity.cwl
    label: for_trinity
    'sbg:x': 316
    'sbg:y': 176
  - id: fasterq_dump
    in:
      - id: skip_technical
        source: skip_technical
      - id: split_3
        source: split_3
      - id: split_files
        source: split_files
      - id: split_spot
        source: split_spot
      - id: runid
        source: runid
    out:
      - id: fastqFiles
      - id: forward
      - id: reverse
    run: ../../tool/fasterq-dump/fasterq-dump.cwl
    label: 'fasterq-dump: dump .sra format file to generate fastq file'
    'sbg:x': -375
    'sbg:y': 222
  - id: transdecoder
    in:
      - id: transcripts
        source: trinity_pe/trinity_results
      - id: minimum_protein_length
        source: minimum_protein_length
    out:
      - id: output
      - id: pep
    run: ../../tool/TransDecoder/TransDecoder-TransDecoder.LongOrfs/TransDecoder-TransDecoder.LongOrfs.cwl
    label: transdecoder
    'sbg:x': 803
    'sbg:y': 191
  - id: wget-Sod_Cu-hmm
    in:
      - id: output_name
        source: output_name
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../tool/wget/wget.cwl
    label: 'wget:Sod_Cu.hmm'
    'sbg:x': 874
    'sbg:y': -66
  - id: gzip
    in:
      - id: file
        source: fasterq_dump/reverse
    out:
      - id: compressed
      - id: stderr
    run: ../../tool/gzip/gzip.cwl
    'sbg:x': -70
    'sbg:y': 147
  - id: gzip_1
    in:
      - id: file
        source: fasterq_dump/forward
    out:
      - id: compressed
      - id: stderr
    run: ../../tool/gzip/gzip.cwl
    'sbg:x': -61
    'sbg:y': 306
  - id: trim_galore
    in:
      - id: read1
        source: gzip_1/compressed
      - id: read2
        source: gzip/compressed
      - id: fastqc
        default: true
      - id: trim1
        default: true
      - id: paired
        default: true
    out:
      - id: out1
      - id: out2
    run: ../../tool/trim_galore/trim_galore-pe/trim_galore-pe.cwl
    label: trim_galore
    'sbg:x': 122
    'sbg:y': 234
  - id: hmmsearch
    in:
      - id: cpu
        source: cpu
      - id: domtblout
        source: domtblout
      - id: hmm
        source: wget-Sod_Cu-hmm/downloaded
      - id: pep
        source: transdecoder/pep
    out:
      - id: output
    run: ../../tool/hmmer/hmmer-hmmsearch/hmmer-hmmsearch.cwl
    label: hmmsearch
    'sbg:x': 1123
    'sbg:y': -176
  - id: extract_transcript_id
    in:
      - id: input
        source: hmmsearch/output
      - id: output
        source: output_1
    out:
      - id: out
    run: ../../tool/extract_transcript_id/extract_transcript_id.cwl
    label: extract_transcript_id
    'sbg:x': 1205
    'sbg:y': -61
  - id: wget-uniprot-taxonomy_50557-fasta
    in:
      - id: output_name
        default: uniprot-taxonomy_50557.fasta
        source: output_name_1
      - id: url
        default: 'https://www.uniprot.org/uniprot/?query=taxonomy:50557&format=fasta'
        source: url_1
    out:
      - id: downloaded
      - id: stderr
    run: ../../tool/wget/wget.cwl
    label: 'wget:uniprot-taxonomy_50557.fasta'
    'sbg:x': 1019
    'sbg:y': 623
  - id: makeblastdb_1
    in:
      - id: input_pep
        source: wget-uniprot-taxonomy_50557-fasta/downloaded
      - id: out
        default: uniprot_insect
    out:
      - id: db_dir
    run: ../../tool/blast/blast-makeblastdb/blast-makeblastdb.cwl
    label: makeblastdb
    'sbg:x': 1245
    'sbg:y': 530
  - id: blastp
    in:
      - id: blastdb_dir
        source: makeblastdb_1/db_dir
      - id: db_flag
        source: db_flag_1
      - id: num_threads_flag
        source: cpu
      - id: out_flag
        default: uniprot_insect
        source: out_flag_1
      - id: outfmt_flag
        source: outfmt_flag
      - id: query_flag
        source: blastdbcmd/blastdbcmd_results
      - id: max_target_seqs
        source: max_target_seqs
    out:
      - id: blast_results
    run: ../../tool/blast/blast-blastp/blast-blastp.cwl
    label: BLASTP search.
    'sbg:x': 1455
    'sbg:y': 404
  - id: trinity_pe
    in:
      - id: cpu
        source: cpu
      - id: fq1
        source: for_trinity/output1
      - id: fq2
        source: for_trinity/output2
      - id: max_memory
        source: max_memory
      - id: seq_type
        source: seq_type
    out:
      - id: trinity_results
    run: ../../tool/Trinity/Trinity-pe/Trinity-pe.cwl
    label: Trinity
    'sbg:x': 545
    'sbg:y': 174
  - id: aaea
    in:
      - id: thread_count
        default: true
      - id: left
        source: for_trinity/output1
      - id: right
        source: for_trinity/output2
      - id: est_method
        default: kallisto
        source: est_method
      - id: kallisto_add_opts
        default: true
      - id: prep_reference
        default: true
      - id: output_dir
        source: output_dir
      - id: seqType
        source: seqType
      - id: transcripts
        source: trinity_pe/trinity_results
      - id: cpu
        source: cpu
    out:
      - id: output
    run: ../../tool/Trinity/Trinity-aaea/Trinity-aaea.cwl
    label: align_and_estimate_abundance.pl
    'sbg:x': 668
    'sbg:y': 425
  - id: makeblastdb
    in:
      - id: input_pep
        source: transdecoder/pep
      - id: out
        default: trinity_rslt
    out:
      - id: db_dir
    run: ../../tool/blast/blast-makeblastdb/blast-makeblastdb.cwl
    label: makeblastdb
    'sbg:x': 1029
    'sbg:y': 181
  - id: blastdbcmd
    in:
      - id: blastdb_dir
        source: makeblastdb/db_dir
      - id: db_flag
        source: db_flag
      - id: entry_batch_flag
        source: extract_transcript_id/out
      - id: out_flag
        source: out_flag
    out:
      - id: blastdbcmd_results
    run: ../../tool/blast/blast-blastdbcmd/blast-blastdbcmd.cwl
    label: Blastdbcmd to dump seqs/info.
    'sbg:x': 1231
    'sbg:y': 161
requirements: []
