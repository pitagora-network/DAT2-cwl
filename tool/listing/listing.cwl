#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: ExpressionTool
doc: Listing specified files from a given directory
requirements:
  InlineJavascriptRequirement: {}
inputs:
  dir: Directory
  file_names: string[]
expression: |
  ${
    var ret = []
    for(var i=0; i < inputs.file_names.length; i++) {
      ret.push({
        class: "File",
        location: inputs.dir.location+"/"+inputs.file_names[i],
      });
    }
    return {
      files: ret,
    };
  }
outputs:
  files: File[]
