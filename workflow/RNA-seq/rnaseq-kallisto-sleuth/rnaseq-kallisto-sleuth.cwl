class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: url
    type: string
    'sbg:x': -1134.208984375
    'sbg:y': -94.1567153930664
  - id: output_name
    type: string
    'sbg:x': -1158.141845703125
    'sbg:y': 156.30596923828125
  - id: index_name
    type: string?
    'sbg:x': -791.115234375
    'sbg:y': -221.36343383789062
  - id: runid
    type: string
    'sbg:x': -115.58671569824219
    'sbg:y': -239.21145629882812
  - id: nthreads
    type: int?
    'sbg:x': -522.3429565429688
    'sbg:y': 427.2962951660156
  - id: bootstrap_samples
    type: int?
    'sbg:x': -506.6899719238281
    'sbg:y': 579.25927734375
  - id: runid_1
    type: string
    'sbg:x': -62.22795867919922
    'sbg:y': 162.2218780517578
  - id: runid_2
    type: string
    'sbg:x': -46.88682556152344
    'sbg:y': 299.4562683105469
  - id: runid_3
    type: string
    'sbg:x': -51.81343460083008
    'sbg:y': 418.64178466796875
  - id: runid_4
    type: string
    'sbg:x': -35.25373077392578
    'sbg:y': 610.8955078125
  - id: runid_5
    type: string
    'sbg:x': -7.45522403717041
    'sbg:y': 826.2835693359375
  - id: runid_6
    type: string
    'sbg:x': 2.1716418266296387
    'sbg:y': 1070.537353515625
  - id: nthreads_1
    type: int?
    'sbg:x': -724.1057739257812
    'sbg:y': 865.9691772460938
  - id: SraRunTable
    type: File
    'sbg:x': 856
    'sbg:y': 902.8764038085938
outputs:
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
    'sbg:x': -869.8507690429688
    'sbg:y': 198.11940002441406
  - id: index_file
    outputSource:
      - kallisto_index/index_file
    type: File
    'sbg:x': -519.322509765625
    'sbg:y': 243.95721435546875
  - id: fastqFiles
    outputSource:
      - kallisto_wf_pe/fastqFiles
    type: 'File[]'
    'sbg:x': 310.76190185546875
    'sbg:y': -338.2856750488281
  - id: fastqFiles_1
    outputSource:
      - kallisto_wf_pe_2/fastqFiles
    type: 'File[]'
    'sbg:x': 442.6247863769531
    'sbg:y': 312.2724609375
  - id: fastqFiles_2
    outputSource:
      - kallisto_wf_pe_3/fastqFiles
    type: 'File[]'
    'sbg:x': 432.6637878417969
    'sbg:y': 564.1432495117188
  - id: fastqFiles_3
    outputSource:
      - kallisto_wf_pe_4/fastqFiles
    type: 'File[]'
    'sbg:x': 344.4378662109375
    'sbg:y': 797.5150756835938
  - id: fastqFiles_4
    outputSource:
      - kallisto_wf_pe_5/fastqFiles
    type: 'File[]'
    'sbg:x': 362.9368591308594
    'sbg:y': 1055.077880859375
  - id: fastqFiles_5
    outputSource:
      - kallisto_wf_pe_6/fastqFiles
    type: 'File[]'
    'sbg:x': 409.15399169921875
    'sbg:y': 1313.55224609375
  - id: fastqFiles_6
    outputSource:
      - kallisto_wf_pe_1/fastqFiles
    type: 'File[]'
    'sbg:x': 546.5037231445312
    'sbg:y': 90.27542114257812
  - id: output
    outputSource:
      - sleuth/output
    type: Directory
    'sbg:x': 1384.811767578125
    'sbg:y': 291.9703063964844
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
    'sbg:x': -1010.567138671875
    'sbg:y': 12.425372123718262
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
    'sbg:x': -594.0369873046875
    'sbg:y': -31.201128005981445
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
    'sbg:x': 121.716796875
    'sbg:y': -135.70619201660156
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
    'sbg:x': 150.9099884033203
    'sbg:y': 73.20912170410156
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
    'sbg:x': 162.2940216064453
    'sbg:y': 259.6216125488281
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
    'sbg:x': 150.9100341796875
    'sbg:y': 467.37945556640625
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
    'sbg:x': 155.80699157714844
    'sbg:y': 680.8070068359375
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
    'sbg:x': 167.98602294921875
    'sbg:y': 917.0471801757812
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
    'sbg:x': 186.07598876953125
    'sbg:y': 1198.0718994140625
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
    'sbg:x': 1157.728515625
    'sbg:y': 294.2630920410156
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': 931.1271362304688
    'sbg:y': -57.742576599121094
  - id: sample_for_sleuth
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: sample.txt
    run: ../../../tool/sample_txt/sample_txt.cwl
    label: sample_txt
    'sbg:x': 990.7979736328125
    'sbg:y': 647.2404174804688
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - 'https://schema.org/version/latest/schemaorg-current-http.rdf'
  - 'http://edamontology.org/EDAM_1.18.owl'
's:author':
  - class: 's:Person'
    's:email': 'mailto:inutano@gmail.com'
    's:identifier': 'https://orcid.org/0000-0003-3777-5945'
    's:name': Tazro Ohta
's:codeRepository': 'https://github.com/pitagora-network/pitagora-cwl'
's:license': 'https://spdx.org/licenses/Apache-2.0'
