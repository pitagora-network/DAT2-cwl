#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Deduplication (See chapter: PCR由来の重複の除去(deduplication))"
requirements:
  StepInputExpressionRequirement: {}
inputs:
  input:
    type: File
steps:
  mark-duplicates:
    run: picard-MarkDuplicates.cwl
    in:
      input: input
      output_name:
        source: input
        valueFrom: $(self.nameroot).dedup$(self.nameext)
      metrics_file_name:
        source: input
        valueFrom: $(self.nameroot).dedup$(self.nameext).metrics.txt
      validation_stringency:
        default: LENIENT
      remove_duplicates:
        default: true
    out:
      - metrics
      - output
outputs:
  metrics:
    type: File
    outputSource: mark-duplicates/metrics
  output:
    type: File
    outputSource: mark-duplicates/output
