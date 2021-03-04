#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: qiime2.plugins.feature_classifier.methods.classify_sklearn
requirements:
  DockerRequirement:
    dockerPull: qiime2/core:2020.2
    dockerImageId: qiime2/core:2020.2
    dockerOutputDirectory: /home/qiime2
label: Pre-fitted sklearn-based taxonomy classifier
doc: Classify reads by taxon using a fitted classifier.

baseCommand: qiime
arguments:
  - feature-classifier
  - classify-sklearn

inputs:
  reads:
    label: reads
    doc: The feature data to be classified.
    type: File
    inputBinding:
      prefix: --i-reads
  classifier:
    label: classifier
    doc: The taxonomic classifier for classifying the reads.
    type: File
    inputBinding:
      prefix: --i-classifier
  reads_per_batch:
    default: 0
    doc: Number of reads to process in each batch. If 0, this parameter is autoscaled to min( number of query sequences / n_jobs, 20000).
    type: long
    inputBinding:
      prefix: --p-reads-per-batch
  n_jobs:
    default: 1
    doc: The maximum number of concurrently worker processes. If -1 all CPUs are used. If 1 is given, no parallel computing code is used at all, which is useful for debugging. For n_jobs below -1, (n_cpus + 1 + n_jobs) are used. Thus for n_jobs = -2, all CPUs but one are used.
    type: long
    inputBinding:
      prefix: --p-n-jobs
  pre_dispatch:
    default: 2*n_jobs
    doc: '"all" or expression, as in "3*n_jobs". The number of batches (of tasks) to be pre-dispatched.'
    type: string
    inputBinding:
      prefix: --p-pre-dispatch
  confidence:
    default: 0.7
    doc: Confidence threshold for limiting taxonomic depth. Provide -1 to disable confidence calculation, or 0 to calculate confidence but not apply it to limit the taxonomic depth of the assignments.
    type: double
    inputBinding:
      prefix: --p-confidence
  read_orientation:
    default: null
    doc: Direction of reads with respect to reference sequences. same will cause reads to be classified unchanged; reverse-complement will cause reads to be reversed and complemented prior to classification. Default is to autodetect based on the confidence estimates for the first 100 reads.
    type: string?
    inputBinding:
      prefix: --p-read-orientation
  output_name:
    type: string
    inputBinding:
      prefix: --o-classification
outputs:
  classification:
    doc: null
    label: classification
    outputBinding:
      glob: $(inputs.output_name)
    type: File
