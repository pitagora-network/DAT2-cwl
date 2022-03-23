cwlVersion: v1.0
class: Workflow
doc: filter samples with the given condition, draw barplot, perform ANCOM for all taxonomy levels

requirements:
  SubworkflowFeatureRequirement: {}

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
  METADATA_COLUMN:
    label: column to be used for comaprison in ancom
    type: string
  ROOTED_TREE:
    label: rooted tree data from phylogeny processing
    type: File

outputs:
  barplot:
      type: Directory
      outputSource: tax-rank.2/barplot
  diversity:
      type: Directory
      outputSource: tax-rank.2/diversity
  count_table_2:
      type: File
      outputSource: tax-rank.2/count_table
  count_table_3:
      type: File
      outputSource: tax-rank.3/count_table
  count_table_4:
      type: File
      outputSource: tax-rank.4/count_table
  count_table_5:
      type: File
      outputSource: tax-rank.5/count_table
  count_table_6:
      type: File
      outputSource: tax-rank.6/count_table
  count_table_7:
      type: File
      outputSource: tax-rank.7/count_table
  heatmap_2:
      type: Directory
      outputSource: tax-rank.2/heatmap
  heatmap_3:
      type: Directory
      outputSource: tax-rank.3/heatmap
  heatmap_4:
      type: Directory
      outputSource: tax-rank.4/heatmap
  heatmap_5:
      type: Directory
      outputSource: tax-rank.5/heatmap
  heatmap_6:
      type: Directory
      outputSource: tax-rank.6/heatmap
  heatmap_7:
      type: Directory
      outputSource: tax-rank.7/heatmap
  ancom_2:
      type: Directory
      outputSource: tax-rank.2/ancom
  ancom_3:
      type: Directory
      outputSource: tax-rank.3/ancom
  ancom_4:
      type: Directory
      outputSource: tax-rank.4/ancom
  ancom_5:
      type: Directory
      outputSource: tax-rank.5/ancom
  ancom_6:
      type: Directory
      outputSource: tax-rank.6/ancom
  ancom_7:
      type: Directory
      outputSource: tax-rank.7/ancom

steps:
  tax-rank.2:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 2
      COUNT_TABLE_OUTPUT_NAME:
        default: count_table.2.tsv
      METADATA_COLUMN: METADATA_COLUMN
      BARPLOT_OUTPUT_NAME:
        default: barplot
      HEATMAP_OUTPUT_NAME:
        default: heatmap.2
      ANCOM_OUTPUT_NAME:
        default: ancom.2
      ROOTED_TREE: ROOTED_TREE
    out:
      - barplot
      - count_table
      - heatmap
      - ancom
      - diversity

  tax-rank.3:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 3
      COUNT_TABLE_OUTPUT_NAME:
        default: count_table.3.tsv
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.3
      ANCOM_OUTPUT_NAME:
        default: ancom.3
      ROOTED_TREE: ROOTED_TREE
    out:
      - count_table
      - heatmap
      - ancom

  tax-rank.4:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 4
      COUNT_TABLE_OUTPUT_NAME:
        default: count_table.4.tsv
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.4
      ANCOM_OUTPUT_NAME:
        default: ancom.4
      ROOTED_TREE: ROOTED_TREE
    out:
      - count_table
      - heatmap
      - ancom

  tax-rank.5:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 5
      COUNT_TABLE_OUTPUT_NAME:
        default: count_table.5.tsv
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.5
      ANCOM_OUTPUT_NAME:
        default: ancom.5
      ROOTED_TREE: ROOTED_TREE
    out:
      - count_table
      - heatmap
      - ancom

  tax-rank.6:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 6
      COUNT_TABLE_OUTPUT_NAME:
        default: count_table.6.tsv
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.6
      ANCOM_OUTPUT_NAME:
        default: ancom.6
      ROOTED_TREE: ROOTED_TREE
    out:
      - count_table
      - heatmap
      - ancom

  tax-rank.7:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 7
      COUNT_TABLE_OUTPUT_NAME:
        default: count_table.7.tsv
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.7
      ANCOM_OUTPUT_NAME:
        default: ancom.7
      ROOTED_TREE: ROOTED_TREE
    out:
      - count_table
      - heatmap
      - ancom
