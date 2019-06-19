#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: string
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/macs2:2.1.2--py27r351h14c3975_1
  InlineJavascriptRequirement: {}
baseCommand: ["macs2", "callpeak"]
arguments:
  - position: 2
    prefix: -f
    valueFrom: BAM
  - position: 4
    prefix: -n
    valueFrom: $(inputs.target_bam.nameroot)
  - position: 5
    prefix: -B
    valueFrom: $(true)
inputs:
  target_bam:
    type: File
    inputBinding:
      prefix: -t
      position: 0
  control_bam:
    type: File
    inputBinding:
      prefix: -c
      position: 1
  organism:
    type: string?
    default: mm
    doc: "mouse: mm, human: hs"
    inputBinding:
      prefix: -g
      position: 3
  p-value:
    type: float?
    default: 0.01
    inputBinding:
      prefix: -q
      position: 6
outputs:
  model-r:
    type: File
    outputBinding:
      glob: $(inputs.target_bam.nameroot)_model.r
  peaks-narrow-peak:
    type: File
    outputBinding:
      glob: $(inputs.target_bam.nameroot)_peaks.narrowPeak
  peaks-xls:
    type: File
    outputBinding:
      glob: $(inputs.target_bam.nameroot)_peaks.xls
  summits-bed:
    type: File
    outputBinding:
      glob: $(inputs.target_bam.nameroot)_summits.bed
  treat-pileup-bdg:
    type: File
    outputBinding:
      glob: $(inputs.target_bam.nameroot)_treat_pileup.bdg
  control-lambda-bdg:
    type: File
    outputBinding:
      glob: $(inputs.target_bam.nameroot)_control_lambda.bdg
  stdout: stdout
  stderr: stderr
stdout: MACS2-stdout.log
stderr: MACS2-stderr.log
