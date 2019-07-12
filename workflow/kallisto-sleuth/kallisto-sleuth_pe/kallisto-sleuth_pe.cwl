class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: SraRunTable
    type: File
    'sbg:x': -929.7924194335938
    'sbg:y': 635.075439453125
  - id: nthreads
    type: int
    'sbg:x': -216.7962188720703
    'sbg:y': -493.84906005859375
  - id: run_ids
    type: string
    'sbg:x': -453.173583984375
    'sbg:y': -574.525390625
  - id: out_dir_name
    type: string?
    'sbg:x': -238.71322631835938
    'sbg:y': -338.7886657714844
  - id: run_ids_1
    type: string
    'sbg:x': -440.4867858886719
    'sbg:y': -215.7811279296875
  - id: out_dir_name_1
    type: string?
    'sbg:x': -326.8421630859375
    'sbg:y': -96.69364929199219
  - id: run_ids_2
    type: string
    'sbg:x': -412.1515808105469
    'sbg:y': 239.0988006591797
  - id: out_dir_name_2
    type: string?
    'sbg:x': -312.3214111328125
    'sbg:y': 344.374267578125
  - id: run_ids_3
    type: string
    'sbg:x': -354.0685729980469
    'sbg:y': 544.03466796875
  - id: out_dir_name_3
    type: string?
    'sbg:x': -207.04592895507812
    'sbg:y': 618.4535522460938
  - id: run_ids_4
    type: string
    'sbg:x': -404.8912048339844
    'sbg:y': 865.3063354492188
  - id: out_dir_name_4
    type: string?
    'sbg:x': -286.1849060058594
    'sbg:y': 921.3320922851562
  - id: run_ids_5
    type: string
    'sbg:x': -107.21573638916016
    'sbg:y': 1003.2450561523438
  - id: out_dir_name_5
    type: string?
    'sbg:x': -118.1063003540039
    'sbg:y': 1141.192138671875
  - id: run_ids_6
    type: string
    'sbg:x': 72
    'sbg:y': 1108.188720703125
  - id: out_dir_name_6
    type: string?
    'sbg:x': 95.80000305175781
    'sbg:y': 1271.562255859375
outputs:
  - id: output
    outputSource:
      - sleuth/output
    type: 'Directory[]'
    'sbg:x': 1227.24462890625
    'sbg:y': 136.96673583984375
steps:
  - id: kallisto_wf_pe
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        default: 4
        source: nthreads
      - id: out_dir_name
        source: out_dir_name
      - id: run_ids
        source: run_ids
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 283.36981201171875
    'sbg:y': -419.36981201171875
  - id: kallisto_wf_pe_1
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: out_dir_name_1
      - id: run_ids
        source: run_ids_1
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 291.89056396484375
    'sbg:y': -247.2603759765625
  - id: kallisto_wf_pe_2
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: out_dir_name_2
      - id: run_ids
        source: run_ids_2
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 276.2181396484375
    'sbg:y': -90.38896179199219
  - id: kallisto_index
    in:
      - id: fasta_files
        source:
          - wget/downloaded
    out:
      - id: index_file
    run: ../../../tool/kallisto/kallisto_index/kallisto_index.cwl
    label: >-
      kallisto index: builds an index from a FASTA formatted file of target
      sequences
    'sbg:x': -414.6282043457031
    'sbg:y': 60
  - id: kallisto_wf_pe_3
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: out_dir_name_3
      - id: run_ids
        source: run_ids_3
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 277.9009704589844
    'sbg:y': 88
  - id: kallisto_wf_pe_4
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: out_dir_name_4
      - id: run_ids
        source: run_ids_4
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 291.2864685058594
    'sbg:y': 251.52561950683594
  - id: kallisto_wf_pe_5
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: out_dir_name_5
      - id: run_ids
        source: run_ids_5
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 281.6583557128906
    'sbg:y': 432.01708984375
  - id: kallisto_wf_pe_6
    in:
      - id: index_file
        source: kallisto_index/index_file
      - id: nthreads
        source: nthreads
      - id: out_dir_name
        source: out_dir_name_6
      - id: run_ids
        source: run_ids_6
    out:
      - id: quant_output
    run: ../../kallisto/kallisto-sleuth_pe/kallisto_wf_pe.cwl
    'sbg:x': 288.1498107910156
    'sbg:y': 593.9658203125
  - id: wget
    in:
      - id: url
        default: >-
          ftp://ftp.ensembl.org/pub/release-95/fasta/homo_sapiens//cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz
    out:
      - id: downloaded
      - id: stderr
    run: ../../../tool/wget/wget.cwl
    'sbg:x': -821
    'sbg:y': 154.35723876953125
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': 578.4641723632812
    'sbg:y': -510
  - id: sleuth
    in:
      - id: sample.txt
        source: sample_for_sleuth/output1
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
    'sbg:x': 875.9205932617188
    'sbg:y': 142
  - id: sample_for_sleuth
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../tool/sample_for_sleuth/sample_for_sleuth.cwl
    label: sample_for_sleuth
    'sbg:x': 336.3584899902344
    'sbg:y': 798.9244995117188
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - 'https://schema.org/docs/schema_org_rdfa.html'
  - 'http://edamontology.org/EDAM_1.18.owl'
's:author':
  - class: 's:Person'
    's:email': 'mailto:inutano@gmail.com'
    's:identifier': 'https://orcid.org/0000-0003-3777-5945'
    's:name': Tazro Ohta
's:codeRepository': 'https://github.com/pitagora-network/pitagora-cwl'
's:license': 'https://spdx.org/licenses/Apache-2.0'
