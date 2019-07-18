#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: bismark genome preparation workflow
requirements: {}

inputs:
  fasta:
    type: File
    doc: fasta file
    label: fasta file
steps:
  mkdir_ref:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/mkdir/mkdir.cwl
    in:
      dir_name:
        default: "ref"
    out: [created_directory]
  cp_to_directory:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/cp_to_directory/cp_to_directory.cwl
    in:
      file: fasta
      dest_dir: mkdir_ref/created_directory
    out: [result]
  bismark_genome_preparation:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/bismark/bismark_genome_preparation/bismark_genome_preparation.cwl
    in:
      ref_directory: cp_to_directory/result
    out:
      - output

outputs:
  output:
    type: Directory
    outputSource: bismark_genome_preparation/output
