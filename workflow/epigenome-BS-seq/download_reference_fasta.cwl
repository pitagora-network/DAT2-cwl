#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: string
requirements: {}

inputs:
  url:
    doc: Download target URL
    type: string
  fastafilename:
    doc: Name of created fasta file
    type: string
    default: "hg38.fasta"

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
  lists:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/listing/listing.cwl
    in:
      dir: tar/output
      file_names:
        default:
          - chr1.fa
          - chr2.fa
          - chr3.fa
          - chr4.fa
          - chr5.fa
          - chr6.fa
          - chr7.fa
          - chr8.fa
          - chr9.fa
          - chr10.fa
          - chr11.fa
          - chr12.fa
          - chr13.fa
          - chr14.fa
          - chr15.fa
          - chr16.fa
          - chr17.fa
          - chr18.fa
          - chr19.fa
          - chr20.fa
          - chr21.fa
          - chr22.fa
          - chrX.fa
          - chrY.fa
          - chrM.fa
          - chrEBV.fa
    out:
      [files]
  cat:
    run: https://raw.githubusercontent.com/pitagora-network/DAT2-cwl/develop/tool/cat/cat.cwl
    in:
      files: lists/files
    out:
      [concatinated]
  rename:
    run:
      class: CommandLineTool
      baseCommand: ["true"] # dummy command
      requirements:
        InitialWorkDirRequirement:
          listing:
            - entryname: $(inputs.finalfilename)
              entry: $(inputs.oldfile)
      inputs:
        oldfile: File
        finalfilename: string
      outputs:
        renamed_file:
          type: File
          outputBinding:
            glob: $(inputs.finalfilename)
    in:
      oldfile: cat/concatinated
      finalfilename: fastafilename
    out: [ renamed_file ]

outputs:
  output_fasta:
    type: File
    outputSource: rename/renamed_file
