#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.tools.export
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Export data from a QIIME 2 Artifact
baseCommand: qiime
arguments:
- tools
- export
inputs:
  input_artifact:
    label: artifact
    doc: The data to export.
    type: File
    inputBinding:
      prefix: --input-path
  output_format:
    label: output_format
    doc: The format to export data to.
    type: string?
    inputBinding:
      prefix: --output-format
  output_name:
    label: output_name
    doc: The name of the directory to write into.
    type: string?
    default: data
    inputBinding:
      prefix: --output-path
outputs:
  data:
    label: data
    type:
      - File
      - Directory
    outputBinding:
      glob: $(inputs.output_name)
  feature_table:
    label: feature_table biom table
    type: File?
    outputBinding:
      glob: $(inputs.output_name)/feature-table.biom
