#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Detect Variant (See chapter: バリアント検出)"
requirements:
  MultipleInputFeatureRequirement: {}
  StepInputExpressionRequirement: {}
inputs:
  reference_id:
    type: string
  ccds:
    type: File
  bam:
    type: File
    secondaryFiles:
      - ^.bai
  reference:
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
  dbsnp:
    type: File
    secondaryFiles:
      - .tbi
steps:
  sort-ccds:
    run: ../../../tool/disease-genome/sort-bed/sort-bed.cwl
    in:
      bed: ccds
    out:
      - sorted
  bedtool-merge:
    run: ../../../tool/disease-genome/bedtool-merge/bedtool-merge.cwl
    in:
      bed: sort-ccds/sorted
    out:
      - sorted
  run-HaplotypeCaller:
    run: ../../../tool/disease-genome/gatk-HaplotypeCaller/gatk-HaplotypeCaller.cwl
    in:
      input: bam
      output:
        source: reference_id
        valueFrom: $(self).g.vcf.gz
      reference: reference
      intervals: bedtool-merge/sorted
      interval_padding:
        default: 100
      emit-ref-confidence:
        default: GVCF
      dbsnp: dbsnp
      sample_name: reference_id
      heap_size:
        default: 4
    out:
      - gvcf
  run-GenotypeGVCFs:
    run: ../../../tool/disease-genome/gatk-GenotypeGVCFs/gatk-GenotypeGVCFs.cwl
    in:
      reference: reference
      variant: run-HaplotypeCaller/gvcf
      output:
        source: reference_id
        valueFrom: $(self).both.vcf.gz
      intervals: bedtool-merge/sorted
      interval_padding:
        default: 100
      heap_size:
        default: 4
    out:
      - vcf
  gunzip-raw:
    run: ../../../tool/gunzip/gunzip.cwl
    in:
      file: run-GenotypeGVCFs/vcf
    out:
      - decompressed
  remove-comment-from-raw:
    run: ../../../tool/grep/grep.cwl
    in:
      pattern:
        default: "^#"
      files:
        source: [gunzip-raw/decompressed]
        linkMerge: merge_flattened
      invert_match:
        default: true
    out:
      - output
  count-raw:
    run: ../../../tool/wc/wc.cwl
    in:
      file: remove-comment-from-raw/output
    out:
      - lines
  run-SelectVariants-SNV:
    run: ../../../tool/disease-genome/gatk-SelectVariants/gatk-SelectVariants.cwl
    in:
      reference: reference
      variant: run-GenotypeGVCFs/vcf
      select_type:
        default: SNP
      output:
        source: reference_id
        valueFrom: $(self).snv.raw.vcf.gz
      heap_size:
        default: 4
    out:
      - gvcf
  run-SelectVariants-INDEL:
    run: ../../../tool/disease-genome/gatk-SelectVariants/gatk-SelectVariants.cwl
    in:
      reference: reference
      variant: run-GenotypeGVCFs/vcf
      select_type:
        default: INDEL
      output:
        source: reference_id
        valueFrom: $(self).indel.raw.vcf.gz
      heap_size:
        default: 4
    out:
      - gvcf
  run-VariantFiltration-SNV:
    run: ../../../tool/disease-genome/gatk-VariantFiltration/gatk-VariantFiltration.cwl
    in:
      reference: reference
      variant: run-SelectVariants-SNV/gvcf
      output:
        source: reference_id
        valueFrom: $(self).snv.pass.vcf.gz
      filters:
        default:
          - expression: "QD < 2.0"
            name: QD2
          - expression: "QUAL < 30.0"
            name: QUAL30
          - expression: "FS > 60.0"
            name: FS60
          - expression: "MQ < 40.0"
            name: MQ40
          - expression: "MQRankSum < -12.5"
            name: "MQRankSum-12.5"
          - expression: "ReadPosRankSum < -8.0"
            name: "ReadPosRankSum-8"
      heap_size:
        default: 4
    out:
      - gvcf
  run-VariantFiltration-INDEL:
    run: ../../../tool/disease-genome/gatk-VariantFiltration/gatk-VariantFiltration.cwl
    in:
      reference: reference
      variant: run-SelectVariants-INDEL/gvcf
      output:
        source: reference_id
        valueFrom: $(self).indel.pass.vcf.gz
      filters:
        default:
          - expression: "QD < 2.0"
            name: QD2
          - expression: "QUAL < 30.0"
            name: QUAL30
          - expression: "FS > 200.0"
            name: FS200
          - expression: "ReadPosRankSum < -20.0"
            name: "ReadPosRankSum-20"
      heap_size:
        default: 4
    out:
      - gvcf
  gunzip-snv:
    run: ../../../tool/gunzip/gunzip.cwl
    in:
      file: run-VariantFiltration-SNV/gvcf
    out:
      - decompressed
  select-pass-from-snv:
    run: ../../../tool/grep/grep.cwl
    in:
      pattern:
        default: PASS
      files:
        source: [gunzip-snv/decompressed]
        linkMerge: merge_flattened
    out:
      - output
  count-snv:
    run: ../../../tool/wc/wc.cwl
    in:
      file: select-pass-from-snv/output
    out:
      - lines
  gunzip-indel:
    run: ../../../tool/gunzip/gunzip.cwl
    in:
      file: run-VariantFiltration-INDEL/gvcf
    out:
      - decompressed
  select-pass-from-indel:
    run: ../../../tool/grep/grep.cwl
    in:
      pattern:
        default: PASS
      files:
        source: [gunzip-indel/decompressed]
        linkMerge: merge_flattened
    out:
      - output
  count-indel:
    run: ../../../tool/wc/wc.cwl
    in:
      file: select-pass-from-indel/output
    out:
      - lines
outputs:
  raw-lines:
    type: int
    outputSource: count-raw/lines
  snv-lines:
    type: int
    outputSource: count-snv/lines
  indel-lines:
    type: int
    outputSource: count-indel/lines
