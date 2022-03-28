class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: "http://edamontology.org/"
  s: "https://schema.org/"
inputs:
  - id: url
    type: string
  - id: output_name
    type: string
  - id: index_name
    type: string?
  - id: runid
    type: string
  - id: nthreads
    type: int?
  - id: bootstrap_samples
    type: int?
  - id: runid_1
    type: string
  - id: runid_2
    type: string
  - id: runid_3
    type: string
  - id: runid_4
    type: string
  - id: runid_5
    type: string
  - id: runid_6
    type: string
  - id: nthreads_1
    type: int?
  - id: SraRunTable
    type: File
outputs:
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
  - id: index_file
    outputSource:
      - kallisto_index/index_file
    type: File
  - id: fastqFiles
    outputSource:
      - kallisto_wf_pe/fastqFiles
    type: "File[]"
  - id: fastqFiles_1
    outputSource:
      - kallisto_wf_pe_2/fastqFiles
    type: "File[]"
  - id: fastqFiles_2
    outputSource:
      - kallisto_wf_pe_3/fastqFiles
    type: "File[]"
  - id: fastqFiles_3
    outputSource:
      - kallisto_wf_pe_4/fastqFiles
    type: "File[]"
  - id: fastqFiles_4
    outputSource:
      - kallisto_wf_pe_5/fastqFiles
    type: "File[]"
  - id: fastqFiles_5
    outputSource:
      - kallisto_wf_pe_6/fastqFiles
    type: "File[]"
  - id: fastqFiles_6
    outputSource:
      - kallisto_wf_pe_1/fastqFiles
    type: "File[]"
  - id: output
    outputSource:
      - sleuth/output
    type: Directory
steps:
  - id: wget
    in:
      - id: output_name
        source: output_name
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
  - id: kallisto_index
    in:
      - id: fasta_files
        source: wget/downloaded
      - id: index_name
        source: index_name
    out:
      - id: index_file
    run: ../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
  - id: kallisto_wf_pe
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid
      - id: runid
        source: runid
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: kallisto_wf_pe_1
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid_1
      - id: runid
        source: runid_1
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: kallisto_wf_pe_2
    in:
      - id: bootstrap_samples
        source: nthreads
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid_2
      - id: runid
        source: runid_2
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: kallisto_wf_pe_3
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid_3
      - id: runid
        source: runid_3
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: kallisto_wf_pe_4
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid_4
      - id: runid
        source: runid_4
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: kallisto_wf_pe_5
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid_5
      - id: runid
        source: runid_5
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: kallisto_wf_pe_6
    in:
      - id: bootstrap_samples
        source: bootstrap_samples
      - id: index_file
        source: kallisto_index/index_file
      - id: out_dir_name
        source: runid_6
      - id: runid
        source: runid_6
      - id: nthreads
        source: nthreads
      - id: nthreads_1
        source: nthreads_1
    out:
      - id: quant_output
      - id: fastqFiles
    run: ../rnaseq-kallisto-pe/rnaseq-kallisto-pe.cwl
  - id: sleuth
    in:
      - id: sample.txt
        source: sample_for_sleuth/sample.txt
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: kallisto_out
        source:
          - kallisto_wf_pe/quant_output
          - kallisto_wf_pe_1/quant_output
          - kallisto_wf_pe_2/quant_output
          - kallisto_wf_pe_3/quant_output
          - kallisto_wf_pe_4/quant_output
          - kallisto_wf_pe_5/quant_output
          - kallisto_wf_pe_6/quant_output
    out:
      - id: output
    run: ../../../tool/sleuth/sleuth.cwl
    label: sleuth
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
  - id: sample_for_sleuth
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: sample.txt
    run: ../../../tool/sample_txt/sample_txt.cwl
    label: sample_txt
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - "https://schema.org/version/latest/schemaorg-current-http.rdf"
  - "http://edamontology.org/EDAM_1.18.owl"
"s:author":
  - class: "s:Person"
    "s:email": "mailto:inutano@gmail.com"
    "s:identifier": "https://orcid.org/0000-0003-3777-5945"
    "s:name": Tazro Ohta
"s:codeRepository": "https://github.com/pitagora-network/pitagora-cwl"
"s:license": "https://spdx.org/licenses/Apache-2.0"
