#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "Download specified site with tbi"
requirements:
  MultipleInputFeatureRequirement: {}
  StepInputExpressionRequirement: {}
inputs:
  site-url:
    type: string
steps:
  download:
    run: ../../../tool/wget/wget.cwl
    in:
      url: site-url
      use_remote_name:
        default: true
    out:
      - downloaded
  download-variation-index:
    run: ../../../tool/wget/wget.cwl
    in:
      url:
        source: site-url
        valueFrom: $(self).tbi
      use_remote_name:
        default: true
    out:
      - downloaded
  gather:
    run:
      class: CommandLineTool
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entry: $(inputs.site)
            - entry: $(inputs.tbi)
      baseCommand: "true"
      inputs:
        site: File
        tbi: File
      outputs:
        site-with-tbi:
          type: File
          outputBinding:
            glob: $(inputs.site.basename)
          secondaryFiles:
            - .tbi
    in:
      site: download/downloaded
      tbi: download-variation-index/downloaded
    out:
      - site-with-tbi
outputs:
  site:
    type: File
    outputSource: gather/site-with-tbi
