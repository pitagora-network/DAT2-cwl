#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.composition.visualizers.ancom
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Apply ANCOM to identify features that differ in abundance.
doc: Apply Analysis of Composition of Microbiomes (ANCOM) to identify features that are differentially abundant across groups.

baseCommand: qiime
arguments:
  - composition
  - ancom

inputs:
  table:
    label: table
    doc: The feature table to be used for ANCOM computation.
    type: File
    inputBinding:
      prefix: --i-table
  metadata:
    doc: The categorical sample metadata column to test for differential abundance
      across.
    type: File
    inputBinding:
      prefix: --m-metadata-file
  metadata_column:
    doc: Column name to use from 'metadata'
    type: string
    inputBinding:
      prefix: --m-metadata-column
  transform_function:
    default: clr
    doc: The method applied to transform feature values before generating volcano
      plots.
    type: string
    inputBinding:
      prefix: --p-transform-function
  difference_function:
    doc: The method applied to visualize fold difference in feature abundances across groups for volcano plots.
    type: string?
    inputBinding:
      prefix: --p-difference-function
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
