class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference_prefix
    type: string
    'sbg:x': -1455.0606689453125
    'sbg:y': 34.887454986572266
  - id: num_threads
    type: int?
    'sbg:x': -1462.75927734375
    'sbg:y': 400.5768737792969
  - id: SraRunTable
    type: File
    'sbg:x': 991.5216674804688
    'sbg:y': 108.470458984375
  - id: url
    type: string
    'sbg:x': -2450.151123046875
    'sbg:y': -443.1516418457031
  - id: output_name
    type: string
    'sbg:x': -2460.194091796875
    'sbg:y': -276.43902587890625
  - id: url_1
    type: string
    'sbg:x': -2450.151123046875
    'sbg:y': -93.65771484375
  - id: output_name_1
    type: string
    'sbg:x': -2407.970947265625
    'sbg:y': 105.19227600097656
  - id: runThreadN
    type: string?
    'sbg:x': -1614.5794677734375
    'sbg:y': -611.8728637695312
  - id: split_files
    type: boolean?
    'sbg:x': -1183.3447265625
    'sbg:y': -1171.304931640625
  - id: runid
    type: string
    'sbg:x': -711.1549072265625
    'sbg:y': -1428.6533203125
  - id: rsem_index_prefix
    type: string?
    'sbg:x': -1165.6346435546875
    'sbg:y': -726.730712890625
  - id: nthreads
    type: int?
    'sbg:x': -1026.7105712890625
    'sbg:y': -1003.3120727539062
  - id: runid_1
    type: string
    'sbg:x': -583.7657470703125
    'sbg:y': -765.8656005859375
  - id: runid_2
    type: string
    'sbg:x': -549.9524536132812
    'sbg:y': -387.19525146484375
  - id: runid_3
    type: string
    'sbg:x': -436.7086486816406
    'sbg:y': 128.80181884765625
  - id: runid_4
    type: string
    'sbg:x': -576.3072509765625
    'sbg:y': 770.07470703125
  - id: runid_5
    type: string
    'sbg:x': -570.891357421875
    'sbg:y': 1179
  - id: runid_6
    type: string
    'sbg:x': -525.4889526367188
    'sbg:y': 1656.731689453125
  - id: quantMode
    type: string
    'sbg:x': -1025.826904296875
    'sbg:y': 1118.1317138671875
  - id: outSAMtype
    type: 'string[]'
    'sbg:x': -1084.2711181640625
    'sbg:y': 527.9520263671875
  - id: nthreads_1
    type: int?
    'sbg:x': -1007.818115234375
    'sbg:y': -566.8890991210938
  - id: nthreads_2
    type: int?
    'sbg:x': -1064.4217529296875
    'sbg:y': -98.62271881103516
  - id: nthreads_3
    type: int?
    'sbg:x': -951.2144775390625
    'sbg:y': 357.6368713378906
  - id: nthreads_4
    type: int?
    'sbg:x': -944.3534545898438
    'sbg:y': 918.5274047851562
  - id: nthreads_5
    type: int?
    'sbg:x': -740.2373046875
    'sbg:y': 1445.1126708984375
  - id: nthreads_6
    type: int?
    'sbg:x': -568.711181640625
    'sbg:y': 1927.1011962890625
outputs:
  - id: starIndex
    outputSource:
      - star_index/starIndex
    type: Directory
    'sbg:x': -1360.5517578125
    'sbg:y': -623.029541015625
  - id: rsem_index_1
    outputSource:
      - rsem_index/rsem_index
    type: Directory
    'sbg:x': -1251.2496337890625
    'sbg:y': 423.8552551269531
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
    'sbg:x': -2124.76025390625
    'sbg:y': -308.5763854980469
  - id: downloaded_1
    outputSource:
      - wget_1/downloaded
    type: File
    'sbg:x': -2140.828857421875
    'sbg:y': 107.20085906982422
  - id: transcriptomesam
    outputSource:
      - star_rsem_wf_pe/transcriptomesam
    type: File?
    'sbg:x': -77.76531982421875
    'sbg:y': -1494.5240478515625
  - id: transcript_sorted_bam_bai
    outputSource:
      - star_rsem_wf_pe/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 50.2076530456543
    'sbg:y': -1436.9361572265625
  - id: transcriptomesam_1
    outputSource:
      - star_rsem_wf_pe_1/transcriptomesam
    type: File?
    'sbg:x': 5.3536529541015625
    'sbg:y': -997.7470092773438
  - id: genes_result
    outputSource:
      - star_rsem_wf_pe/genes_result
    type: File
    'sbg:x': 110.58501434326172
    'sbg:y': -1162.5283203125
  - id: transcript_sorted_bam
    outputSource:
      - star_rsem_wf_pe/transcript_sorted_bam
    type: File?
    'sbg:x': 177.6976776123047
    'sbg:y': -1407.6341552734375
  - id: transcript_bam
    outputSource:
      - star_rsem_wf_pe/transcript_bam
    type: File
    'sbg:x': 188.62867736816406
    'sbg:y': -1519.8153076171875
  - id: stat
    outputSource:
      - star_rsem_wf_pe/stat
    type: Directory
    'sbg:x': 360.4168395996094
    'sbg:y': -1418.6689453125
  - id: SJ.out.tab
    outputSource:
      - star_rsem_wf_pe/SJ.out.tab
    type: File?
    'sbg:x': 464.7741394042969
    'sbg:y': -1389.77001953125
  - id: readspergene
    outputSource:
      - star_rsem_wf_pe/readspergene
    type: File?
    'sbg:x': 477.6181335449219
    'sbg:y': -1278.99072265625
  - id: mappingstats
    outputSource:
      - star_rsem_wf_pe/mappingstats
    type: File?
    'sbg:x': 196.65615844726562
    'sbg:y': -1287.0181884765625
  - id: Log.progress.out
    outputSource:
      - star_rsem_wf_pe/Log.progress.out
    type: File?
    'sbg:x': 276.9309997558594
    'sbg:y': -1200.3214111328125
  - id: Log.out
    outputSource:
      - star_rsem_wf_pe/Log.out
    type: File?
    'sbg:x': 368.4443359375
    'sbg:y': -1160.1839599609375
  - id: isoforms_result
    outputSource:
      - star_rsem_wf_pe/isoforms_result
    type: File
    'sbg:x': 588.4632568359375
    'sbg:y': -1565.8485107421875
  - id: fastqFiles
    outputSource:
      - star_rsem_wf_pe/fastqFiles
    type: 'File[]'
    'sbg:x': 19.27484703063965
    'sbg:y': -1106.9725341796875
  - id: bamRemDups
    outputSource:
      - star_rsem_wf_pe/bamRemDups
    type: File?
    'sbg:x': 259.2705383300781
    'sbg:y': -1047.7991943359375
  - id: aligned
    outputSource:
      - star_rsem_wf_pe/aligned
    type: File
    'sbg:x': 540.2324829101562
    'sbg:y': -1140.91796875
  - id: transcript_sorted_bam_bai_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 64.01971435546875
    'sbg:y': -905.8419799804688
  - id: transcript_sorted_bam_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_sorted_bam
    type: File?
    'sbg:x': 222.69415283203125
    'sbg:y': -918.2062377929688
  - id: transcript_bam_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_bam
    type: File
    'sbg:x': 426.7041320800781
    'sbg:y': -926.4490356445312
  - id: stat_1
    outputSource:
      - star_rsem_wf_pe_1/stat
    type: Directory
    'sbg:x': 562.7108154296875
    'sbg:y': -914.0847778320312
  - id: SJ.out.tab_1
    outputSource:
      - star_rsem_wf_pe_1/SJ.out.tab
    type: File?
    'sbg:x': 301.0010070800781
    'sbg:y': -813.1101684570312
  - id: readspergene_1
    outputSource:
      - star_rsem_wf_pe_1/readspergene
    type: File?
    'sbg:x': 437.0076599121094
    'sbg:y': -780.1388549804688
  - id: mappingstats_1
    outputSource:
      - star_rsem_wf_pe_1/mappingstats
    type: File?
    'sbg:x': 610.1070556640625
    'sbg:y': -776.0174560546875
  - id: Log.progress.out_1
    outputSource:
      - star_rsem_wf_pe_1/Log.progress.out
    type: File?
    'sbg:x': 352.5186767578125
    'sbg:y': -656.4963989257812
  - id: Log.out_1
    outputSource:
      - star_rsem_wf_pe_1/Log.out
    type: File?
    'sbg:x': 505.0110168457031
    'sbg:y': -640.0107421875
  - id: isoforms_result_1
    outputSource:
      - star_rsem_wf_pe_1/isoforms_result
    type: File
    'sbg:x': 142.3265838623047
    'sbg:y': -644.1322021484375
  - id: genes_result_1
    outputSource:
      - star_rsem_wf_pe_1/genes_result
    type: File
    'sbg:x': 752.2958374023438
    'sbg:y': -695.6498413085938
  - id: fastqFiles_1
    outputSource:
      - star_rsem_wf_pe_1/fastqFiles
    type: 'File[]'
    'sbg:x': 247.42263793945312
    'sbg:y': -530.7932739257812
  - id: bamRemDups_1
    outputSource:
      - star_rsem_wf_pe_1/bamRemDups
    type: File?
    'sbg:x': 686.3532104492188
    'sbg:y': -860.5064086914062
  - id: aligned_1
    outputSource:
      - star_rsem_wf_pe_1/aligned
    type: File
    'sbg:x': 795.5706787109375
    'sbg:y': -825.4744262695312
  - id: transcriptomesam_2
    outputSource:
      - star_rsem_wf_pe_2/transcriptomesam
    type: File?
    'sbg:x': 47
    'sbg:y': -455.6241760253906
  - id: transcript_sorted_bam_bai_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 350.70953369140625
    'sbg:y': -414.2627258300781
  - id: transcript_sorted_bam_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_sorted_bam
    type: File?
    'sbg:x': 177.65240478515625
    'sbg:y': -351.5057678222656
  - id: transcript_bam_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_bam
    type: File
    'sbg:x': 497.1424865722656
    'sbg:y': -412.36102294921875
  - id: stat_2
    outputSource:
      - star_rsem_wf_pe_2/stat
    type: Directory
    'sbg:x': 552.2925415039062
    'sbg:y': -296.3556823730469
  - id: SJ.out.tab_2
    outputSource:
      - star_rsem_wf_pe_2/SJ.out.tab
    type: File?
    'sbg:x': 291.7560119628906
    'sbg:y': -262.1246032714844
  - id: readspergene_2
    outputSource:
      - star_rsem_wf_pe_2/readspergene
    type: File?
    'sbg:x': 630.2633056640625
    'sbg:y': -372.42474365234375
  - id: mappingstats_2
    outputSource:
      - star_rsem_wf_pe_2/mappingstats
    type: File?
    'sbg:x': 449.59930419921875
    'sbg:y': -168.94000244140625
  - id: Log.progress.out_2
    outputSource:
      - star_rsem_wf_pe_2/Log.progress.out
    type: File?
    'sbg:x': 723.4479370117188
    'sbg:y': -239.30389404296875
  - id: Log.out_2
    outputSource:
      - star_rsem_wf_pe_2/Log.out
    type: File?
    'sbg:x': 780.499755859375
    'sbg:y': -380.0316467285156
  - id: isoforms_result_2
    outputSource:
      - star_rsem_wf_pe_2/isoforms_result
    type: File
    'sbg:x': 168.14376831054688
    'sbg:y': -127.1020278930664
  - id: genes_result_2
    outputSource:
      - star_rsem_wf_pe_2/genes_result
    type: File
    'sbg:x': 835.6497802734375
    'sbg:y': -252.61598205566406
  - id: fastqFiles_2
    outputSource:
      - star_rsem_wf_pe_2/fastqFiles
    type: 'File[]'
    'sbg:x': 289.8542785644531
    'sbg:y': -119.4951171875
  - id: bamRemDups_2
    outputSource:
      - star_rsem_wf_pe_2/bamRemDups
    type: File?
    'sbg:x': 603.63916015625
    'sbg:y': -102.37957763671875
  - id: aligned_2
    outputSource:
      - star_rsem_wf_pe_2/aligned
    type: File
    'sbg:x': -10.618523597717285
    'sbg:y': -70.05022430419922
  - id: transcriptomesam_3
    outputSource:
      - star_rsem_wf_pe_3/transcriptomesam
    type: File?
    'sbg:x': -9.11553955078125
    'sbg:y': 80.08100891113281
  - id: transcript_sorted_bam_bai_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 221.39212036132812
    'sbg:y': 53.5620002746582
  - id: transcript_sorted_bam_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_sorted_bam
    type: File?
    'sbg:x': 377.3337097167969
    'sbg:y': 55.46372604370117
  - id: transcript_bam_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_bam
    type: File
    'sbg:x': 538.98046875
    'sbg:y': 55.46372604370117
  - id: stat_3
    outputSource:
      - star_rsem_wf_pe_3/stat
    type: Directory
    'sbg:x': 679.708251953125
    'sbg:y': 57.36545181274414
  - id: SJ.out.tab_3
    outputSource:
      - star_rsem_wf_pe_3/SJ.out.tab
    type: File?
    'sbg:x': 183.3575897216797
    'sbg:y': 207.6018524169922
  - id: readspergene_3
    outputSource:
      - star_rsem_wf_pe_3/readspergene
    type: File?
    'sbg:x': 312.67498779296875
    'sbg:y': 199.9949493408203
  - id: mappingstats_3
    outputSource:
      - star_rsem_wf_pe_3/mappingstats
    type: File?
    'sbg:x': 432.4837646484375
    'sbg:y': 182.87940979003906
  - id: Log.progress.out_3
    outputSource:
      - star_rsem_wf_pe_3/Log.progress.out
    type: File?
    'sbg:x': 559.8994750976562
    'sbg:y': 198.0932159423828
  - id: Log.out_3
    outputSource:
      - star_rsem_wf_pe_3/Log.out
    type: File?
    'sbg:x': 158.63514709472656
    'sbg:y': 335.0175476074219
  - id: isoforms_result_3
    outputSource:
      - star_rsem_wf_pe_3/isoforms_result
    type: File
    'sbg:x': 314.57672119140625
    'sbg:y': 335.0175476074219
  - id: genes_result_3
    outputSource:
      - star_rsem_wf_pe_3/genes_result
    type: File
    'sbg:x': 459.1079406738281
    'sbg:y': 340.72271728515625
  - id: fastqFiles_3
    outputSource:
      - star_rsem_wf_pe_3/fastqFiles
    type: 'File[]'
    'sbg:x': 73.05744171142578
    'sbg:y': 464.3349304199219
  - id: bamRemDups_3
    outputSource:
      - star_rsem_wf_pe_3/bamRemDups
    type: File?
    'sbg:x': 287.9525451660156
    'sbg:y': 479.54876708984375
  - id: aligned_3
    outputSource:
      - star_rsem_wf_pe_3/aligned
    type: File
    'sbg:x': 466.71484375
    'sbg:y': 466.2366638183594
  - id: transcriptomesam_4
    outputSource:
      - star_rsem_wf_pe_4/transcriptomesam
    type: File?
    'sbg:x': -34.48770523071289
    'sbg:y': 576.5924682617188
  - id: transcript_sorted_bam_bai_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 173.8489532470703
    'sbg:y': 622.17822265625
  - id: transcript_sorted_bam_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_sorted_bam
    type: File?
    'sbg:x': 289.4549255371094
    'sbg:y': 602.760986328125
  - id: transcript_bam_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_bam
    type: File
    'sbg:x': 415.2477111816406
    'sbg:y': 614.0260620117188
  - id: stat_4
    outputSource:
      - star_rsem_wf_pe_4/stat
    type: Directory
    'sbg:x': 586.1006469726562
    'sbg:y': 625.2910766601562
  - id: SJ.out.tab_4
    outputSource:
      - star_rsem_wf_pe_4/SJ.out.tab
    type: File?
    'sbg:x': 657.44580078125
    'sbg:y': 525.7833251953125
  - id: readspergene_4
    outputSource:
      - star_rsem_wf_pe_4/readspergene
    type: File?
    'sbg:x': 694.9959106445312
    'sbg:y': 670.3511962890625
  - id: mappingstats_4
    outputSource:
      - star_rsem_wf_pe_4/mappingstats
    type: File?
    'sbg:x': 347.6575622558594
    'sbg:y': 758.5938720703125
  - id: Log.progress.out_4
    outputSource:
      - star_rsem_wf_pe_4/Log.progress.out
    type: File?
    'sbg:x': 507.2454528808594
    'sbg:y': 781.1239624023438
  - id: Log.out_4
    outputSource:
      - star_rsem_wf_pe_4/Log.out
    type: File?
    'sbg:x': 670.5883178710938
    'sbg:y': 807.4089965820312
  - id: isoforms_result_4
    outputSource:
      - star_rsem_wf_pe_4/isoforms_result
    type: File
    'sbg:x': 193.70217895507812
    'sbg:y': 867.4891357421875
  - id: genes_result_4
    outputSource:
      - star_rsem_wf_pe_4/genes_result
    type: File
    'sbg:x': 368.31011962890625
    'sbg:y': 903.1617431640625
  - id: fastqFiles_4
    outputSource:
      - star_rsem_wf_pe_4/fastqFiles
    type: 'File[]'
    'sbg:x': 32.236785888671875
    'sbg:y': 940.7118530273438
  - id: bamRemDups_4
    outputSource:
      - star_rsem_wf_pe_4/bamRemDups
    type: File?
    'sbg:x': 225.6197509765625
    'sbg:y': 1015.81201171875
  - id: aligned_4
    outputSource:
      - star_rsem_wf_pe_4/aligned
    type: File
    'sbg:x': 578.5906372070312
    'sbg:y': 916.3042602539062
  - id: transcriptomesam_5
    outputSource:
      - star_rsem_wf_pe_5/transcriptomesam
    type: File?
    'sbg:x': -7
    'sbg:y': 1163.469970703125
  - id: transcript_sorted_bam_bai_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 167.4171142578125
    'sbg:y': 1173.5224609375
  - id: transcript_sorted_bam_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_sorted_bam
    type: File?
    'sbg:x': 368.31011962890625
    'sbg:y': 1166.012451171875
  - id: transcript_bam_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_bam
    type: File
    'sbg:x': 511.0004577636719
    'sbg:y': 1156.6248779296875
  - id: stat_5
    outputSource:
      - star_rsem_wf_pe_5/stat
    type: Directory
    'sbg:x': 681.8533935546875
    'sbg:y': 1143.4822998046875
  - id: SJ.out.tab_5
    outputSource:
      - star_rsem_wf_pe_5/SJ.out.tab
    type: File?
    'sbg:x': 306.3524475097656
    'sbg:y': 1316.2127685546875
  - id: readspergene_5
    outputSource:
      - star_rsem_wf_pe_5/readspergene
    type: File?
    'sbg:x': 477.20538330078125
    'sbg:y': 1295.5601806640625
  - id: mappingstats_5
    outputSource:
      - star_rsem_wf_pe_5/mappingstats
    type: File?
    'sbg:x': 668.7108154296875
    'sbg:y': 1308.7027587890625
  - id: Log.progress.out_5
    outputSource:
      - star_rsem_wf_pe_5/Log.progress.out
    type: File?
    'sbg:x': 212.4772186279297
    'sbg:y': 1425.1080322265625
  - id: Log.out_5
    outputSource:
      - star_rsem_wf_pe_5/Log.out
    type: File?
    'sbg:x': 370.1876220703125
    'sbg:y': 1438.2506103515625
  - id: isoforms_result_5
    outputSource:
      - star_rsem_wf_pe_5/isoforms_result
    type: File
    'sbg:x': 586.1006469726562
    'sbg:y': 1442.005615234375
  - id: genes_result_5
    outputSource:
      - star_rsem_wf_pe_5/genes_result
    type: File
    'sbg:x': 749.4435424804688
    'sbg:y': 1445.7606201171875
  - id: fastqFiles_5
    outputSource:
      - star_rsem_wf_pe_5/fastqFiles
    type: 'File[]'
    'sbg:x': 161.78460693359375
    'sbg:y': 1560.288330078125
  - id: bamRemDups_5
    outputSource:
      - star_rsem_wf_pe_5/bamRemDups
    type: File?
    'sbg:x': 310.1074523925781
    'sbg:y': 1569.6759033203125
  - id: aligned_5
    outputSource:
      - star_rsem_wf_pe_5/aligned
    type: File
    'sbg:x': 527.8980102539062
    'sbg:y': 1560.288330078125
  - id: transcriptomesam_6
    outputSource:
      - star_rsem_wf_pe_6/transcriptomesam
    type: File?
    'sbg:x': 29.59244155883789
    'sbg:y': 1689.164794921875
  - id: transcript_sorted_bam_bai_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 191.82467651367188
    'sbg:y': 1717.998779296875
  - id: transcript_sorted_bam_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_sorted_bam
    type: File?
    'sbg:x': 345.7800598144531
    'sbg:y': 1712.3662109375
  - id: transcript_bam_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_bam
    type: File
    'sbg:x': 512.8779296875
    'sbg:y': 1689.836181640625
  - id: stat_6
    outputSource:
      - star_rsem_wf_pe_6/stat
    type: Directory
    'sbg:x': 663.0783081054688
    'sbg:y': 1699.2237548828125
  - id: SJ.out.tab_6
    outputSource:
      - star_rsem_wf_pe_6/SJ.out.tab
    type: File?
    'sbg:x': 803.8911743164062
    'sbg:y': 1727.38623046875
  - id: readspergene_6
    outputSource:
      - star_rsem_wf_pe_6/readspergene
    type: File?
    'sbg:x': 212.4772186279297
    'sbg:y': 1834.404052734375
  - id: mappingstats_6
    outputSource:
      - star_rsem_wf_pe_6/mappingstats
    type: File?
    'sbg:x': 340.14752197265625
    'sbg:y': 1877.586669921875
  - id: Log.progress.out_6
    outputSource:
      - star_rsem_wf_pe_6/Log.progress.out
    type: File?
    'sbg:x': 480.96038818359375
    'sbg:y': 1873.8316650390625
  - id: Log.out_6
    outputSource:
      - star_rsem_wf_pe_6/Log.out
    type: File?
    'sbg:x': 623.6507568359375
    'sbg:y': 1933.9117431640625
  - id: isoforms_result_6
    outputSource:
      - star_rsem_wf_pe_6/isoforms_result
    type: File
    'sbg:x': 280.0673828125
    'sbg:y': 2014.6444091796875
  - id: genes_result_6
    outputSource:
      - star_rsem_wf_pe_6/genes_result
    type: File
    'sbg:x': 446.63250732421875
    'sbg:y': 2053.73486328125
  - id: fastqFiles_6
    outputSource:
      - star_rsem_wf_pe_6/fastqFiles
    type: 'File[]'
    'sbg:x': 212.4772186279297
    'sbg:y': 2153.579833984375
  - id: bamRemDups_6
    outputSource:
      - star_rsem_wf_pe_6/bamRemDups
    type: File?
    'sbg:x': 445.28778076171875
    'sbg:y': 2238.067626953125
  - id: aligned_6
    outputSource:
      - star_rsem_wf_pe_6/aligned
    type: File
    'sbg:x': 659.3233032226562
    'sbg:y': 2129.17236328125
  - id: output_gene
    outputSource:
      - deseq2/output_gene
    type: Directory
    'sbg:x': 1880.04736328125
    'sbg:y': -218.24851989746094
  - id: output_isoform
    outputSource:
      - deseq2_isoform/output_isoform
    type: Directory
    'sbg:x': 1883.72607421875
    'sbg:y': 514.9773559570312
steps:
  - id: gunzip
    in:
      - id: file
        source: wget/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../../tool/gunzip/gunzip.cwl
    'sbg:x': -1834.89697265625
    'sbg:y': -422.5365295410156
  - id: gunzip_1
    in:
      - id: file
        source: wget_1/downloaded
    out:
      - id: decompressed
      - id: stderr
    run: ../../../../tool/gunzip/gunzip.cwl
    'sbg:x': -1820.98828125
    'sbg:y': 168.24818420410156
  - id: star_index
    in:
      - id: genomeDir
        source: for_star_index_dir_sh/STAR_reference
      - id: genomeFastaFiles
        source: gunzip_1/decompressed
      - id: runThreadN
        source: runThreadN
      - id: sjdbGTFfile
        source: gunzip/decompressed
    out:
      - id: starIndex
    run: ../../../../tool/star/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': -1368.9208984375
    'sbg:y': -373.9208068847656
  - id: rsem_index
    in:
      - id: gtf
        source: gunzip/decompressed
      - id: reference_fasta
        source: gunzip_1/decompressed
      - id: num_threads
        source: num_threads
      - id: reference_dir
        source: for_rsem_index_dir_sh/RSEM_reference
      - id: reference_prefix
        source: reference_prefix
    out:
      - id: rsem_index
    run: ../../../../tool/rsem/rsem_index/rsem_index.cwl
    label: 'rsem-prepare-reference: preparing reference sequences'
    'sbg:x': -1324.488525390625
    'sbg:y': 182.40597534179688
  - id: for_star_index_dir_sh
    in: []
    out:
      - id: STAR_reference
    run: ../../../../tool/for_star_index_dir/for_star_index_dir.cwl
    label: for_star_index_dir
    'sbg:x': -1872.7210693359375
    'sbg:y': -127.8011474609375
  - id: for_rsem_index_dir_sh
    in: []
    out:
      - id: RSEM_reference
    run: ../../../../tool/for_rsem_index_dir/for_rsem_index_dir.cwl
    label: for_rsem_index_dir
    'sbg:x': -1730.2900390625
    'sbg:y': 543.0032958984375
  - id: deseq2
    in:
      - id: sample2condition.txt
        source: sample2condition/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: rsem_out
        source:
          - star_rsem_wf_pe/genes_result
          - star_rsem_wf_pe_1/genes_result
          - star_rsem_wf_pe_2/genes_result
          - star_rsem_wf_pe_3/genes_result
          - star_rsem_wf_pe_4/genes_result
          - star_rsem_wf_pe_5/genes_result
          - star_rsem_wf_pe_6/genes_result
    out:
      - id: output_gene
    run: ../../../../tool/deseq2/deseq2_gene/deseq2_gene.cwl
    label: deseq2_gene
    'sbg:x': 1471.296142578125
    'sbg:y': -223.66146850585938
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': 1073.6351318359375
    'sbg:y': -706.525146484375
  - id: sample2condition
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: >-
      ../../../../tool/sample2condition/sample2condition_gene/sample2condition_gene.cwl
    label: sample2condition_gene
    'sbg:x': 1087.04736328125
    'sbg:y': -449.24114990234375
  - id: wget
    in:
      - id: output_name
        source: output_name
      - id: url
        source: url
    out:
      - id: downloaded
      - id: stderr
    run: ../../../../tool/wget/wget.cwl
    'sbg:x': -2236.78515625
    'sbg:y': -418.1373596191406
  - id: wget_1
    in:
      - id: output_name
        source: output_name_1
      - id: url
        source: url_1
    out:
      - id: downloaded
      - id: stderr
    run: ../../../../tool/wget/wget.cwl
    'sbg:x': -2244.922607421875
    'sbg:y': -36.88838577270508
  - id: star_rsem_wf_pe
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid
      - id: nthreads
        source: nthreads
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads
      - id: outFileNamePrefix
        source: runid
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid
      - id: nthreads_2
        source: nthreads
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -186.26417541503906
    'sbg:y': -1239.1134033203125
  - id: star_rsem_wf_pe_1
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_1
      - id: nthreads
        source: nthreads_1
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_1
      - id: outFileNamePrefix
        source: runid_1
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_1
      - id: nthreads_2
        source: nthreads_1
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -130.2200927734375
    'sbg:y': -771.3663940429688
  - id: star_rsem_wf_pe_2
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_2
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
      - id: outFileNamePrefix
        source: runid_2
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_2
      - id: nthreads_2
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -69.236083984375
    'sbg:y': -255.41929626464844
  - id: star_rsem_wf_pe_3
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_3
      - id: nthreads
        source: nthreads_3
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_3
      - id: outFileNamePrefix
        source: runid_3
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_3
      - id: nthreads_2
        source: nthreads_3
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -115.67168426513672
    'sbg:y': 252.97007751464844
  - id: star_rsem_wf_pe_4
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_4
      - id: nthreads
        source: nthreads_4
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_4
      - id: outFileNamePrefix
        source: runid_4
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_4
      - id: nthreads_2
        source: nthreads_4
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -86.0744857788086
    'sbg:y': 753.5776977539062
  - id: star_rsem_wf_pe_5
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_5
      - id: nthreads
        source: nthreads_5
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_5
      - id: outFileNamePrefix
        source: runid_5
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_5
      - id: nthreads_2
        source: nthreads_5
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -73.4804458618164
    'sbg:y': 1369.66259765625
  - id: star_rsem_wf_pe_6
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_6
      - id: nthreads
        source: nthreads_6
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_6
      - id: outFileNamePrefix
        source: runid_6
      - id: outSAMtype
        source:
          - outSAMtype
      - id: quantMode
        source: quantMode
      - id: rsem_index_dir
        source: rsem_index/rsem_index
      - id: rsem_output_prefix
        source: runid_6
      - id: nthreads_2
        source: nthreads_6
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: SJ.out.tab
      - id: readspergene
      - id: mappingstats
      - id: Log.progress.out
      - id: Log.out
      - id: bamRemDups
      - id: transcript_sorted_bam_bai
      - id: transcript_sorted_bam
      - id: transcript_bam
      - id: stat
      - id: isoforms_result
      - id: genes_result
      - id: aligned
      - id: transcriptomesam
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -59.01015853881836
    'sbg:y': 1916.6461181640625
  - id: deseq2_isoform
    in:
      - id: sample2condition.txt
        source: sample2condition_isoform/output1
      - id: target2gene.txt
        source: target2gene/target2gene.txt
      - id: rsem_out
        source:
          - star_rsem_wf_pe/isoforms_result
          - star_rsem_wf_pe_1/isoforms_result
          - star_rsem_wf_pe_2/isoforms_result
          - star_rsem_wf_pe_3/isoforms_result
          - star_rsem_wf_pe_4/isoforms_result
          - star_rsem_wf_pe_5/isoforms_result
          - star_rsem_wf_pe_6/isoforms_result
    out:
      - id: output_isoform
    run: ../../../../tool/deseq2/deseq2_isoform/deseq2_isoform.cwl
    label: deseq2_isoform
    'sbg:x': 1521.6851806640625
    'sbg:y': 514.4035034179688
  - id: sample2condition_isoform
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: >-
      ../../../../tool/sample2condition/sample2condition_isoform/sample2condition_isoform.cwl
    label: sample2condition_isoform
    'sbg:x': 1142.68994140625
    'sbg:y': 697.2831420898438
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
