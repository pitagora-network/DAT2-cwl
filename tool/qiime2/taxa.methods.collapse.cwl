#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.taxa.methods.collapse
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.8
    dockerImageId: qiime2/core:2020.8
    dockerOutputDirectory: /home/qiime2
  InitialWorkDirRequirement:
    listing:
    - entryname: inputs.json
      entry: '{"inputs": $(inputs)}'
label: Collapse features by their taxonomy at the specified level
doc: Collapse groups of features that have the same taxonomic assignment through the
  specified level. The frequencies of all features will be summed when they are collapsed.

baseCommand: qiime
arguments:
  - taxa
  - collapse

inputs:
  table:
    label: table
    doc: Feature table to be collapsed.
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
  level:
    default: null
    doc: The taxonomic level at which the features should be collapsed. All ouput
      features will have exactly this many levels of taxonomic annotation.
    type: int
    inputBinding:
      prefix: --p-level
  output_name:
    type: string
    inputBinding:
      prefix: --o-collapsed-table
outputs:
  collapsed_table:
    doc: The resulting feature table, where all features are now taxonomic annotations
      with the user-specified number of levels.
    label: collapsed_table
    outputBinding:
      glob: $(inputs.output_name)
    type: File
