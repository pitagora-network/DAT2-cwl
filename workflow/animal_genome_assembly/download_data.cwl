#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
doc: "A sub-workflow to download sample data described in Animal Genome Assembly pipeline by Kazuharu Arakawa (@gaou_ak), CWLized by Tazro Ohta (@inutano)"

inputs:
  nanopore_read_ebi_1:
    type: string
    label: "2.5G"
    default: "ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR209/ERR2092776/nanopore_N2.tar.gz"
  nanopore_read_ebi_2:
    type: string
    label: "1.8G"
    default: "ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR209/ERR2092777/nanopore_him9.tar.gz"
  illumina_read_ebi_1:
    type: string
    label: "3.2G"
    default: "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR209/001/ERR2092781/ERR2092781.fastq.gz"
  illumina_read_ebi_2:
    type: string
    label: "3.4G"
    default: "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR209/002/ERR2092782/ERR2092782.fastq.gz"
  illumina_read_ebi_3:
    type: string
    label: "1.1G"
    default: "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR209/003/ERR2092783/ERR2092783.fastq.gz"
  illumina_read_ebi_4:
    type: string
    label: "1.2G"
    default: "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR209/004/ERR2092784/ERR2092784.fastq.gz"

steps:
  download_nanopore_read_ebi_1
    run: wget.cwl
    in:
      url: nanopore_read_ebi_1
      use_remote_name: true
    out:
      - downloaded

  untar_nanopore_read_ebi_1
    run: tar.cwl
    in:
      file: download_nanopore_read_ebi_1/downloaded
      extract: true
      gzip: true
    out:
      - downloaded

  download_nanopore_read_ebi_2
    run: .cwl
    in:
      url: nanopore_read_ebi_2
      use_remote_name: true
    out:
      - downloaded

  untar_nanopore_read_ebi_2
    run: .cwl
    in:
      url: nanopore_read_ebi_2
      use_remote_name: true
    out:
      - downloaded

  download_illumina_read_ebi_1
    run: .cwl
    in:
      url: illumina_read_ebi_1
      use_remote_name: true
    out:
      - downloaded

  download_illumina_read_ebi_2
    run: .cwl
    in:
      url: illumina_read_ebi_2
      use_remote_name: true
    out:
      - downloaded

  download_illumina_read_ebi_3
    run: .cwl
    in:
      url: illumina_read_ebi_3
      use_remote_name: true
    out:
      - downloaded

  download_illumina_read_ebi_4
    run: .cwl
    in:
      url: illumina_read_ebi_4
      use_remote_name: true
    out:
      - downloaded
