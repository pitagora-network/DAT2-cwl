class: Workflow
cwlVersion: v1.0
id: transcriptome_assemble
label: transcriptome_assemble
inputs:
  - id: split_spot
    type: boolean?
  - id: split_files
    type: boolean?
  - id: split_3
    type: boolean?
  - id: skip_technical
    type: boolean?
  - id: runid
    type: string
  - id: output_name
    type: string
  - id: url
    type: string
  - id: minimum_protein_length
    type: int
  - id: domtblout
    type: string
  - id: output_1
    type: string
  - id: cpu
    type: int
  - id: out_flag_1
    type: string
  - id: outfmt_flag
    type: string
  - id: max_target_seqs
    type: int?
  - id: db_flag_1
    type: string
  - id: url_1
    type: string
  - id: output_name_1
    type: string
  - id: max_memory
    type: string
  - id: seq_type
    type: string
  - id: est_method
    type: string
  - id: output_dir
    type: string?
  - id: seqType
    type: string?
  - id: db_flag
    type: string
  - id: out_flag
    type: string
outputs:
  - id: output2
    outputSource:
      - for_trinity/output2
    type: File
  - id: output1
    outputSource:
      - for_trinity/output1
    type: File
  - id: output
    outputSource:
      - transdecoder/output
    type: Directory?
  - id: out
    outputSource:
      - extract_transcript_id/out
    type: File?
  - id: reverse
    outputSource:
      - fasterq_dump/reverse
    type: File?
  - id: forward
    outputSource:
      - fasterq_dump/forward
    type: File?
  - id: blast_results
    outputSource:
      - blastp/blast_results
    type: File
  - id: output_2
    outputSource:
      - aaea/output
    type: Directory?
  - id: trinity_results
    outputSource:
      - trinity_pe/trinity_results
    type: File
  - id: blastdbcmd_results
    outputSource:
      - blastdbcmd/blastdbcmd_results
    type: File
  - id: db_dir
    outputSource:
      - makeblastdb/db_dir
    type: Directory?
  - id: db_dir_1
    outputSource:
      - makeblastdb_1/db_dir
    type: Directory?
  - id: pep
    outputSource:
      - transdecoder/pep
    type: File?
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
    label: "fasterq-dump: dump .sra format file to generate fastq file"
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
    label: "wget:Sod_Cu.hmm"
  - id: gzip
    in:
      - id: file
        source: fasterq_dump/reverse
    out:
      - id: compressed
      - id: stderr
    run: ../../tool/gzip/gzip.cwl
  - id: gzip_1
    in:
      - id: file
        source: fasterq_dump/forward
    out:
      - id: compressed
      - id: stderr
    run: ../../tool/gzip/gzip.cwl
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
  - id: wget-uniprot-taxonomy_50557-fasta
    in:
      - id: output_name
        default: uniprot-taxonomy_50557.fasta
        source: output_name_1
      - id: url
        default: "https://www.uniprot.org/uniprot/?query=taxonomy:50557&format=fasta"
        source: url_1
    out:
      - id: downloaded
      - id: stderr
    run: ../../tool/wget/wget.cwl
    label: "wget:uniprot-taxonomy_50557.fasta"
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
requirements: []
