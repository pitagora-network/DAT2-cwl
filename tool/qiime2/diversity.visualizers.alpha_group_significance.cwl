#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.diversity.visualizers.alpha_group_significance
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.8
    dockerImageId: qiime2/core:2020.8
    dockerOutputDirectory: /home/qiime2
label: Alpha diversity comparisons
doc: Visually and statistically compare groups of alpha diversity values.

baseCommand: qiime
arguments:
  - diversity
  - alpha-group-significance

inputs:
  alpha_diversity:
    label: alpha_diversity
    doc: Vector of alpha diversity values by sample.
    type: File
    inputBinding:
      prefix: --i-alpha-diversity
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
