#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.diversity.visualizers.alpha_rarefaction
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2019.4
    dockerImageId: qiime2/core:2019.4
    dockerOutputDirectory: /home/qiime2
label: Alpha rarefaction curves
doc: Generate interactive alpha rarefaction curves by computing rarefactions between `min_depth` and `max_depth`. The number of intermediate depths to compute is controlled by the `steps` parameter, with n `iterations` being computed at each rarefaction depth. If sample metadata is provided, samples may be grouped based on distinct values within a metadata column.

baseCommand: qiime
arguments:
  - diversity
  - alpha-rarefaction

inputs:
  table:
    label: table
    doc: Feature table to compute rarefaction curves from.
    type: File
    inputBinding:
      prefix: --i-table
  phylogeny:
    label: phylogeny
    doc: Optional phylogeny for phylogenetic metrics.
    type: File
    inputBinding:
      prefix: --i-phylogeny
  max_depth:
    doc: The maximum rarefaction depth. Must be greater than min_depth.
    type: long?
    inputBinding:
      prefix: --p-max-depth
  metrics:
    default: []
    doc: The metrics to be measured. By default computes observed_otus, shannon, and
      if phylogeny is provided, faith_pd.
    type: string[]
    inputBinding:
      prefix: --p-metrics
  metadata:
    doc: The sample metadata.
    type:
      - File
      - File[]
      - "null"
    inputBinding:
      prefix: --m-metadata-file
  min_depth:
    default: 1
    doc: The minimum rarefaction depth.
    type: long
    inputBinding:
      prefix: --p-min-depth
  steps:
    default: 10
    doc: The number of rarefaction depths to include between min_depth and max_depth.
    type: long
    inputBinding:
      prefix: --p-steps
  iterations:
    default: 10
    doc: The number of rarefied feature tables to compute at each step.
    type: long
    inputBinding:
      prefix: --p-iterations
  output_name:
    type: string
    inputBinding:
      prefix: --o-visualization
outputs:
  visualization:
    doc: null
    label: visualization
    outputBinding:
      glob: $(inputs.output_name)
    type: File
