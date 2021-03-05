cwlVersion: v1.0
class: Workflow
doc: filter samples with the given condition, draw barplot, perform ANCOM

inputs:
  TABLE:
    label: read count table
    type: File
  METADATA:
    label: tabulate metadata file
    type: File
  FILTER_CONDITION:
    label: filtering condition based on column name of metadata file e.g. "[diagnosis]='Control' OR [diagnosis]='CD'"
    type: string
  TAXONOMY:
    label: taxonomy classification data
    type: File
  TAXONOMY_LEVEL:
    label: taxonomic level to be collapsed to
    type: int
    default: 7
  METADATA_COLUMN:
    label: column to be used for comaprison in ancom
    type: string
  BARPLOT_OUTPUT_NAME:
    label: output file name for barplot
    type: string
    default: table.filtered.taxa-bar-plots
  HEATMAP_OUTPUT_NAME:
    label: output file name for heatmap
    type: string
    default: table.filtered.collapse.heatmap
  ANCOM_OUTPUT_NAME:
    label: output file name for ancom data
    type: string
    default: table.filtered.collapse.comp.ancom

outputs:
  filtered_table:
    type: File
    outputSource: feature_table.methods.filter_samples/filtered_table
  barplot:
    type: Directory
    outputSource: tools.export.barplot/data
  heatmap:
    type: Directory
    outputSource: tools.export.heatmap/data
  ancom:
    type: Directory
    outputSource: tools.export.ancom/data

steps:
  feature_table.methods.filter_samples:
    run: ../../tool/qiime2/feature_table.methods.filter_samples.cwl
    in:
      table: TABLE
      metadata: METADATA
      where: FILTER_CONDITION
      output_name:
        default: table.filtered.qza
    out:
      - filtered_table # table.filtered.qza

  taxa.visualizers.barplot:
    run: ../../tool/qiime2/taxa.visualizers.barplot.cwl
    in:
      table: feature_table.methods.filter_samples/filtered_table
      metadata: METADATA
      taxonomy: TAXONOMY
      output_name:
        default: table.filtered.taxa-bar-plots.qzv
    out:
      - visualization # table.filtered.taxa-bar-plots.qzv

  tools.export.barplot:
    run: ../../tool/qiime2/tools.export.cwl
    in:
      input_artifact: taxa.visualizers.barplot/visualization
      output_name: BARPLOT_OUTPUT_NAME
    out:
      - data

  taxa.methods.collapse.table:
    run: ../../tool/qiime2/taxa.methods.collapse.cwl
    in:
      table: feature_table.methods.filter_samples/filtered_table
      taxonomy: TAXONOMY
      level: TAXONOMY_LEVEL
      output_name:
        default: table.filtered.collapse.qza
    out:
      - collapsed_table # table.filtered.collapse.qza

  feature_table.visualizers.heatmap:
    run: ../../tool/qiime2/feature_table.visualizers.heatmap.cwl
    in:
      table: taxa.methods.collapse.table/collapsed_table
      metadata: METADATA
      metadata_column: METADATA_COLUMN
      output_name:
        default: table.filtered.collapse.heatmap.qzv
    out:
      - visualization # heatmap.qzv

  tools.export.heatmap:
    run: ../../tool/qiime2/tools.export.cwl
    in:
      input_artifact: feature_table.visualizers.heatmap/visualization
      output_name: HEATMAP_OUTPUT_NAME
    out:
      - data

  composition.methods.add_pseudocount:
    run: ../../tool/qiime2/composition.methods.add_pseudocount.cwl
    in:
      table: taxa.methods.collapse.table/collapsed_table
      output_name:
        default: table.filtered.collapse.comp.qza
    out:
      - composition_table # table.filtered.collapse_7.comp.qza

  composition.visualizers.ancom:
    run: ../../tool/qiime2/composition.visualizers.ancom.cwl
    in:
      table: composition.methods.add_pseudocount/composition_table
      metadata: METADATA
      metadata_column: METADATA_COLUMN
      output_name:
        default: table.filtered.collapse_7.comp.ancom.qzv
    out:
      - visualization # table.filtered.collapse_7.comp.ancom.qzv

  tools.export.ancom:
    run: ../../tool/qiime2/tools.export.cwl
    in:
      input_artifact: composition.visualizers.ancom/visualization
      output_name: ANCOM_OUTPUT_NAME
    out:
      - data # table.filtered.collapse_7.comp.ancom
