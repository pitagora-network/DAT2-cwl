#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.taxa.visualizers.barplot
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Visualize taxonomy with an interactive bar plot
doc: This visualizer produces an interactive barplot visualization of taxonomies. Interactive features include multi-level sorting, plot recoloring, sample relabeling, and SVG figure export.

baseCommand: qiime
arguments:
  - taxa
  - barplot

inputs:
  table:
    label: table
    doc: Feature table to visualize at various taxonomic levels.
    type: File
    inputBinding:
      prefix: --i-table
  taxonomy:
    label: taxonomy
    doc: Taxonomic annotations for features in the provided feature table. All features
      in the feature table must have a corresponding taxonomic annotation. Taxonomic
      annotations that are not present in the feature table will be ignored.
    type: File
    inputBinding:
      prefix: --i-taxonomy
  metadata:
    doc: The sample metadata.
    type:
      - File
      - File[]
    inputBinding:
      prefix: --m-metadata-file
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
