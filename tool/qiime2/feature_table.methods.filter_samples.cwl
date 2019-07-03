#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.feature_table.methods.filter_samples
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2019.4
    dockerImageId: qiime2/core:2019.4
    dockerOutputDirectory: /home/qiime2
label: Filter samples from table
doc: Filter samples from table based on frequency and/or metadata. Any features with a frequency of zero after sample filtering will also be removed. See the filtering tutorial on https://docs.qiime2.org for additional details.

baseCommand: qiime
arguments:
  - feature-table
  - filter-samples

inputs:
  table:
    label: table
    doc: The feature table from which samples should be filtered.
    type: File
    inputBinding:
      prefix: --i-table
  min_frequency:
    default: 0
    doc: The minimum total frequency that a sample must have to be retained.
    type: long
    inputBinding:
      prefix: --p-min-frequency
  max_frequency:
    default: null
    doc: The maximum total frequency that a sample can have to be retained. If no value is provided this will default to infinity (i.e., no maximum frequency filter will be applied).
    type: long?
    inputBinding:
      prefix: --p-max-frequency
  min_features:
    default: 0
    doc: The minimum number of features that a sample must have to be retained.
    type: long
    inputBinding:
      prefix: --p-min-features
  max_features:
    default: null
    doc: The maximum number of features that a sample can have to be retained. If no value is provided this will default to infinity (i.e., no maximum feature filter will be applied).
    type: long?
    inputBinding:
      prefix: --p-max-features
  metadata:
    doc: Sample metadata used with `where` parameter when selecting samples to retain, or with `exclude_ids` when selecting samples to discard.
    type:
      - File?
      - File[]?
    inputBinding:
      prefix: --m-metadata-file
  where:
    default: null
    doc: SQLite WHERE clause specifying sample metadata criteria that must be met to be included in the filtered feature table. If not provided, all samples in `metadata` that are also in the feature table will be retained.
    type: string?
    inputBinding:
      prefix: --p-where
      shellQuote: true
  exclude_ids:
    default: false
    doc: If true, the samples selected by `metadata` or `where` parameters will be excluded from the filtered table instead of being retained.
    type: boolean
    inputBinding:
      prefix: --p-exclude-ids
  output_name:
    type: string
    inputBinding:
      prefix: --o-filtered-table

outputs:
  filtered_table:
    doc: The resulting feature table filtered by sample.
    label: filtered_table
    outputBinding:
      glob: $(inputs.output_name)
    type: File
