#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.demux.visualizers.summarize
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2019.4
    dockerImageId: qiime2/core:2019.4
    dockerOutputDirectory: /home/qiime2
label: Summarize counts per sample.
doc: Summarize counts per sample for all samples, and generate interactive positional
  quality plots based on `n` randomly selected sequences.

baseCommand: qiime
arguments:
  - demux
  - summarize

inputs:
  data:
    label: data
    doc: The demultiplexed sequences to be summarized.
    type: File
    inputBinding:
      prefix: --i-data
  n:
    default: 10000
    doc: The number of sequences that should be selected at random for quality score
      plots. The quality plots will present the average positional qualities across
      all of the sequences selected. If input sequences are paired end, plots will
      be generated for both forward and reverse reads for the same `n` sequences.
    type: long
    inputBinding:
      prefix: --p-n
  output_name:
    label: output_name
    doc: The file name to use for the visualization.
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
