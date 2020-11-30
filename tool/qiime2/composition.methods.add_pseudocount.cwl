#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.composition.methods.add_pseudocount
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.8
    dockerImageId: qiime2/core:2020.8
    dockerOutputDirectory: /home/qiime2
label: Add pseudocount to table
doc: Increment all counts in table by pseudocount.

baseCommand: qiime
arguments:
  - composition
  - add-pseudocount

inputs:
  table:
    label: table
    doc: The feature table to which pseudocounts should be added.
    type: File
    inputBinding:
      prefix: --i-table
  pseudocount:
    default: 1
    doc: The value to add to all counts in the feature table.
    type: long
    inputBinding:
      prefix: --p-pseudocount
  output_name:
    type: string
    default: comp_table_ob_l5.qza
    inputBinding:
      prefix: --o-composition-table
outputs:
  composition_table:
    doc: The resulting feature table.
    label: composition_table
    outputBinding:
      glob: $(inputs.output_name)
    type: File
