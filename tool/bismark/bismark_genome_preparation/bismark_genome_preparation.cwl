#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
label: bismark genome preparation
doc: bismark genome preparation
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bismark:0.20.0--0
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.ref_directory)
        writable: true
baseCommand: ["bismark_genome_preparation"]
inputs:
  ref_directory:
    type: Directory
    label: reference directory. Directory Bisulfite_Genome is created inside this directory
    doc: reference directory. Directory Bisulfite_Genome is created inside this directory
    inputBinding:
      position: 1
outputs:
  output:
    type: Directory
    outputBinding:
      glob: $(inputs.ref_directory.basename)
  stderr: stderr
  stdout: stdout
# stdout: bismark_genome_preparation-stdout.log
# stderr: bismark_genome_preparation-stderr.log
