#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements: {}
#  - class: SubworkflowFeatureRequirement
#  - class: ScatterFeatureRequirement

inputs:
  url:
    doc: Download target URL
    type: string
  use_remote_name:
    type: boolean
    default: true

steps:
  wget:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/wget/wget.cwl
    in:
      url: url
      use_remote_name: use_remote_name
    out:
      [downloaded]

outputs:
  downloaded:
    type: File
    outputSource: wget/downloaded