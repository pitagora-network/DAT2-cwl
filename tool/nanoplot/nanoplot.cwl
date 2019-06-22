#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/nanoplot:1.20.0--py36_0
baseCommand: NanoPlot

inputs:
  threads:
    type: int
    default: 2
    label: "Set the allowed number of threads to be used by the script"
    inputBinding:
      prefix: -t
  sequence:
    type: File
    label: "sequence file"
    inputBinding:
      prefix: --fastq

outputs:
  HistogramReadlength:
    type: File
    outputBinding:
      glob: "HistogramReadlength.png"
  LogTransformed_HistogramReadlength:
    type: File
    outputBinding:
      glob: "LogTransformed_HistogramReadlength.png"
  Yield_By_Length:
    type: File
    outputBinding:
      glob: "Yield_By_Length.png"
  LengthvsQualityScatterPlot_dot:
    type: File
    outputBinding:
      glob: "LengthvsQualityScatterPlot_dot.png"
  Weighted_HistogramReadlength:
    type: File
    outputBinding:
      glob: "Weighted_HistogramReadlength.png"
  LengthvsQualityScatterPlot_kde:
    type: File
    outputBinding:
      glob: "LengthvsQualityScatterPlot_kde.png"
  Weighted_LogTransformed_HistogramReadlength:
    type: File
    outputBinding:
      glob: "Weighted_LogTransformed_HistogramReadlength.png"
  NanoPlot-report:
    type: File
    outputBinding:
      glob: "NanoPlot-report.html"
  NanoStats:
    type: File
    outputBinding:
      glob: "NanoStats.txt"
  stdout: stdout
  stderr: stderr
stdout: nanoplot-stdout.log
stderr: nanoplot-stderr.log
