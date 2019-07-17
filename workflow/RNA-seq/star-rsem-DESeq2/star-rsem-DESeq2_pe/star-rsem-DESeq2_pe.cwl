class: Workflow
cwlVersion: v1.0
$namespaces:
  edam: 'http://edamontology.org/'
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: url
    type: string
    'sbg:x': -2293.265869140625
    'sbg:y': -555.7481079101562
  - id: output_name
    type: string
    'sbg:x': -2293.265869140625
    'sbg:y': -364.78350830078125
  - id: url_1
    type: string
    'sbg:x': -2309.328125
    'sbg:y': -43.53466033935547
  - id: output_name_1
    type: string
    'sbg:x': -2296.835205078125
    'sbg:y': 177.77011108398438
  - id: split_files
    type: boolean?
    'sbg:x': -1005.0123291015625
    'sbg:y': -125.13037109375
  - id: runid
    type: string
    'sbg:x': -901.1580200195312
    'sbg:y': -1059.9879150390625
  - id: runid_1
    type: string
    'sbg:x': -874.29150390625
    'sbg:y': -705.6830444335938
  - id: runid_2
    type: string
    'sbg:x': -860.0615234375
    'sbg:y': -402.5841979980469
  - id: runid_3
    type: string
    'sbg:x': -780.24462890625
    'sbg:y': 101.03105163574219
  - id: runid_4
    type: string
    'sbg:x': -814.5255126953125
    'sbg:y': 491.0593566894531
  - id: runid_5
    type: string
    'sbg:x': -784.6425170898438
    'sbg:y': 841.1171875
  - id: runid_6
    type: string
    'sbg:x': -739.1065673828125
    'sbg:y': 1181.2139892578125
  - id: quantMode
    type: string
    'sbg:x': -1089.80029296875
    'sbg:y': 616.7484741210938
  - id: outSAMtype
    type: 'string[]'
    'sbg:x': -1072.260498046875
    'sbg:y': 178.0520782470703
  - id: nthreads_2
    type: int
    'sbg:x': -1297.6160888671875
    'sbg:y': 831.091064453125
  - id: reference_prefix
    type: string
    'sbg:x': -1455.0606689453125
    'sbg:y': 34.887454986572266
  - id: num_threads
    type: int?
    'sbg:x': -1462.75927734375
    'sbg:y': 400.5768737792969
  - id: rsem_index_prefix
    type: string?
    'sbg:x': -1215.6456298828125
    'sbg:y': 1108.1956787109375
  - id: SraRunTable
    type: File
    'sbg:x': 1048.414306640625
    'sbg:y': 326.6095275878906
outputs:
  - id: downloaded
    outputSource:
      - wget/downloaded
    type: File
    'sbg:x': -2073.74560546875
    'sbg:y': -295.1795959472656
  - id: downloaded_1
    outputSource:
      - wget_1/downloaded
    type: File
    'sbg:x': -2111.224853515625
    'sbg:y': 206.3255615234375
  - id: starIndex
    outputSource:
      - star_index/starIndex
    type: Directory
    'sbg:x': -1360.5517578125
    'sbg:y': -623.029541015625
  - id: transcriptomesam
    outputSource:
      - star_rsem_wf_pe/transcriptomesam
    type: File?
    'sbg:x': -317.04119873046875
    'sbg:y': -1190.2425537109375
  - id: transcript_sorted_bam_bai
    outputSource:
      - star_rsem_wf_pe/transcript_sorted_bam_bai
    type: File?
    'sbg:x': -280.96673583984375
    'sbg:y': -1078.6630859375
  - id: transcript_sorted_bam
    outputSource:
      - star_rsem_wf_pe/transcript_sorted_bam
    type: File?
    'sbg:x': -166.78948974609375
    'sbg:y': -1185.5286865234375
  - id: transcript_bam
    outputSource:
      - star_rsem_wf_pe/transcript_bam
    type: File
    'sbg:x': -100.36844635009766
    'sbg:y': -1058.908447265625
  - id: stat
    outputSource:
      - star_rsem_wf_pe/stat
    type: Directory
    'sbg:x': 2.9692752361297607
    'sbg:y': -989.25341796875
  - id: SJ.out.tab
    outputSource:
      - star_rsem_wf_pe/SJ.out.tab
    type: File?
    'sbg:x': -162.55938720703125
    'sbg:y': -926.4249877929688
  - id: readspergene
    outputSource:
      - star_rsem_wf_pe/readspergene
    type: File?
    'sbg:x': 102.0448226928711
    'sbg:y': -902.26025390625
  - id: mappingstats
    outputSource:
      - star_rsem_wf_pe/mappingstats
    type: File?
    'sbg:x': -46.56849670410156
    'sbg:y': -835.80712890625
  - id: Log.progress.out
    outputSource:
      - star_rsem_wf_pe/Log.progress.out
    type: File?
    'sbg:x': 219.2439422607422
    'sbg:y': -983.2122192382812
  - id: Log.out
    outputSource:
      - star_rsem_wf_pe/Log.out
    type: File?
    'sbg:x': 88.75420379638672
    'sbg:y': -1106.4525146484375
  - id: isoforms_result
    outputSource:
      - star_rsem_wf_pe/isoforms_result
    type: File
    'sbg:x': 240.9922332763672
    'sbg:y': -849.0977172851562
  - id: fastqFiles
    outputSource:
      - star_rsem_wf_pe/fastqFiles
    type: 'File[]'
    'sbg:x': 262.74053955078125
    'sbg:y': -1108.8603515625
  - id: bamRemDups
    outputSource:
      - star_rsem_wf_pe/bamRemDups
    type: File?
    'sbg:x': 346.1089782714844
    'sbg:y': -989.2446899414062
  - id: transcriptomesam_1
    outputSource:
      - star_rsem_wf_pe_1/transcriptomesam
    type: File?
    'sbg:x': -173.43353271484375
    'sbg:y': -724.6405029296875
  - id: transcript_sorted_bam_bai_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_sorted_bam_bai
    type: File?
    'sbg:x': -16.362539291381836
    'sbg:y': -681.1439208984375
  - id: transcript_sorted_bam_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_sorted_bam
    type: File?
    'sbg:x': 108.08601379394531
    'sbg:y': -728.2651977539062
  - id: transcript_bam_1
    outputSource:
      - star_rsem_wf_pe_1/transcript_bam
    type: File
    'sbg:x': 267.573486328125
    'sbg:y': -672.6862182617188
  - id: stat_1
    outputSource:
      - star_rsem_wf_pe_1/stat
    type: Directory
    'sbg:x': 127.41783142089844
    'sbg:y': -580.860107421875
  - id: SJ.out.tab_1
    outputSource:
      - star_rsem_wf_pe_1/SJ.out.tab
    type: File?
    'sbg:x': 401.68792724609375
    'sbg:y': -573.6107177734375
  - id: readspergene_1
    outputSource:
      - star_rsem_wf_pe_1/readspergene
    type: File?
    'sbg:x': 407.7291259765625
    'sbg:y': -731.8899536132812
  - id: mappingstats_1
    outputSource:
      - star_rsem_wf_pe_1/mappingstats
    type: File?
    'sbg:x': 497.21807861328125
    'sbg:y': -631.6061401367188
  - id: Log.progress.out_1
    outputSource:
      - star_rsem_wf_pe_1/Log.progress.out
    type: File?
    'sbg:x': -147.98121643066406
    'sbg:y': -530.1141357421875
  - id: Log.out_1
    outputSource:
      - star_rsem_wf_pe_1/Log.out
    type: File?
    'sbg:x': -33.19856643676758
    'sbg:y': -525.2811889648438
  - id: isoforms_result_1
    outputSource:
      - star_rsem_wf_pe_1/isoforms_result
    type: File
    'sbg:x': 239.86331176757812
    'sbg:y': -498.6999206542969
  - id: fastqFiles_1
    outputSource:
      - star_rsem_wf_pe_1/fastqFiles
    type: 'File[]'
    'sbg:x': 82.79232025146484
    'sbg:y': -421.3726501464844
  - id: bamRemDups_1
    outputSource:
      - star_rsem_wf_pe_1/bamRemDups
    type: File?
    'sbg:x': 640.9984741210938
    'sbg:y': -574.8189086914062
  - id: transcriptomesam_2
    outputSource:
      - star_rsem_wf_pe_2/transcriptomesam
    type: File?
    'sbg:x': -205.97665405273438
    'sbg:y': -345.2536315917969
  - id: transcript_sorted_bam_bai_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_sorted_bam_bai
    type: File?
    'sbg:x': -58.571571350097656
    'sbg:y': -328.33831787109375
  - id: transcript_sorted_bam_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_sorted_bam
    type: File?
    'sbg:x': 146.82894897460938
    'sbg:y': -295.71588134765625
  - id: transcript_bam_2
    outputSource:
      - star_rsem_wf_pe_2/transcript_bam
    type: File
    'sbg:x': 322.0235290527344
    'sbg:y': -307.7982482910156
  - id: stat_2
    outputSource:
      - star_rsem_wf_pe_2/stat
    type: Directory
    'sbg:x': 500.8428039550781
    'sbg:y': -272.75933837890625
  - id: SJ.out.tab_2
    outputSource:
      - star_rsem_wf_pe_2/SJ.out.tab
    type: File?
    'sbg:x': 644.6231689453125
    'sbg:y': -277.59228515625
  - id: readspergene_2
    outputSource:
      - star_rsem_wf_pe_2/readspergene
    type: File?
    'sbg:x': -57.36333465576172
    'sbg:y': -207.51446533203125
  - id: mappingstats_2
    outputSource:
      - star_rsem_wf_pe_2/mappingstats
    type: File?
    'sbg:x': 70.70993041992188
    'sbg:y': -167.64259338378906
  - id: Log.progress.out_2
    outputSource:
      - star_rsem_wf_pe_2/Log.progress.out
    type: File?
    'sbg:x': 221.73973083496094
    'sbg:y': -165.2261199951172
  - id: Log.out_2
    outputSource:
      - star_rsem_wf_pe_2/Log.out
    type: File?
    'sbg:x': 383.6436767578125
    'sbg:y': -153.14373779296875
  - id: isoforms_result_2
    outputSource:
      - star_rsem_wf_pe_2/isoforms_result
    type: File
    'sbg:x': 552.7970581054688
    'sbg:y': -130.1872100830078
  - id: fastqFiles_2
    outputSource:
      - star_rsem_wf_pe_2/fastqFiles
    type: 'File[]'
    'sbg:x': 29.62982940673828
    'sbg:y': -39.569332122802734
  - id: bamRemDups_2
    outputSource:
      - star_rsem_wf_pe_2/bamRemDups
    type: File?
    'sbg:x': 273.6939697265625
    'sbg:y': -50.443477630615234
  - id: transcriptomesam_3
    outputSource:
      - star_rsem_wf_pe_3/transcriptomesam
    type: File?
    'sbg:x': -170.6741180419922
    'sbg:y': 131.83001708984375
  - id: transcript_sorted_bam_bai_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 4.466985702514648
    'sbg:y': 152.84693908691406
  - id: transcript_sorted_bam_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_sorted_bam
    type: File?
    'sbg:x': 153.9207305908203
    'sbg:y': 184.37234497070312
  - id: transcript_bam_3
    outputSource:
      - star_rsem_wf_pe_3/transcript_bam
    type: File
    'sbg:x': 248.49691772460938
    'sbg:y': 104.97504425048828
  - id: stat_3
    outputSource:
      - star_rsem_wf_pe_3/stat
    type: Directory
    'sbg:x': 390.94500732421875
    'sbg:y': 183.20474243164062
  - id: SJ.out.tab_3
    outputSource:
      - star_rsem_wf_pe_3/SJ.out.tab
    type: File?
    'sbg:x': -8.376694679260254
    'sbg:y': 284.78656005859375
  - id: readspergene_3
    outputSource:
      - star_rsem_wf_pe_3/readspergene
    type: File?
    'sbg:x': 289.3631896972656
    'sbg:y': 297.6302490234375
  - id: mappingstats_3
    outputSource:
      - star_rsem_wf_pe_3/mappingstats
    type: File?
    'sbg:x': 451.66058349609375
    'sbg:y': 332.6584777832031
  - id: Log.progress.out_3
    outputSource:
      - star_rsem_wf_pe_3/Log.progress.out
    type: File?
    'sbg:x': 5.6345930099487305
    'sbg:y': 410.8881530761719
  - id: Log.out_3
    outputSource:
      - star_rsem_wf_pe_3/Log.out
    type: File?
    'sbg:x': 191.28416442871094
    'sbg:y': 426.0670471191406
  - id: isoforms_result_3
    outputSource:
      - star_rsem_wf_pe_3/isoforms_result
    type: File
    'sbg:x': 348.9111633300781
    'sbg:y': 452.9220275878906
  - id: fastqFiles_3
    outputSource:
      - star_rsem_wf_pe_3/fastqFiles
    type: 'File[]'
    'sbg:x': 536.887939453125
    'sbg:y': 414.3909912109375
  - id: bamRemDups_3
    outputSource:
      - star_rsem_wf_pe_3/bamRemDups
    type: File?
    'sbg:x': 583.5922241210938
    'sbg:y': 245.08792114257812
  - id: transcriptomesam_4
    outputSource:
      - star_rsem_wf_pe_4/transcriptomesam
    type: File?
    'sbg:x': -101.9367904663086
    'sbg:y': 624.3734741210938
  - id: transcript_sorted_bam_bai_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 87.49742889404297
    'sbg:y': 660.953857421875
  - id: transcript_sorted_bam_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_sorted_bam
    type: File?
    'sbg:x': 293.9154052734375
    'sbg:y': 621.7605590820312
  - id: transcript_bam_4
    outputSource:
      - star_rsem_wf_pe_4/transcript_bam
    type: File
    'sbg:x': 20.86884307861328
    'sbg:y': 540.7611083984375
  - id: stat_4
    outputSource:
      - star_rsem_wf_pe_4/stat
    type: Directory
    'sbg:x': 296.5282897949219
    'sbg:y': 755.0177612304688
  - id: SJ.out.tab_4
    outputSource:
      - star_rsem_wf_pe_4/SJ.out.tab
    type: File?
    'sbg:x': 428.4790344238281
    'sbg:y': 721.0502319335938
  - id: readspergene_4
    outputSource:
      - star_rsem_wf_pe_4/readspergene
    type: File?
    'sbg:x': 466.3658752441406
    'sbg:y': 608.6961669921875
  - id: mappingstats_4
    outputSource:
      - star_rsem_wf_pe_4/mappingstats
    type: File?
    'sbg:x': 26.094614028930664
    'sbg:y': 816.4205932617188
  - id: Log.progress.out_4
    outputSource:
      - star_rsem_wf_pe_4/Log.progress.out
    type: File?
    'sbg:x': 175.02911376953125
    'sbg:y': 842.5494384765625
  - id: Log.out_4
    outputSource:
      - star_rsem_wf_pe_4/Log.out
    type: File?
    'sbg:x': 382.7535400390625
    'sbg:y': 850.3881225585938
  - id: isoforms_result_4
    outputSource:
      - star_rsem_wf_pe_4/isoforms_result
    type: File
    'sbg:x': 585.252197265625
    'sbg:y': 755.0177612304688
  - id: fastqFiles_4
    outputSource:
      - star_rsem_wf_pe_4/fastqFiles
    type: 'File[]'
    'sbg:x': 220.75460815429688
    'sbg:y': 990.177490234375
  - id: bamRemDups_4
    outputSource:
      - star_rsem_wf_pe_4/bamRemDups
    type: File?
    'sbg:x': 441.54345703125
    'sbg:y': 970.5808715820312
  - id: transcriptomesam_5
    outputSource:
      - star_rsem_wf_pe_5/transcriptomesam
    type: File?
    'sbg:x': -94.09813690185547
    'sbg:y': 1137.8055419921875
  - id: transcript_sorted_bam_bai_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 182.86776733398438
    'sbg:y': 1175.6923828125
  - id: transcript_sorted_bam_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_sorted_bam
    type: File?
    'sbg:x': 376.2213134765625
    'sbg:y': 1126.047607421875
  - id: transcript_bam_5
    outputSource:
      - star_rsem_wf_pe_5/transcript_bam
    type: File
    'sbg:x': 35.239715576171875
    'sbg:y': 1095.9993896484375
  - id: stat_5
    outputSource:
      - star_rsem_wf_pe_5/stat
    type: Directory
    'sbg:x': 548.6717529296875
    'sbg:y': 1247.5467529296875
  - id: SJ.out.tab_5
    outputSource:
      - star_rsem_wf_pe_5/SJ.out.tab
    type: File?
    'sbg:x': 15.643071174621582
    'sbg:y': 1307.64306640625
  - id: readspergene_5
    outputSource:
      - star_rsem_wf_pe_5/readspergene
    type: File?
    'sbg:x': 241.65769958496094
    'sbg:y': 1344.2235107421875
  - id: mappingstats_5
    outputSource:
      - star_rsem_wf_pe_5/mappingstats
    type: File?
    'sbg:x': 555.2039794921875
    'sbg:y': 1391.2554931640625
  - id: Log.progress.out_5
    outputSource:
      - star_rsem_wf_pe_5/Log.progress.out
    type: File?
    'sbg:x': 84.8845443725586
    'sbg:y': 1459.1905517578125
  - id: Log.out_5
    outputSource:
      - star_rsem_wf_pe_5/Log.out
    type: File?
    'sbg:x': 342.2538146972656
    'sbg:y': 1514.0611572265625
  - id: isoforms_result_5
    outputSource:
      - star_rsem_wf_pe_5/isoforms_result
    type: File
    'sbg:x': 706.7514038085938
    'sbg:y': 1322.0140380859375
  - id: fastqFiles_5
    outputSource:
      - star_rsem_wf_pe_5/fastqFiles
    type: 'File[]'
    'sbg:x': 748.5575561523438
    'sbg:y': 1175.6923828125
  - id: bamRemDups_5
    outputSource:
      - star_rsem_wf_pe_5/bamRemDups
    type: File?
    'sbg:x': 547.3653564453125
    'sbg:y': 1516.6739501953125
  - id: transcriptomesam_6
    outputSource:
      - star_rsem_wf_pe_6/transcriptomesam
    type: File?
    'sbg:x': -124.14632415771484
    'sbg:y': 1662.99560546875
  - id: transcript_sorted_bam_bai_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 49.61058807373047
    'sbg:y': 1669.52783203125
  - id: transcript_sorted_bam_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_sorted_bam
    type: File?
    'sbg:x': 241.65769958496094
    'sbg:y': 1673.4471435546875
  - id: transcript_bam_6
    outputSource:
      - star_rsem_wf_pe_6/transcript_bam
    type: File
    'sbg:x': 384.0599670410156
    'sbg:y': 1717.8662109375
  - id: stat_6
    outputSource:
      - star_rsem_wf_pe_6/stat
    type: Directory
    'sbg:x': 131.91648864746094
    'sbg:y': 1788.4140625
  - id: SJ.out.tab_6
    outputSource:
      - star_rsem_wf_pe_6/SJ.out.tab
    type: File?
    'sbg:x': 274.3187561035156
    'sbg:y': 1822.381591796875
  - id: readspergene_6
    outputSource:
      - star_rsem_wf_pe_6/readspergene
    type: File?
    'sbg:x': 522.5429077148438
    'sbg:y': 1844.5911865234375
  - id: mappingstats_6
    outputSource:
      - star_rsem_wf_pe_6/mappingstats
    type: File?
    'sbg:x': -0.03424416482448578
    'sbg:y': 1899.4617919921875
  - id: Log.progress.out_6
    outputSource:
      - star_rsem_wf_pe_6/Log.progress.out
    type: File?
    'sbg:x': 148.6299285888672
    'sbg:y': 1982.15087890625
  - id: Log.out_6
    outputSource:
      - star_rsem_wf_pe_6/Log.out
    type: File?
    'sbg:x': 344.8594665527344
    'sbg:y': 1961.5521240234375
  - id: isoforms_result_6
    outputSource:
      - star_rsem_wf_pe_6/isoforms_result
    type: File
    'sbg:x': 506.396484375
    'sbg:y': 1978.8984375
  - id: fastqFiles_6
    outputSource:
      - star_rsem_wf_pe_6/fastqFiles
    type: 'File[]'
    'sbg:x': 110.68498229980469
    'sbg:y': 2120.9208984375
  - id: bamRemDups_6
    outputSource:
      - star_rsem_wf_pe_6/bamRemDups
    type: File?
    'sbg:x': 340.52288818359375
    'sbg:y': 2120.9208984375
  - id: rsem_index_1
    outputSource:
      - rsem_index/rsem_index
    type: Directory
    'sbg:x': -1251.2496337890625
    'sbg:y': 423.8552551269531
  - id: output
    outputSource:
      - deseq2/output
    type: Directory
    'sbg:x': 1664.796630859375
    'sbg:y': -159.45272827148438
  - id: aligned
    outputSource:
      - star_rsem_wf_pe/aligned
    type: File
    'sbg:x': 458.2008361816406
    'sbg:y': -1121.970703125
  - id: aligned_1
    outputSource:
      - star_rsem_wf_pe_1/aligned
    type: File
    'sbg:x': 405.8953552246094
    'sbg:y': -428.5212097167969
  - id: aligned_2
    outputSource:
      - star_rsem_wf_pe_2/aligned
    type: File
    'sbg:x': -216.2845458984375
    'sbg:y': -27.939626693725586
  - id: aligned_3
    outputSource:
      - star_rsem_wf_pe_3/aligned
    type: File
    'sbg:x': -303.2192687988281
    'sbg:y': 490.259521484375
  - id: aligned_4
    outputSource:
      - star_rsem_wf_pe_4/aligned
    type: File
    'sbg:x': -236.73977661132812
    'sbg:y': 984.5948486328125
  - id: aligned_5
    outputSource:
      - star_rsem_wf_pe_5/aligned
    type: File
    'sbg:x': -180.48788452148438
    'sbg:y': 1489.175537109375
  - id: aligned_6
    outputSource:
      - star_rsem_wf_pe_6/aligned
    type: File
    'sbg:x': -236.73977661132812
    'sbg:y': 2191.455810546875
steps:
  - id: star_rsem_wf_pe
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
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
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -442.5400390625
    'sbg:y': -907.251708984375
  - id: star_rsem_wf_pe_1
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_1
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
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
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -406.7059020996094
    'sbg:y': -584.1411743164062
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
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -380.3752746582031
    'sbg:y': -238.04119873046875
  - id: star_rsem_wf_pe_3
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_3
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
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
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -406.21466064453125
    'sbg:y': 301.96051025390625
  - id: star_rsem_wf_pe_4
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_4
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
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
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -325.3263854980469
    'sbg:y': 783.5361938476562
  - id: star_rsem_wf_pe_5
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_5
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
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
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -291.1352844238281
    'sbg:y': 1275.9014892578125
  - id: star_rsem_wf_pe_6
    in:
      - id: split_files
        source: split_files
      - id: runid
        source: runid_6
      - id: nthreads
        source: nthreads_2
      - id: genomeDir
        source: star_index/starIndex
      - id: nthreads_1
        source: nthreads_2
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
        source: nthreads_2
      - id: rsem_index_prefix
        source: rsem_index_prefix
    out:
      - id: fastqFiles
      - id: transcriptomesam
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
    run: ../../star-rsem/paired_end/star-rsem_wf_pe.cwl
    'sbg:x': -316.378662109375
    'sbg:y': 1836.4862060546875
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
    'sbg:x': -2117.332275390625
    'sbg:y': -423.4134826660156
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
    'sbg:x': -2153.620361328125
    'sbg:y': 89.62873840332031
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
      - id: sjdbGTFfile
        source: gunzip/decompressed
    out:
      - id: starIndex
    run: ../../../../tool/star_pre/star_index/star_index.cwl
    label: 'STAR genomeGenerate: Generating genome indexes.'
    'sbg:x': -1420.1297607421875
    'sbg:y': -425.753173828125
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
    'sbg:x': -1378.09716796875
    'sbg:y': 197.94418334960938
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
      - id: output
    run: ../../../../tool/DESeq2/deseq2.cwl
    label: deseq2
    'sbg:x': 1379.4359130859375
    'sbg:y': -194.1349334716797
  - id: target2gene
    in: []
    out:
      - id: target2gene.txt
    run: ../../../../tool/target2gene/target2gene.cwl
    label: target2gene
    'sbg:x': 1005.1517333984375
    'sbg:y': -548.1040649414062
  - id: sample2condition
    in:
      - id: SraRunTable
        source: SraRunTable
    out:
      - id: output1
    run: ../../../../tool/sample2condition/sample2condition.cwl
    label: sample2condition
    'sbg:x': 1148.21044921875
    'sbg:y': 52.8286018371582
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
