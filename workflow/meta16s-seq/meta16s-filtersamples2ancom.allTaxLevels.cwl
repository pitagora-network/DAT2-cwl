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
    type: File
    outputSource: composition.visualizers.ancom.1/barplot
  ancom_result_1:
      type: File
      outputSource: composition.visualizers.ancom.1/ancom_result
  ancom_result_2:
      type: File
      outputSource: composition.visualizers.ancom.2/ancom_result
  ancom_result_3:
      type: File
      outputSource: composition.visualizers.ancom.3/ancom_result
  ancom_result_4:
      type: File
      outputSource: composition.visualizers.ancom.4/ancom_result
  ancom_result_5:
      type: File
      outputSource: composition.visualizers.ancom.5/ancom_result
  ancom_result_6:
      type: File
      outputSource: composition.visualizers.ancom.6/ancom_result
  ancom_result_7:
      type: File
      outputSource: composition.visualizers.ancom.7/ancom_result
  ancom_data_1:
      type: Directory
      outputSource: composition.visualizers.ancom.1/ancom_data
  ancom_data_2:
      type: Directory
      outputSource: composition.visualizers.ancom.2/ancom_data
  ancom_data_3:
      type: Directory
      outputSource: composition.visualizers.ancom.3/ancom_data
  ancom_data_4:
      type: Directory
      outputSource: composition.visualizers.ancom.4/ancom_data
  ancom_data_5:
      type: Directory
      outputSource: composition.visualizers.ancom.5/ancom_data
  ancom_data_6:
      type: Directory
      outputSource: composition.visualizers.ancom.6/ancom_data
  ancom_data_7:
      type: Directory
      outputSource: composition.visualizers.ancom.7/ancom_data

steps:
  composition.visualizers.ancom.1:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 1
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data
      - barplot

  composition.visualizers.ancom.2:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 2
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data

  composition.visualizers.ancom.3:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 3
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data

  composition.visualizers.ancom.4:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 4
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data

  composition.visualizers.ancom.5:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 5
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data

  composition.visualizers.ancom.6:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 6
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data

  composition.visualizers.ancom.7:
    run: meta16s-filtersamples2ancom.cwl
    in:
      TABLE: TABLE
      METADATA: METADATA
      FILTER_CONDITION: FILTER_CONDITION
      TAXONOMY: TAXONOMY
      TAXONOMY_LEVEL:
        default: 7
      METADATA_COLUMN: METADATA_COLUMN
    out:
      - ancom_result
      - ancom_data
