cwlVersion: v1.0
class: Workflow
doc: Meta 16S Sequence data analysis pipeline originally developed by Yuh Shiwa, implemented by Tazro Ohta, with the steps to download demo data.

requirements:
  SubworkflowFeatureRequirement: {}

inputs:
  fastq.tar.url:
    type: string
    default: https://zenodo.org/record/3371848/files/fastq.tar.gz
  metadata.url:
    type: string
    default: https://zenodo.org/record/3371848/files/metadata.txt
  classifier.url:
    type: string
    default: https://zenodo.org/record/3371848/files/gg-13-8-99-nb-classifier.qza

steps:
  download.fastq.tar:
    run: ../../tool/wget/wget.cwl
    in:
      url: fastq.tar.url
      use_remote_name:
        default: true
    out:
      - downloaded
  extract.fastq.tar:
    run: ../../tool/tar/tar.cwl
    in:
      file: download.fastq.tar/downloaded
      extract:
        default: true
      gzip:
        default: true
    out:
      - output
  download.metadata:
    run: ../../tool/wget/wget.cwl
    in:
      url: metadata.url
      use_remote_name:
        default: true
    out:
      - downloaded
  download.classifier:
    run: ../../tool/wget/wget.cwl
    in:
      url: classifier.url
      use_remote_name:
        default: true
    out:
      - downloaded
  meta16s-seq-wf:
    run: meta16s-seq.cwl
    in:
      INPUT: extract.fastq.tar/output
      METADATA: download.metadata/downloaded
      CLASSIFIER: download.classifier/downloaded
    out:
      - demux.vis
      - stats-dada2.vis
      - table.vis
      - rep-seqs.vis
      - observed_otus-group-significance.vis
      - shannon-group-significance.vis
      - faith-pd-group-significance.vis
      - unweighted-unifrac-group-significance.vis
      - weighted-unifrac-group-significance.vis
      - alpha-rarefaction.vis
      - taxonomy.vis
      - taxa-bar-plots.vis
      - heatmap_l5_group.vis
      - ancom_table_ob_l5_diet.vis

outputs:
  demux.vis:
    type: File
    outputSource: meta16s-seq-wf/demux.vis
  stats-dada2.vis:
    type: File
    outputSource: meta16s-seq-wf/stats-dada2.vis
  table.vis:
    type: File
    outputSource: meta16s-seq-wf/table.vis
  rep-seqs.vis:
    type: File
    outputSource: meta16s-seq-wf/rep-seqs.vis
  observed_otus-group-significance.vis:
    type: File
    outputSource: meta16s-seq-wf/observed_otus-group-significance.vis
  shannon-group-significance.vis:
    type: File
    outputSource: meta16s-seq-wf/shannon-group-significance.vis
  faith-pd-group-significance.vis:
    type: File
    outputSource: meta16s-seq-wf/faith-pd-group-significance.vis
  unweighted-unifrac-group-significance.vis:
    type: File
    outputSource: meta16s-seq-wf/unweighted-unifrac-group-significance.vis
  weighted-unifrac-group-significance.vis:
    type: File
    outputSource: meta16s-seq-wf/weighted-unifrac-group-significance.vis
  alpha-rarefaction.vis:
    type: File
    outputSource: meta16s-seq-wf/alpha-rarefaction.vis
  taxonomy.vis:
    type: File
    outputSource: meta16s-seq-wf/taxonomy.vis
  taxa-bar-plots.vis:
    type: File
    outputSource: meta16s-seq-wf/taxa-bar-plots.vis
  heatmap_l5_group.vis:
    type: File
    outputSource: meta16s-seq-wf/heatmap_l5_group.vis
  ancom_table_ob_l5_diet.vis:
    type: File
    outputSource: meta16s-seq-wf/ancom_table_ob_l5_diet.vis
