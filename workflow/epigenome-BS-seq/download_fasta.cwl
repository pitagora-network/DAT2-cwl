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

steps:
  wget:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/wget/wget.cwl
    in:
      url: url
      use_remote_name:
        default: true
    out:
      [downloaded]
  tar:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/tar/tar.cwl
    in:
      file: wget/downloaded
      extract:
        default: true
      gzip:
        default: true
    out:
      [output]

outputs:
  output:
    type: Directory
    outputSource: tar/output