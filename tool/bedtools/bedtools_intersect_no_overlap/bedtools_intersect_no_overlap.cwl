#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
doc: bedtools intersect allows one to screen for overlaps between two sets of genomic features.
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bedtools:2.27.0--he860b03_3
  InlineJavascriptRequirement: {}
baseCommand: ["bedtools", "intersect"]
arguments:
  - position: 0
    prefix: -v
    valueFrom: $(true)
inputs:
  peaks_narrow_peak_a:
    type: File
    doc: Each feature in A is compared to B in search of overlaps
    inputBinding:
      position: 1
      prefix: -a
  peaks_narrow_peak_b:
    type: File
    doc: One or more BAM/BED/GFF/VCF file(s)
    inputBinding:
      position: 2
      prefix: -b
outputs:
  result-narrow-peak: stdout
  stderr: stderr
stdout: $(inputs.peaks_narrow_peak_a.nameroot).not_overlapped_with_$(inputs.peaks_narrow_peak_b.nameroot).narrowPeak
stderr: bedtools_intersect_overlap-stderr.log
