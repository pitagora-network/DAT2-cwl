#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.metadata.visualizers.tabulate
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Interactively explore Metadata in an HTML table
doc: "Generate a tabular view of Metadata. The output visualization supports interactive filtering, sorting, and exporting to common file formats."

baseCommand: qiime
arguments:
  - metadata
  - tabulate

inputs:
  input:
    doc: The metadata to tabulate.
    type:
      - File
      - File[]
    inputBinding:
      prefix: --m-input-file
  page_size:
    default: 100
    doc: The maximum number of Metadata records to display per page
    type: long
    inputBinding:
      prefix: --p-page-size
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
