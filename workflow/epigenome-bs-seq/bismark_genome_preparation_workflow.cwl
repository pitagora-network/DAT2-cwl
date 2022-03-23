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
  rename:
    run:
      class: CommandLineTool
      baseCommand: ["true"] # dummy command
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entry: $(inputs.fastafile)
      inputs:
        fastafile: File
      outputs:
        renamed_dir:
          type: Directory
          outputBinding:
            glob: $(runtime.outdir)
    in:
      fastafile: fasta
    out: [ renamed_dir ]

  bismark_genome_preparation:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/main/tool/bismark/bismark_genome_preparation/bismark_genome_preparation.cwl
    in:
      ref_directory: rename/renamed_dir
    out:
      - output

outputs:
  output:
    type: Directory
    outputSource: bismark_genome_preparation/output
