#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Recalibrate quality scores for each base (See chapter: 塩基ごとの品質スコアの再校正)"
requirements:
  ScatterFeatureRequirement: {}
  StepInputExpressionRequirement: {}
inputs:
  known-site-urls:
    type: string[]
  reference:
    type: File
  dedupped-bam:
    type: File
steps:
  download-known-variations:
    run: wget.cwl
    in:
      url: known-site-urls
      use_remote_name:
        default: true
    scatter: url
    out:
      - downloaded
  download-variation-indices:
    run: wget.cwl
    in:
      url:
        source: known-site-urls
        valueFrom: $(self).tbi
      use_remote_name:
        default: true
    scatter: url
    out:
      - downloaded
  variation-with-index:
    run:
      class: CommandLineTool
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entry: $(inputs.variation)
            - entry: $(inputs.index)
      baseCommand: "true"
      inputs:
        variation: File
        index: File
      outputs:
        variation-with-index:
          type: File
          outputBinding:
            glob: $(inputs.variation.basename)
          secondaryFiles:
            - .tbi
    in:
      variation: download-known-variations/downloaded
      index: download-variation-indices/downloaded
    scatter:
      - variation
      - index
    scatterMethod: dotproduct
    out:
      - variation-with-index
  picard-create-dictionary:
    run: picard-CreateSequenceDictionary.cwl
    in:
      reference: reference
    out:
      - dict
  samtools-faidx:
    run: samtools-faidx.cwl
    in:
      fasta: reference
    out:
      - fasta-index
  reference-with-index:
    run:
      class: CommandLineTool
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entry: $(inputs.fasta)
            - entry: $(inputs.fai)
            - entry: $(inputs.dict)
      baseCommand: "true"
      inputs:
        fasta: File
        fai: File
        dict: File
      outputs:
        reference-with-index:
          type: File
          outputBinding:
            glob: $(inputs.fasta.basename)
          secondaryFiles:
            - .fai
            - ^.dict
    in:
      fasta: reference
      fai: samtools-faidx/fasta-index
      dict: picard-create-dictionary/dict
    out:
      - reference-with-index
  base-recalibrator:
    run: gatk-BaseRecalibrator.cwl
    in:
      input: dedupped-bam
      reference: reference-with-index/reference-with-index
      known_sites: variation-with-index/variation-with-index
      output_name:
        source: dedupped-bam
        valueFrom: $(self.nameroot).recaltab.txt
    out:
      - recalibration_table
  apply-bqsr:
    run: gatk-ApplyBQSR.cwl
    in:
      input: dedupped-bam
      output:
        source: dedupped-bam
        valueFrom: $(self.nameroot).recal.bam
      reference: reference-with-index/reference-with-index
      recal_file: base-recalibrator/recalibration_table
    out:
      - bam
outputs:
  recalibrated-bam:
    type: File
    outputSource: apply-bqsr/bam
