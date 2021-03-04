#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.feature_table.visualizers.heatmap
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
  InitialWorkDirRequirement:
    listing:
    - entryname: inputs.json
      entry: '{"inputs": $(inputs)}'
label: Generate a heatmap representation of a feature table
doc: 'Generate a heatmap representation of a feature table with optional clustering on both the sample and feature axes. Tip: To generate a heatmap containing taxonomic annotations, use `qiime taxa collapse` to collapse the feature table at the desired taxonomic level.'

baseCommand: qiime
arguments:
  - feature-table
  - heatmap

inputs:
  table:
    label: table
    doc: The feature table to visualize.
    type: File
    inputBinding:
      prefix: --i-table
  metadata:
    doc: Annotate the sample IDs with these metadata values. When metadata is present
      and `cluster`='feature', samples will be sorted by the metadata values.
    type: File
    inputBinding:
      prefix: --m-metadata-file
  metadata_column:
    doc: Column name to use from 'metadata'
    type: string
    inputBinding:
      prefix: --m-metadata-column
  normalize:
    default: true
    doc: Normalize the feature table by adding a psuedocount of 1 and then taking
      the log10 of the table.
    type: boolean
    inputBinding:
      prefix: --p-normalize
  title:
    doc: Optional custom plot title.
    type: string?
    inputBinding:
      prefix: --p-title
  metric:
    default: euclidean
    doc: Metrics exposed by seaborn (see http://seaborn.pydata.org/generated/seaborn.clustermap.html#seaborn.clustermap
      for more detail).
    type: string
    inputBinding:
      prefix: --p-metric
  method:
    default: average
    doc: Clustering methods exposed by seaborn (see http://seaborn.pydata.org/generated/seaborn.clustermap.html#seaborn.clustermap
      for more detail).
    type: string
    inputBinding:
      prefix: --p-method
  cluster:
    default: both
    doc: Specify which axes to cluster.
    type: string
    inputBinding:
      prefix: --p-cluster
  color_scheme:
    default: rocket
    doc: The matplotlib colorscheme to generate the heatmap with.
    type: string
    inputBinding:
      prefix: --p-color-scheme
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
