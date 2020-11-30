#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.feature_table.visualizers.tabulate_seqs
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.8
    dockerImageId: qiime2/core:2020.8
    dockerOutputDirectory: /home/qiime2
label: View sequence associated with each feature
doc: Generate tabular view of feature identifier to sequence mapping, including links to BLAST each sequence against the NCBI nt database.

baseCommand: qiime
arguments:
  - feature-table
  - tabulate-seqs

inputs:
  data:
    label: data
    doc: The feature sequences to be tabulated.
    type: File
    inputBinding:
      prefix: --i-data
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
