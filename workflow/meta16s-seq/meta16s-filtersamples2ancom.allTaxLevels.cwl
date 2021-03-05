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

outputs:
  barplot:
    type: Directory
    outputSource: tax-rank.2/barplot
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
      METADATA_COLUMN: METADATA_COLUMN
      BARPLOT_OUTPUT_NAME:
        default: barplot
      HEATMAP_OUTPUT_NAME:
        default: heatmap.2
      DATA_OUTPUT_NAME:
        default: ancom.2
    out:
      - barplot
      - heatmap
      - ancom

  tax-rank.3:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 3
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.3
      DATA_OUTPUT_NAME:
        default: ancom.3
    out:
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
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.4
      DATA_OUTPUT_NAME:
        default: ancom.4
    out:
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
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.5
      DATA_OUTPUT_NAME:
        default: ancom.5
    out:
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
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.6
      DATA_OUTPUT_NAME:
        default: ancom.6
    out:
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
      METADATA_COLUMN: METADATA_COLUMN
      HEATMAP_OUTPUT_NAME:
        default: heatmap.7
      DATA_OUTPUT_NAME:
        default: ancom.7
    out:
      - heatmap
      - ancom
