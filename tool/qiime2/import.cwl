#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.tools.import
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2019.4
    dockerImageId: qiime2/core:2019.4
    dockerOutputDirectory: /home/qiime2
label: Import data into a QIIME 2 Artifact

baseCommand: qiime

arguments:
  - tools
  - import

inputs:
  input_type:
    label: type
    doc: The Semantic Type to import the data as.
    type: string
    default: 'SampleData[PairedEndSequencesWithQuality]'
    inputBinding:
      prefix: --type
  input_format:
    label: input_format
    doc: The format the data is currently in.
    default: 'CasavaOneEightSingleLanePerSampleDirFmt'
    type: string?
    inputBinding:
      prefix: --input-format
  input_data:
    label: data
    doc: The data to import.
    type:
      - File
      - Directory
    inputBinding:
      prefix: --input-path
  output_name:
    label: output_name
    doc: The filename to use for the artifact.
    type: string?
    default: demux.qza
    inputBinding:
      prefix: --output-path
outputs:
  artifact:
    label: artifact
    type: File
    outputBinding:
      glob: $(inputs.output_name)
