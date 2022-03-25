{
    "$graph": [
        {
            "class": "CommandLineTool",
            "doc": "An ultra-fast all-in-one FASTQ preprocessor (QC/adapters/trimming/filtering/splitting/merging...)",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/fastp:0.23.2--hb7a2d85_2",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "fastp",
            "arguments": [
                {
                    "prefix": "-o",
                    "position": 2,
                    "valueFrom": "$(inputs.fastq1.nameroot).fastp.fastq"
                },
                {
                    "prefix": "-O",
                    "position": 3,
                    "valueFrom": "$(inputs.fastq2.nameroot).fastp.fastq"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-i",
                        "position": 0
                    },
                    "id": "#fastp-pe.cwl/fastq1"
                },
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-I",
                        "position": 1
                    },
                    "id": "#fastp-pe.cwl/fastq2"
                }
            ],
            "stdout": "fastp-pe-stdout.log",
            "stderr": "fastp-pe-stderr.log",
            "id": "#fastp-pe.cwl",
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.fastq1.nameroot).fastp.fastq"
                    },
                    "id": "#fastp-pe.cwl/output_fastq1"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.fastq2.nameroot).fastp.fastq"
                    },
                    "id": "#fastp-pe.cwl/output_fastq2"
                },
                {
                    "type": "File",
                    "id": "#fastp-pe.cwl/stderr",
                    "outputBinding": {
                        "glob": "fastp-pe-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#fastp-pe.cwl/stdout",
                    "outputBinding": {
                        "glob": "fastp-pe-stdout.log"
                    }
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "doc": "A high throughput sequence QC analysis tool",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/fastqc:0.11.9--hdfd78af_1",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "fastqc",
            "arguments": [
                {
                    "prefix": "--outdir",
                    "valueFrom": "$(runtime.outdir)",
                    "position": 0
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#fastqc.cwl/fastq"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "*.html"
                    },
                    "id": "#fastqc.cwl/html"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "*.zip"
                    },
                    "id": "#fastqc.cwl/result_files"
                },
                {
                    "type": "File",
                    "id": "#fastqc.cwl/stderr",
                    "outputBinding": {
                        "glob": "fastqc-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#fastqc.cwl/stdout",
                    "outputBinding": {
                        "glob": "fastqc-stdout.log"
                    }
                }
            ],
            "stdout": "fastqc-stdout.log",
            "stderr": "fastqc-stderr.log",
            "id": "#fastqc.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "A de novo assembler for isolated bacterial genomes.",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/platanus-b:1.0.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": [
                "platanus_b",
                "assemble"
            ],
            "inputs": [
                {
                    "id": "#platanus-b-assemble.cwl/out_file_prefix",
                    "doc": "prefix of output files (default out, length <= 200)",
                    "type": "string",
                    "default": "out",
                    "inputBinding": {
                        "prefix": "-o",
                        "position": 0
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/read_files",
                    "doc": "reads file (fasta or fastq, number <= 100, uncompressed and compressed (gzip or bzip2) files are accepted)",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "prefix": "-f",
                        "position": 1
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/initial_kmer_size",
                    "doc": "initial k-mer size (default 32)",
                    "type": "int",
                    "default": 32,
                    "inputBinding": {
                        "prefix": "-k",
                        "position": 2
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/max_kmer_factor",
                    "doc": "maximum-k-mer factor (maximum-k = FLOAT*read-length, default 0.5)",
                    "type": "float",
                    "default": 0.5,
                    "inputBinding": {
                        "prefix": "-K",
                        "position": 3
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/step_size",
                    "doc": "step size of k-mer extension (>= 1, default 10)",
                    "type": "int",
                    "default": 10,
                    "inputBinding": {
                        "prefix": "-s",
                        "position": 4
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/initial_kmer_cov_cutoff",
                    "doc": "initial k-mer coverage cutoff (default 0, 0 means auto)",
                    "type": "int",
                    "default": 0,
                    "inputBinding": {
                        "prefix": "-n",
                        "position": 5
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/min_kmer_cov",
                    "doc": "minimum k-mer coverage (default 1)",
                    "type": "int",
                    "default": 1,
                    "inputBinding": {
                        "prefix": "-c",
                        "position": 6
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/kmer_ext_safety_level",
                    "doc": "k-mer extension safety level (default 10.0)",
                    "type": "float",
                    "default": 10.0,
                    "inputBinding": {
                        "prefix": "-a",
                        "position": 7
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/max_diff_bubble_crush",
                    "doc": "maximum difference for bubble crush (identity, default 0)",
                    "type": "float",
                    "default": 0.0,
                    "inputBinding": {
                        "prefix": "-u",
                        "position": 8
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/max_diff_branch_cut",
                    "doc": "maximum difference for branch cutting (coverage ratio, default 0.5)",
                    "type": "float",
                    "default": 0.5,
                    "inputBinding": {
                        "prefix": "-d",
                        "position": 9
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/kmer_cov_depth",
                    "doc": "k-mer coverage depth (k = initial k-mer size specified by -k) of homozygous region (default auto)",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "prefix": "-e",
                        "position": 10
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/num_threads",
                    "doc": "number of threads (<= 100, default 1)",
                    "type": "int",
                    "default": 1,
                    "inputBinding": {
                        "prefix": "-t",
                        "position": 11
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/mem_limit",
                    "doc": "memory limit for making kmer distribution (GB, >=1, default 16)",
                    "type": "int",
                    "default": 16,
                    "inputBinding": {
                        "prefix": "-m",
                        "position": 12
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/tmp_dir",
                    "doc": "directory for temporary files (default .)",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "inputBinding": {
                        "prefix": "-tmp",
                        "position": 13
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/kmer_occ_only",
                    "doc": "only output k-mer occurrence table (out_kmer_occ.bin; default off)",
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-kmer_occ_only",
                        "position": 14
                    }
                },
                {
                    "id": "#platanus-b-assemble.cwl/repeat",
                    "doc": "mode to assemble repetitive sequences (e.g. 16s rRNA)",
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-repeat",
                        "position": 15
                    }
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.out_file_prefix)_contig.fa"
                    },
                    "id": "#platanus-b-assemble.cwl/contig_fa"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.out_file_prefix)_$(inputs.initial_kmer_size)merFrq.tsv"
                    },
                    "id": "#platanus-b-assemble.cwl/kmer_frq"
                },
                {
                    "type": "File",
                    "id": "#platanus-b-assemble.cwl/stderr",
                    "outputBinding": {
                        "glob": "platanus_b-assemble-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#platanus-b-assemble.cwl/stdout",
                    "outputBinding": {
                        "glob": "platanus_b-assemble-stdout.log"
                    }
                }
            ],
            "stdout": "platanus_b-assemble-stdout.log",
            "stderr": "platanus_b-assemble-stderr.log",
            "id": "#platanus-b-assemble.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "A de novo assembler for isolated bacterial genomes.",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/platanus-b:1.0.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": [
                "platanus_b",
                "iterate"
            ],
            "inputs": [
                {
                    "id": "#platanus-b-iterate.cwl/out_file_dir_prefix",
                    "doc": "prefix of output file and directory (do not use \"/\", default out, length <= 200)",
                    "type": "string",
                    "default": "out",
                    "inputBinding": {
                        "prefix": "-o",
                        "position": 0
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/contig_files",
                    "doc": "contig (or scaffold) file (fasta format)",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "prefix": "-c",
                        "position": 1
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/num_of_iteration",
                    "doc": "number of iterations (default 6)",
                    "type": "int",
                    "default": 6,
                    "inputBinding": {
                        "prefix": "-i",
                        "position": 2
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/sccaffold_val",
                    "doc": "-l value of \"scaffold\" step",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "prefix": "-l",
                        "position": 3
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/max_diff_bubble_crush",
                    "doc": "maximum difference for bubble crush (identity, default 0)",
                    "type": "float",
                    "default": 0.0,
                    "inputBinding": {
                        "prefix": "-u",
                        "position": 4
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/inward_pair_file_in_1_file",
                    "doc": "lib_id inward_pair_file (reads in 1 file, fasta or fastq)",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "-ip1",
                        "position": 5
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/inward_pair_file_in_2_file",
                    "doc": "lib_id inward_pair_files (reads in 2 files, fasta or fastq)",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "prefix": "-IP1",
                        "position": 6
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/outward_pair_file_in_1_file",
                    "doc": "lib_id outward_pair_file (reads in 1 file, fasta or fastq)",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "-op1",
                        "position": 7
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/outward_pair_file_in_2_file",
                    "doc": "lib_id outward_pair_files (reads in 2 files, fasta or fastq)",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "prefix": "-OP1",
                        "position": 8
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/nanopore_reads",
                    "doc": "Oxford Nanopore long-read file (fasta or fastq)",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "prefix": "-ont",
                        "position": 9
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/pacbio_reads",
                    "doc": "PacBio long-read file (fasta or fastq)",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "prefix": "-p",
                        "position": 10
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/guide_contig",
                    "doc": "Guiding contig file; i.e. other assemblies, synthetic long-reads or corrected reads (fasta or fastq)",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "prefix": "-gc",
                        "position": 11
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/num_threads",
                    "doc": "number of threads (default 1)",
                    "type": "int",
                    "default": 1,
                    "inputBinding": {
                        "prefix": "-t",
                        "position": 12
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/mem_limit",
                    "doc": "memory limit for making kmer distribution (GB, >=1, default 1)",
                    "type": "int",
                    "default": 1,
                    "inputBinding": {
                        "prefix": "-m",
                        "position": 13
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/tmp_dir",
                    "doc": "directory for temporary files (default .)",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "inputBinding": {
                        "prefix": "-tmp",
                        "position": 14
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/sub_bin_dir",
                    "doc": "directory for binary files which platanus_b use internally (e.g. minimap2) (default /opt/Platanus_B/sub_bin)",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "inputBinding": {
                        "prefix": "-sub_bin",
                        "position": 15
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/keep_file",
                    "doc": "keep intermediate files (default off)",
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-keep_file",
                        "position": 16
                    }
                },
                {
                    "id": "#platanus-b-iterate.cwl/trim_overlap",
                    "doc": "trim overlapping edges of scaffolds (default, off)",
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-trim_overlap",
                        "position": 17
                    }
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.out_file_dir_prefix)_iterativeAssembly.fa"
                    },
                    "id": "#platanus-b-iterate.cwl/combined_fa"
                },
                {
                    "type": "File",
                    "id": "#platanus-b-iterate.cwl/stderr",
                    "outputBinding": {
                        "glob": "platanus_b-iterate-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#platanus-b-iterate.cwl/stdout",
                    "outputBinding": {
                        "glob": "platanus_b-iterate-stdout.log"
                    }
                }
            ],
            "stdout": "platanus_b-iterate-stdout.log",
            "stderr": "platanus_b-iterate-stderr.log",
            "id": "#platanus-b-iterate.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "a cross-platform and ultrafast toolkit for FASTA/Q file manipulation",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/seqkit:2.2.0--h9ee0642_0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "seqkit",
                "stats"
            ],
            "inputs": [
                {
                    "type": "File",
                    "id": "#seqkit-stats.cwl/fastq"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#seqkit-stats.cwl/result",
                    "outputBinding": {
                        "glob": "$(inputs.fastq.nameroot)_seqkit-stats-result.tsv"
                    }
                },
                {
                    "type": "File",
                    "id": "#seqkit-stats.cwl/stderr",
                    "outputBinding": {
                        "glob": "seqkit-stats-stderr.log"
                    }
                }
            ],
            "stdout": "$(inputs.fastq.nameroot)_seqkit-stats-result.tsv",
            "stderr": "seqkit-stats-stderr.log",
            "id": "#seqkit-stats.cwl"
        },
        {
            "class": "Workflow",
            "doc": "DAT2-cwl bacteria genome data analysis workflow. see https://github.com/pitagora-network/DAT2-cwl/blob/main/workflow/bacteria-genome/README.md",
            "requirements": [
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "id": "#main/fastq1"
                },
                {
                    "type": "File",
                    "id": "#main/fastq2"
                },
                {
                    "type": "int",
                    "default": 4,
                    "id": "#main/mem_limit"
                },
                {
                    "type": "int",
                    "default": 2,
                    "id": "#main/num_threads"
                }
            ],
            "steps": [
                {
                    "run": "#fastp-pe.cwl",
                    "in": [
                        {
                            "source": "#main/fastq1",
                            "id": "#main/fastp/fastq1"
                        },
                        {
                            "source": "#main/fastq2",
                            "id": "#main/fastp/fastq2"
                        }
                    ],
                    "out": [
                        "#main/fastp/output_fastq1",
                        "#main/fastp/output_fastq2"
                    ],
                    "id": "#main/fastp"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "source": "#main/fastp/output_fastq1",
                            "id": "#main/fastqc-fastp-fastq1/fastq"
                        }
                    ],
                    "out": [
                        "#main/fastqc-fastp-fastq1/html",
                        "#main/fastqc-fastp-fastq1/result_files"
                    ],
                    "id": "#main/fastqc-fastp-fastq1"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "source": "#main/fastp/output_fastq2",
                            "id": "#main/fastqc-fastp-fastq2/fastq"
                        }
                    ],
                    "out": [
                        "#main/fastqc-fastp-fastq2/html",
                        "#main/fastqc-fastp-fastq2/result_files"
                    ],
                    "id": "#main/fastqc-fastp-fastq2"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "source": "#main/fastq1",
                            "id": "#main/fastqc-fastq1/fastq"
                        }
                    ],
                    "out": [
                        "#main/fastqc-fastq1/html",
                        "#main/fastqc-fastq1/result_files"
                    ],
                    "id": "#main/fastqc-fastq1"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "source": "#main/fastq2",
                            "id": "#main/fastqc-fastq2/fastq"
                        }
                    ],
                    "out": [
                        "#main/fastqc-fastq2/html",
                        "#main/fastqc-fastq2/result_files"
                    ],
                    "id": "#main/fastqc-fastq2"
                },
                {
                    "run": "#platanus-b-assemble.cwl",
                    "in": [
                        {
                            "source": "#main/mem_limit",
                            "id": "#main/platanus-b-assemble/mem_limit"
                        },
                        {
                            "source": "#main/num_threads",
                            "id": "#main/platanus-b-assemble/num_threads"
                        },
                        {
                            "source": [
                                "#main/fastp/output_fastq1",
                                "#main/fastp/output_fastq2"
                            ],
                            "id": "#main/platanus-b-assemble/read_files"
                        }
                    ],
                    "out": [
                        "#main/platanus-b-assemble/contig_fa",
                        "#main/platanus-b-assemble/kmer_frq"
                    ],
                    "id": "#main/platanus-b-assemble"
                },
                {
                    "run": "#platanus-b-iterate.cwl",
                    "in": [
                        {
                            "source": [
                                "#main/platanus-b-assemble/contig_fa"
                            ],
                            "linkMerge": "merge_nested",
                            "id": "#main/platanus-b-iterate/contig_files"
                        },
                        {
                            "source": [
                                "#main/fastp/output_fastq1",
                                "#main/fastp/output_fastq2"
                            ],
                            "id": "#main/platanus-b-iterate/inward_pair_file_in_2_file"
                        },
                        {
                            "source": "#main/mem_limit",
                            "id": "#main/platanus-b-iterate/mem_limit"
                        },
                        {
                            "source": "#main/num_threads",
                            "id": "#main/platanus-b-iterate/num_threads"
                        }
                    ],
                    "out": [
                        "#main/platanus-b-iterate/combined_fa"
                    ],
                    "id": "#main/platanus-b-iterate"
                },
                {
                    "run": "#seqkit-stats.cwl",
                    "in": [
                        {
                            "source": "#main/fastq1",
                            "id": "#main/seqkit-stats-fastq1/fastq"
                        }
                    ],
                    "out": [
                        "#main/seqkit-stats-fastq1/result"
                    ],
                    "id": "#main/seqkit-stats-fastq1"
                },
                {
                    "run": "#seqkit-stats.cwl",
                    "in": [
                        {
                            "source": "#main/fastq2",
                            "id": "#main/seqkit-stats-fastq2/fastq"
                        }
                    ],
                    "out": [
                        "#main/seqkit-stats-fastq2/result"
                    ],
                    "id": "#main/seqkit-stats-fastq2"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/fastp/output_fastq1",
                    "id": "#main/fastp_output_fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastp/output_fastq2",
                    "id": "#main/fastp_output_fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastp-fastq1/html",
                    "id": "#main/fastqc-fastp-fastq1_html"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastp-fastq1/result_files",
                    "id": "#main/fastqc-fastp-fastq1_result_files"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastp-fastq2/html",
                    "id": "#main/fastqc-fastp-fastq2_html"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastp-fastq2/result_files",
                    "id": "#main/fastqc-fastp-fastq2_result_files"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastq1/html",
                    "id": "#main/fastqc-fastq1_html"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastq1/result_files",
                    "id": "#main/fastqc-fastq1_result_files"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastq2/html",
                    "id": "#main/fastqc-fastq2_html"
                },
                {
                    "type": "File",
                    "outputSource": "#main/fastqc-fastq2/result_files",
                    "id": "#main/fastqc-fastq2_result_files"
                },
                {
                    "type": "File",
                    "outputSource": "#main/platanus-b-assemble/contig_fa",
                    "id": "#main/platanus-b-assemble_contig_fa"
                },
                {
                    "type": "File",
                    "outputSource": "#main/platanus-b-assemble/kmer_frq",
                    "id": "#main/platanus-b-assemble_kmer_frq"
                },
                {
                    "type": "File",
                    "outputSource": "#main/platanus-b-iterate/combined_fa",
                    "id": "#main/platanus-b-iterate_combined_fa"
                },
                {
                    "type": "File",
                    "outputSource": "#main/seqkit-stats-fastq1/result",
                    "id": "#main/seqkit-stats-fastq1_result"
                },
                {
                    "type": "File",
                    "outputSource": "#main/seqkit-stats-fastq2/result",
                    "id": "#main/seqkit-stats-fastq2_result"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.0"
}
