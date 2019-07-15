#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements: {}
inputs:
  input_1:
    type: string
steps:
  step-1:
    run: string
    in:
      input_1: input_1
    out:
      - output_1
outputs:
  step-1_output_1:
    type: File
    outputSource: step-1/output_1
