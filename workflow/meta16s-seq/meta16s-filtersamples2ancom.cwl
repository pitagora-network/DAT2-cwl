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
  METADATA_COLUMN:
    label: column to be used for comaprison in ancom
    type: string

outputs:
  filtered_table:
    type: File
    outputSource: feature_table.methods.filter_samples/filtered_table
  barplot:
    type: File
    outputSource: taxa.visualizers.barplot/visualization
  ancom_result:
    type: File
    outputSource: composition.visualizers.ancom/visualization

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

  composition.methods.add_pseudocount:
    run: ../../tool/qiime2/composition.methods.add_pseudocount.cwl
    in:
      table: taxa.methods.collapse.table/collapsed_table
      output_name:
        default: table.filtered.collapse.comp.qza
    out:
      - composition_table # table.filtered.collapse.comp.qza

  composition.visualizers.ancom:
    run: ../../tool/qiime2/composition.visualizers.ancom.cwl
    in:
      table: composition.methods.add_pseudocount/composition_table
      metadata: METADATA
      metadata_column: METADATA_COLUMN
      output_name:
        default: table.filtered.collapse.comp.ancom.qzv
    out:
      - visualization # table.filtered.collapse.comp.ancom.qzv
