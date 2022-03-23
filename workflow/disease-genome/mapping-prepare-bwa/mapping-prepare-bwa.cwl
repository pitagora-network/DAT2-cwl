#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Preparing index (See chapter: BWA​の準備)"
inputs:
  fasta:
    type: File
steps:
  bwa-index:
    run: ../../../tool/bwa/index/bwa-index.cwl
    in:
      input_fasta: fasta
    out:
      - amb
      - ann
      - bwt
      - pac
      - sa
  to_fasta_with_index:
    run:
      class: CommandLineTool
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entry: $(inputs.fasta)
            - entry: $(inputs.amb)
            - entry: $(inputs.ann)
            - entry: $(inputs.bwt)
            - entry: $(inputs.pac)
            - entry: $(inputs.sa)
      baseCommand: "true"
      inputs:
        fasta: File
        amb: File
        ann: File
        bwt: File
        pac: File
        sa: File
      outputs:
        fasta_with_index:
          type: File
          outputBinding:
            glob: $(inputs.fasta.basename)
          secondaryFiles:
            - .amb
            - .ann
            - .bwt
            - .pac
            - .sa
    in:
      fasta: fasta
      amb: bwa-index/amb
      ann: bwa-index/ann
      bwt: bwa-index/bwt
      pac: bwa-index/pac
      sa: bwa-index/sa
    out:
      - fasta_with_index
outputs:
  fasta_with_index:
    type: File
    outputSource: to_fasta_with_index/fasta_with_index
