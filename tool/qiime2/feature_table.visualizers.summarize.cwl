#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.feature_table.visualizers.summarize
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2019.4
    dockerImageId: qiime2/core:2019.4
    dockerOutputDirectory: /home/qiime2
label: Summarize table
doc: Generate visual and tabular summaries of a feature table.

baseCommand: qiime
arguments:
  - feature-table
  - summarize

inputs:
  table:
    label: table
    doc: The feature table to be summarized.
    type: File
    inputBinding:
      prefix: --i-table
  sample_metadata:
    doc: The sample metadata.
    type:
      - File?
      - File[]?
    inputBinding:
      prefix: --m-sample-metadata-file
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
