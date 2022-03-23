#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.diversity.visualizers.beta_group_significance
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Beta diversity group significance
doc: Determine whether groups of samples are significantly different from one another using a permutation-based statistical test.

baseCommand: qiime
arguments:
  - diversity
  - beta-group-significance

inputs:
  distance_matrix:
    label: distance_matrix
    doc: Matrix of distances between pairs of samples.
    type: File
    inputBinding:
      prefix: --i-distance-matrix
  metadata:
    doc: Categorical sample metadata column.
    type: File
    inputBinding:
      prefix: --m-metadata-file
  metadata_column:
    doc: Column name to use from 'metadata'
    type: string
    inputBinding:
      prefix: --m-metadata-column
  method:
    default: permanova
    doc: The group significance test to be applied.
    type: string
    inputBinding:
      prefix: --p-method
  pairwise:
    default: false
    doc: Perform pairwise tests between all pairs of groups in addition to the test across all groups. This can be very slow if there are a lot of groups in the metadata column.
    type: boolean
    inputBinding:
      prefix: --p-pairwise
  permutations:
    default: 999
    doc: The number of permutations to be run when computing p-values.
    type: long
    inputBinding:
      prefix: --p-permutations
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
