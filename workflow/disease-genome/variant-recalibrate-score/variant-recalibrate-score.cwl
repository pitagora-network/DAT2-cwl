#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Recalibrate quality scores for each base (See chapter: 塩基ごとの品質スコアの再校正)"
requirements:
  MultipleInputFeatureRequirement: {}
  StepInputExpressionRequirement: {}
  SubworkflowFeatureRequirement: {}
inputs:
  dbsnp-url:
    type: string
  mills-url:
    type: string
  reference:
    type: File
  dedupped-bam:
    type: File
steps:
  download-dbsnp:
    run: download-known-site.cwl
    in:
      site-url: dbsnp-url
    out:
      - site
  download-mills:
    run: download-known-site.cwl
    in:
      site-url: mills-url
    out:
      - site
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
  gather-index:
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
        reference:
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
      - reference
  base-recalibrator:
    run: gatk-BaseRecalibrator.cwl
    in:
      input: dedupped-bam
      reference: gather-index/reference
      known_sites:
        source: [download-dbsnp/site, download-mills/site]
        linkMerge: merge_flattened
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
      reference: gather-index/reference
      recal_file: base-recalibrator/recalibration_table
    out:
      - bam
outputs:
  recalibrated-bam:
    type: File
    outputSource: apply-bqsr/bam
  dbsnp:
    type: File
    outputSource: download-dbsnp/site
  reference-with-index:
    type: File
    outputSource: gather-index/reference
