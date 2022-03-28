{
    "$graph": [
        {
            "class": "CommandLineTool",
            "id": "#TransDecoder-TransDecoder.LongOrfs.cwl",
            "baseCommand": [
                "TransDecoder.LongOrfs"
            ],
            "inputs": [
                {
                    "id": "#TransDecoder-TransDecoder.LongOrfs.cwl/transdecoder/transcripts",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-t"
                    }
                },
                {
                    "id": "#TransDecoder-TransDecoder.LongOrfs.cwl/transdecoder/minimum_protein_length",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-m"
                    }
                }
            ],
            "label": "transdecoder",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/transdecoder:5.5.0--0"
                }
            ],
            "outputs": [
                {
                    "id": "#TransDecoder-TransDecoder.LongOrfs.cwl/transdecoder/output",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "outputBinding": {
                        "glob": "*.transdecoder_dir"
                    }
                },
                {
                    "id": "#TransDecoder-TransDecoder.LongOrfs.cwl/transdecoder/pep",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "*/longest_orfs.pep"
                    }
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#Trinity-aaea.cwl",
            "baseCommand": [
                "/usr/local/bin/trinityrnaseq/util/align_and_estimate_abundance.pl"
            ],
            "inputs": [
                {
                    "id": "#Trinity-aaea.cwl/aaea/thread_count",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--thread_count",
                        "valueFrom": "$(inputs.cpu)"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/left",
                    "type": "File",
                    "inputBinding": {
                        "position": 4,
                        "prefix": "--left"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/right",
                    "type": "File",
                    "inputBinding": {
                        "position": 4,
                        "prefix": "--right"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/est_method",
                    "type": "string",
                    "inputBinding": {
                        "position": 5,
                        "prefix": "--est_method"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/kallisto_add_opts",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--kallisto_add_opts",
                        "valueFrom": "\"-t $(inputs.cpu)\""
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/prep_reference",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 7,
                        "prefix": "--prep_reference"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/output_dir",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--output_dir"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/seqType",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--seqType"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/transcripts",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--transcripts"
                    }
                },
                {
                    "id": "#Trinity-aaea.cwl/aaea/cpu",
                    "type": "int"
                }
            ],
            "outputs": [
                {
                    "id": "#Trinity-aaea.cwl/aaea/output",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.output_dir)"
                    }
                }
            ],
            "label": "aaea",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "trinityrnaseq/trinityrnaseq:2.8.5"
                },
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.transcripts)"
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "Trinity"
            ],
            "inputs": [
                {
                    "id": "#Trinity-pe.cwl/cpu",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 5,
                        "prefix": "--CPU"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/fq1",
                    "type": "File",
                    "inputBinding": {
                        "position": 3,
                        "prefix": "--left",
                        "valueFrom": "$(self.basename)"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/fq2",
                    "type": "File",
                    "inputBinding": {
                        "position": 4,
                        "prefix": "--right",
                        "valueFrom": "$(self.basename)"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/max_memory",
                    "type": "string",
                    "inputBinding": {
                        "position": 2,
                        "prefix": "--max_memory"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/min_contig_length",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 7,
                        "prefix": "--min_contig_length"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/no_bowtie",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 8,
                        "prefix": "--no_bowtie"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/output_dir",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 9,
                        "prefix": "--output"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/seq_type",
                    "type": "string",
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--seqType"
                    }
                },
                {
                    "id": "#Trinity-pe.cwl/ss_lib_type",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--SS_lib_type"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#Trinity-pe.cwl/trinity_results",
                    "type": "File",
                    "outputBinding": {
                        "glob": "*/Trinity.fasta"
                    }
                }
            ],
            "doc": "test files : https://github.com/trinityrnaseq/trinityrnaseq/tree/devel/sample_data/test_Trinity_Assembly",
            "label": "Trinity",
            "requirements": [
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.fq1)"
                        },
                        {
                            "entry": "$(inputs.fq2)"
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "trinityrnaseq/trinityrnaseq:2.8.5"
                }
            ],
            "id": "#Trinity-pe.cwl"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "blastdbcmd"
            ],
            "inputs": [
                {
                    "id": "#blast-blastdbcmd.cwl/blastdb_dir",
                    "type": "Directory"
                },
                {
                    "id": "#blast-blastdbcmd.cwl/db_flag",
                    "type": "string",
                    "inputBinding": {
                        "position": 3,
                        "prefix": "-db"
                    }
                },
                {
                    "id": "#blast-blastdbcmd.cwl/entry_batch_flag",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 2,
                        "prefix": "-entry_batch"
                    }
                },
                {
                    "id": "#blast-blastdbcmd.cwl/entry_flag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "-entry"
                    }
                },
                {
                    "default": "blastdbcmd.out",
                    "id": "#blast-blastdbcmd.cwl/out_flag",
                    "type": "string",
                    "inputBinding": {
                        "position": 5,
                        "prefix": "-out"
                    }
                },
                {
                    "id": "#blast-blastdbcmd.cwl/outfmt_flag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "-outfmt"
                    }
                },
                {
                    "id": "#blast-blastdbcmd.cwl/target_flag",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 4,
                        "prefix": "-target_only"
                    }
                },
                {
                    "id": "#blast-blastdbcmd.cwl/taxids_flag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 4,
                        "prefix": "-taxids"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#blast-blastdbcmd.cwl/blastdbcmd_results",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.out_flag)"
                    }
                }
            ],
            "label": "Blastdbcmd to dump seqs/info.",
            "requirements": [
                {
                    "class": "EnvVarRequirement",
                    "envDef": [
                        {
                            "envName": "BLASTDB",
                            "envValue": "$(inputs.blastdb_dir.path)"
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/blast:2.9.0--pl526h979a64d_3"
                }
            ],
            "id": "#blast-blastdbcmd.cwl",
            "https://www.sevenbridges.com/links": [
                {
                    "id": "#blastdbcmd_docker.cwl",
                    "label": ""
                }
            ],
            "https://www.sevenbridges.com/toolAuthor": "ncbi tom6931"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "blastp"
            ],
            "inputs": [
                {
                    "id": "#blast-blastp.cwl/blastdb_dir",
                    "type": [
                        "null",
                        "Directory"
                    ]
                },
                {
                    "id": "#blast-blastp.cwl/db_flag",
                    "type": "string",
                    "inputBinding": {
                        "position": 2,
                        "prefix": "-db"
                    }
                },
                {
                    "default": 4,
                    "id": "#blast-blastp.cwl/num_threads_flag",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 3,
                        "prefix": "-num_threads"
                    }
                },
                {
                    "default": "blastp.out",
                    "id": "#blast-blastp.cwl/out_flag",
                    "type": "string",
                    "inputBinding": {
                        "position": 6,
                        "prefix": "-out"
                    }
                },
                {
                    "default": "6 qaccver saccver bitscore pident qcovhsp qlen length",
                    "id": "#blast-blastp.cwl/outfmt_flag",
                    "type": "string",
                    "inputBinding": {
                        "position": 7,
                        "prefix": "-outfmt"
                    }
                },
                {
                    "id": "#blast-blastp.cwl/query_flag",
                    "type": "File",
                    "inputBinding": {
                        "position": 1,
                        "prefix": "-query"
                    }
                },
                {
                    "default": "blastp",
                    "id": "#blast-blastp.cwl/task_flag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 4,
                        "prefix": "-task"
                    }
                },
                {
                    "id": "#blast-blastp.cwl/taxid_flag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 5,
                        "prefix": "-taxids"
                    }
                },
                {
                    "id": "#blast-blastp.cwl/max_target_seqs",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "-max_target_seqs"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#blast-blastp.cwl/blast_results",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.out_flag)"
                    }
                }
            ],
            "label": "BLASTP search.",
            "requirements": [
                {
                    "class": "EnvVarRequirement",
                    "envDef": [
                        {
                            "envName": "BLASTDB",
                            "envValue": "$(inputs.blastdb_dir.path)"
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/blast:2.9.0--pl526h979a64d_3"
                }
            ],
            "id": "#blast-blastp.cwl"
        },
        {
            "class": "CommandLineTool",
            "id": "#blast-makeblastdb.cwl",
            "baseCommand": [
                "bash",
                "blast-makeblastdb.sh"
            ],
            "inputs": [
                {
                    "id": "#blast-makeblastdb.cwl/makeblastdb/input_pep",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                },
                {
                    "id": "#blast-makeblastdb.cwl/makeblastdb/out",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#blast-makeblastdb.cwl/makeblastdb/db_dir",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "outputBinding": {
                        "glob": "blastdb_$(inputs.out)"
                    }
                }
            ],
            "label": "makeblastdb",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/blast-makeblastdb:1.0.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#extract_transcript_id.cwl",
            "baseCommand": [
                "bash",
                "extract_transcript_id.sh"
            ],
            "inputs": [
                {
                    "id": "#extract_transcript_id.cwl/extract_transcript_id/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                },
                {
                    "id": "#extract_transcript_id.cwl/extract_transcript_id/output",
                    "type": "string"
                }
            ],
            "outputs": [
                {
                    "id": "#extract_transcript_id.cwl/extract_transcript_id/out",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.output)"
                    }
                }
            ],
            "label": "extract_transcript_id",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/extract_transcript_id:1.0.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "stdout": "$(inputs.output)"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "fasterq-dump"
            ],
            "inputs": [
                {
                    "id": "#fasterq-dump.cwl/bases",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--bases"
                    },
                    "label": "filter by bases"
                },
                {
                    "id": "#fasterq-dump.cwl/bufsize",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--bufsize"
                    },
                    "label": "size of file-buffer dflt=1MB"
                },
                {
                    "id": "#fasterq-dump.cwl/concatenate_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--concatenate-reads"
                    },
                    "label": "writes whole spots into one file"
                },
                {
                    "id": "#fasterq-dump.cwl/curcache",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--curcache"
                    },
                    "label": "size of cursor-cache dflt=10MB"
                },
                {
                    "id": "#fasterq-dump.cwl/details",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--details"
                    },
                    "label": "print details"
                },
                {
                    "id": "#fasterq-dump.cwl/force_overwrite",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--force"
                    },
                    "label": "force to overwrite existing file(s)"
                },
                {
                    "id": "#fasterq-dump.cwl/include_technical",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--include-technical"
                    },
                    "label": "include technical reads"
                },
                {
                    "id": "#fasterq-dump.cwl/log_level",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--log-level <level>"
                    },
                    "label": "Logging level as number or enum string. One of (fatal|sys|int|err|warn|info|debug) or (0-6) Current/default is warn"
                },
                {
                    "id": "#fasterq-dump.cwl/mem",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--mem"
                    },
                    "label": "memory limit for sorting dflt=100MB"
                },
                {
                    "id": "#fasterq-dump.cwl/min_read_len",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--min-read-len"
                    },
                    "label": "filter by sequence-len"
                },
                {
                    "id": "#fasterq-dump.cwl/nthreads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--threads"
                    },
                    "label": "how many thread dflt=6"
                },
                {
                    "id": "#fasterq-dump.cwl/option_file",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--option-file <file>"
                    },
                    "label": "Read more options and parameters from the file."
                },
                {
                    "id": "#fasterq-dump.cwl/outfile",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outfile"
                    },
                    "label": "output-file"
                },
                {
                    "id": "#fasterq-dump.cwl/print_help",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--help"
                    },
                    "label": "Output brief explanation for the program."
                },
                {
                    "id": "#fasterq-dump.cwl/print_read_nr",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--print-read-nr"
                    },
                    "label": "print read-numbers"
                },
                {
                    "id": "#fasterq-dump.cwl/print_stdout",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--stdout"
                    },
                    "label": "print output to stdout"
                },
                {
                    "id": "#fasterq-dump.cwl/print_version",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--version"
                    },
                    "label": "Display the version of the program then quit."
                },
                {
                    "id": "#fasterq-dump.cwl/progress",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--progress"
                    },
                    "label": "show progress"
                },
                {
                    "id": "#fasterq-dump.cwl/quiet",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--quiet"
                    },
                    "label": "Turn off all status messages for the program. Negated by verbose."
                },
                {
                    "id": "#fasterq-dump.cwl/rowid_as_name",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--rowid-as-name"
                    },
                    "label": "use row-id as name"
                },
                {
                    "default": true,
                    "id": "#fasterq-dump.cwl/skip_technical",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--skip-technical"
                    },
                    "label": "skip technical reads"
                },
                {
                    "id": "#fasterq-dump.cwl/split_3",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--split-3"
                    },
                    "label": "writes single reads in special file"
                },
                {
                    "default": true,
                    "id": "#fasterq-dump.cwl/split_files",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--split-files"
                    },
                    "label": "write reads into different files"
                },
                {
                    "default": true,
                    "id": "#fasterq-dump.cwl/split_spot",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--split-spot"
                    },
                    "label": "split spots into reads"
                },
                {
                    "id": "#fasterq-dump.cwl/runid",
                    "type": "string",
                    "inputBinding": {
                        "position": -1
                    },
                    "label": "SRR run id to dump to fastq"
                },
                {
                    "id": "#fasterq-dump.cwl/strict",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--strict"
                    },
                    "label": "terminate on invalid read"
                },
                {
                    "id": "#fasterq-dump.cwl/table",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--table"
                    },
                    "label": "which seq-table to use in case of pacbio"
                },
                {
                    "id": "#fasterq-dump.cwl/temp",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--temp"
                    },
                    "label": "where to put temp. files dflt=curr dir"
                },
                {
                    "id": "#fasterq-dump.cwl/verbose",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--verbose"
                    },
                    "label": "Increase the verbosity of the program status messages. Use multiple times for more verbosity. Negates quiet."
                }
            ],
            "outputs": [
                {
                    "id": "#fasterq-dump.cwl/fastqFiles",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputBinding": {
                        "glob": "*fastq*"
                    }
                },
                {
                    "id": "#fasterq-dump.cwl/forward",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "*_1.fastq*"
                    }
                },
                {
                    "id": "#fasterq-dump.cwl/reverse",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "*_2.fastq*"
                    }
                }
            ],
            "doc": "sra-toolkit: https://github.com/ncbi/sra-tools/wiki/Download-On-Demand",
            "label": "fasterq-dump: dump .sra format file to generate fastq file",
            "arguments": [
                {
                    "position": 0
                }
            ],
            "hints": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/inutano/sra-toolkit:v2.9.2"
                }
            ],
            "id": "#fasterq-dump.cwl",
            "https://www.sevenbridges.com/toolAuthor": "inutano"
        },
        {
            "class": "CommandLineTool",
            "id": "#for_trinity.cwl",
            "baseCommand": [
                "for_trinity.sh"
            ],
            "inputs": [
                {
                    "id": "#for_trinity.cwl/for_trinity/IN1",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                },
                {
                    "id": "#for_trinity.cwl/for_trinity/IN2",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#for_trinity.cwl/for_trinity/output1",
                    "type": "File",
                    "outputBinding": {
                        "glob": "*_1.fq.gz"
                    }
                },
                {
                    "id": "#for_trinity.cwl/for_trinity/output2",
                    "type": "File",
                    "outputBinding": {
                        "glob": "*_2.fq.gz"
                    }
                }
            ],
            "label": "for_trinity",
            "arguments": [
                {
                    "position": 0
                }
            ],
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/for_trinity:1.0.0"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "doc": "compression/decompression tool using Lempel-Ziv coding (LZ77)",
            "requirements": [
                {
                    "dockerPull": "alpine:3.9",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "gzip",
                "-c"
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {},
                    "id": "#gzip.cwl/file"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#gzip.cwl/compressed",
                    "outputBinding": {
                        "glob": "$(inputs.file.basename).gz"
                    }
                },
                {
                    "type": "File",
                    "id": "#gzip.cwl/stderr",
                    "outputBinding": {
                        "glob": "gzip-stderr.log"
                    }
                }
            ],
            "stdout": "$(inputs.file.basename).gz",
            "stderr": "gzip-stderr.log",
            "id": "#gzip.cwl"
        },
        {
            "class": "CommandLineTool",
            "id": "#hmmer-hmmsearch.cwl",
            "baseCommand": [
                "hmmsearch"
            ],
            "inputs": [
                {
                    "id": "#hmmer-hmmsearch.cwl/hmmsearch/cpu",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--cpu"
                    }
                },
                {
                    "id": "#hmmer-hmmsearch.cwl/hmmsearch/domtblout",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--domtblout"
                    }
                },
                {
                    "id": "#hmmer-hmmsearch.cwl/hmmsearch/hmm",
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    }
                },
                {
                    "id": "#hmmer-hmmsearch.cwl/hmmsearch/pep",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 2
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#hmmer-hmmsearch.cwl/hmmsearch/output",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.domtblout)"
                    }
                }
            ],
            "label": "hmmsearch",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/hmmer:3.2.1--hf484d3e_1"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "stdout": "$(inputs.pep.nameroot).$(inputs.hmm.nameroot).log"
        },
        {
            "class": "CommandLineTool",
            "id": "#trim_galore-pe.cwl",
            "baseCommand": [
                "trim_galore"
            ],
            "inputs": [
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/read1",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                },
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/read2",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                },
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/fastqc",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": -2,
                        "prefix": "--fastqc"
                    }
                },
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/trim1",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": -1,
                        "prefix": "--trim1"
                    }
                },
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/paired",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--paired"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/out1",
                    "type": "File",
                    "outputBinding": {
                        "glob": "*_1_val_1.fq*"
                    }
                },
                {
                    "id": "#trim_galore-pe.cwl/trim_galore/out2",
                    "type": "File",
                    "outputBinding": {
                        "glob": "*_2_val_2.fq*"
                    }
                }
            ],
            "label": "trim_galore",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "miasteinberg/trim-galore"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "doc": "The non-interactive network downloader",
            "requirements": [
                {
                    "dockerPull": "alpine:3.9",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": "wget",
            "inputs": [
                {
                    "doc": "Output file name (use `wget-stdout.txt` by default)",
                    "type": "string",
                    "default": "wget-stdout.txt",
                    "inputBinding": {
                        "prefix": "--output-document=",
                        "separate": false,
                        "valueFrom": "$(inputs.use_remote_name ? inputs.url.split('/').pop() : self)"
                    },
                    "id": "#wget.cwl/output_name"
                },
                {
                    "doc": "Download target URL",
                    "type": "string",
                    "inputBinding": {},
                    "id": "#wget.cwl/url"
                },
                {
                    "doc": "Use the basename of `url` parameter as an output file name. It is equivalent to `curl -O`.",
                    "type": "boolean",
                    "default": false,
                    "id": "#wget.cwl/use_remote_name"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.use_remote_name ? inputs.url.split('/').pop() : inputs.output_name)"
                    },
                    "id": "#wget.cwl/downloaded"
                },
                {
                    "type": "File",
                    "id": "#wget.cwl/stderr",
                    "outputBinding": {
                        "glob": "wget-stderr.log"
                    }
                }
            ],
            "stderr": "wget-stderr.log",
            "id": "#wget.cwl"
        },
        {
            "class": "Workflow",
            "id": "#main",
            "label": "transcriptome_assemble",
            "inputs": [
                {
                    "id": "#main/split_spot",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#main/split_files",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#main/split_3",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#main/skip_technical",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#main/runid",
                    "type": "string"
                },
                {
                    "id": "#main/output_name",
                    "type": "string"
                },
                {
                    "id": "#main/url",
                    "type": "string"
                },
                {
                    "id": "#main/minimum_protein_length",
                    "type": "int"
                },
                {
                    "id": "#main/domtblout",
                    "type": "string"
                },
                {
                    "id": "#main/output_1",
                    "type": "string"
                },
                {
                    "id": "#main/cpu",
                    "type": "int"
                },
                {
                    "id": "#main/out_flag_1",
                    "type": "string"
                },
                {
                    "id": "#main/outfmt_flag",
                    "type": "string"
                },
                {
                    "id": "#main/max_target_seqs",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#main/db_flag_1",
                    "type": "string"
                },
                {
                    "id": "#main/url_1",
                    "type": "string"
                },
                {
                    "id": "#main/output_name_1",
                    "type": "string"
                },
                {
                    "id": "#main/max_memory",
                    "type": "string"
                },
                {
                    "id": "#main/seq_type",
                    "type": "string"
                },
                {
                    "id": "#main/est_method",
                    "type": "string"
                },
                {
                    "id": "#main/output_dir",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#main/seqType",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#main/db_flag",
                    "type": "string"
                },
                {
                    "id": "#main/out_flag",
                    "type": "string"
                }
            ],
            "outputs": [
                {
                    "id": "#main/output2",
                    "outputSource": [
                        "#main/for_trinity/output2"
                    ],
                    "type": "File"
                },
                {
                    "id": "#main/output1",
                    "outputSource": [
                        "#main/for_trinity/output1"
                    ],
                    "type": "File"
                },
                {
                    "id": "#main/output",
                    "outputSource": [
                        "#main/transdecoder/output"
                    ],
                    "type": [
                        "null",
                        "Directory"
                    ]
                },
                {
                    "id": "#main/out",
                    "outputSource": [
                        "#main/extract_transcript_id/out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#main/reverse",
                    "outputSource": [
                        "#main/fasterq_dump/reverse"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#main/forward",
                    "outputSource": [
                        "#main/fasterq_dump/forward"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#main/blast_results",
                    "outputSource": [
                        "#main/blastp/blast_results"
                    ],
                    "type": "File"
                },
                {
                    "id": "#main/output_2",
                    "outputSource": [
                        "#main/aaea/output"
                    ],
                    "type": [
                        "null",
                        "Directory"
                    ]
                },
                {
                    "id": "#main/trinity_results",
                    "outputSource": [
                        "#main/trinity_pe/trinity_results"
                    ],
                    "type": "File"
                },
                {
                    "id": "#main/blastdbcmd_results",
                    "outputSource": [
                        "#main/blastdbcmd/blastdbcmd_results"
                    ],
                    "type": "File"
                },
                {
                    "id": "#main/db_dir",
                    "outputSource": [
                        "#main/makeblastdb/db_dir"
                    ],
                    "type": [
                        "null",
                        "Directory"
                    ]
                },
                {
                    "id": "#main/db_dir_1",
                    "outputSource": [
                        "#main/makeblastdb_1/db_dir"
                    ],
                    "type": [
                        "null",
                        "Directory"
                    ]
                },
                {
                    "id": "#main/pep",
                    "outputSource": [
                        "#main/transdecoder/pep"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                }
            ],
            "steps": [
                {
                    "id": "#main/for_trinity",
                    "in": [
                        {
                            "id": "#main/for_trinity/IN1",
                            "source": "#main/trim_galore/out1"
                        },
                        {
                            "id": "#main/for_trinity/IN2",
                            "source": "#main/trim_galore/out2"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/for_trinity/output1"
                        },
                        {
                            "id": "#main/for_trinity/output2"
                        }
                    ],
                    "run": "#for_trinity.cwl",
                    "label": "for_trinity"
                },
                {
                    "id": "#main/fasterq_dump",
                    "in": [
                        {
                            "id": "#main/fasterq_dump/skip_technical",
                            "source": "#main/skip_technical"
                        },
                        {
                            "id": "#main/fasterq_dump/split_3",
                            "source": "#main/split_3"
                        },
                        {
                            "id": "#main/fasterq_dump/split_files",
                            "source": "#main/split_files"
                        },
                        {
                            "id": "#main/fasterq_dump/split_spot",
                            "source": "#main/split_spot"
                        },
                        {
                            "id": "#main/fasterq_dump/runid",
                            "source": "#main/runid"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/fasterq_dump/fastqFiles"
                        },
                        {
                            "id": "#main/fasterq_dump/forward"
                        },
                        {
                            "id": "#main/fasterq_dump/reverse"
                        }
                    ],
                    "run": "#fasterq-dump.cwl",
                    "label": "fasterq-dump: dump .sra format file to generate fastq file"
                },
                {
                    "id": "#main/transdecoder",
                    "in": [
                        {
                            "id": "#main/transdecoder/transcripts",
                            "source": "#main/trinity_pe/trinity_results"
                        },
                        {
                            "id": "#main/transdecoder/minimum_protein_length",
                            "source": "#main/minimum_protein_length"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/transdecoder/output"
                        },
                        {
                            "id": "#main/transdecoder/pep"
                        }
                    ],
                    "run": "#TransDecoder-TransDecoder.LongOrfs.cwl",
                    "label": "transdecoder"
                },
                {
                    "id": "#main/wget-Sod_Cu-hmm",
                    "in": [
                        {
                            "id": "#main/wget-Sod_Cu-hmm/output_name",
                            "source": "#main/output_name"
                        },
                        {
                            "id": "#main/wget-Sod_Cu-hmm/url",
                            "source": "#main/url"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/wget-Sod_Cu-hmm/downloaded"
                        },
                        {
                            "id": "#main/wget-Sod_Cu-hmm/stderr"
                        }
                    ],
                    "run": "#wget.cwl",
                    "label": "wget:Sod_Cu.hmm"
                },
                {
                    "id": "#main/gzip",
                    "in": [
                        {
                            "id": "#main/gzip/file",
                            "source": "#main/fasterq_dump/reverse"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/gzip/compressed"
                        },
                        {
                            "id": "#main/gzip/stderr"
                        }
                    ],
                    "run": "#gzip.cwl"
                },
                {
                    "id": "#main/gzip_1",
                    "in": [
                        {
                            "id": "#main/gzip_1/file",
                            "source": "#main/fasterq_dump/forward"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/gzip_1/compressed"
                        },
                        {
                            "id": "#main/gzip_1/stderr"
                        }
                    ],
                    "run": "#gzip.cwl"
                },
                {
                    "id": "#main/trim_galore",
                    "in": [
                        {
                            "id": "#main/trim_galore/read1",
                            "source": "#main/gzip_1/compressed"
                        },
                        {
                            "id": "#main/trim_galore/read2",
                            "source": "#main/gzip/compressed"
                        },
                        {
                            "id": "#main/trim_galore/fastqc",
                            "default": true
                        },
                        {
                            "id": "#main/trim_galore/trim1",
                            "default": true
                        },
                        {
                            "id": "#main/trim_galore/paired",
                            "default": true
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/trim_galore/out1"
                        },
                        {
                            "id": "#main/trim_galore/out2"
                        }
                    ],
                    "run": "#trim_galore-pe.cwl",
                    "label": "trim_galore"
                },
                {
                    "id": "#main/hmmsearch",
                    "in": [
                        {
                            "id": "#main/hmmsearch/cpu",
                            "source": "#main/cpu"
                        },
                        {
                            "id": "#main/hmmsearch/domtblout",
                            "source": "#main/domtblout"
                        },
                        {
                            "id": "#main/hmmsearch/hmm",
                            "source": "#main/wget-Sod_Cu-hmm/downloaded"
                        },
                        {
                            "id": "#main/hmmsearch/pep",
                            "source": "#main/transdecoder/pep"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/hmmsearch/output"
                        }
                    ],
                    "run": "#hmmer-hmmsearch.cwl",
                    "label": "hmmsearch"
                },
                {
                    "id": "#main/extract_transcript_id",
                    "in": [
                        {
                            "id": "#main/extract_transcript_id/input",
                            "source": "#main/hmmsearch/output"
                        },
                        {
                            "id": "#main/extract_transcript_id/output",
                            "source": "#main/output_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/extract_transcript_id/out"
                        }
                    ],
                    "run": "#extract_transcript_id.cwl",
                    "label": "extract_transcript_id"
                },
                {
                    "id": "#main/wget-uniprot-taxonomy_50557-fasta",
                    "in": [
                        {
                            "id": "#main/wget-uniprot-taxonomy_50557-fasta/output_name",
                            "default": "uniprot-taxonomy_50557.fasta",
                            "source": "#main/output_name_1"
                        },
                        {
                            "id": "#main/wget-uniprot-taxonomy_50557-fasta/url",
                            "default": "https://www.uniprot.org/uniprot/?query=taxonomy:50557&format=fasta",
                            "source": "#main/url_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/wget-uniprot-taxonomy_50557-fasta/downloaded"
                        },
                        {
                            "id": "#main/wget-uniprot-taxonomy_50557-fasta/stderr"
                        }
                    ],
                    "run": "#wget.cwl",
                    "label": "wget:uniprot-taxonomy_50557.fasta"
                },
                {
                    "id": "#main/makeblastdb_1",
                    "in": [
                        {
                            "id": "#main/makeblastdb_1/input_pep",
                            "source": "#main/wget-uniprot-taxonomy_50557-fasta/downloaded"
                        },
                        {
                            "id": "#main/makeblastdb_1/out",
                            "default": "uniprot_insect"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/makeblastdb_1/db_dir"
                        }
                    ],
                    "run": "#blast-makeblastdb.cwl",
                    "label": "makeblastdb"
                },
                {
                    "id": "#main/blastp",
                    "in": [
                        {
                            "id": "#main/blastp/blastdb_dir",
                            "source": "#main/makeblastdb_1/db_dir"
                        },
                        {
                            "id": "#main/blastp/db_flag",
                            "source": "#main/db_flag_1"
                        },
                        {
                            "id": "#main/blastp/num_threads_flag",
                            "source": "#main/cpu"
                        },
                        {
                            "id": "#main/blastp/out_flag",
                            "default": "uniprot_insect",
                            "source": "#main/out_flag_1"
                        },
                        {
                            "id": "#main/blastp/outfmt_flag",
                            "source": "#main/outfmt_flag"
                        },
                        {
                            "id": "#main/blastp/query_flag",
                            "source": "#main/blastdbcmd/blastdbcmd_results"
                        },
                        {
                            "id": "#main/blastp/max_target_seqs",
                            "source": "#main/max_target_seqs"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/blastp/blast_results"
                        }
                    ],
                    "run": "#blast-blastp.cwl",
                    "label": "BLASTP search."
                },
                {
                    "id": "#main/trinity_pe",
                    "in": [
                        {
                            "id": "#main/trinity_pe/cpu",
                            "source": "#main/cpu"
                        },
                        {
                            "id": "#main/trinity_pe/fq1",
                            "source": "#main/for_trinity/output1"
                        },
                        {
                            "id": "#main/trinity_pe/fq2",
                            "source": "#main/for_trinity/output2"
                        },
                        {
                            "id": "#main/trinity_pe/max_memory",
                            "source": "#main/max_memory"
                        },
                        {
                            "id": "#main/trinity_pe/seq_type",
                            "source": "#main/seq_type"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/trinity_pe/trinity_results"
                        }
                    ],
                    "run": "#Trinity-pe.cwl",
                    "label": "Trinity"
                },
                {
                    "id": "#main/aaea",
                    "in": [
                        {
                            "id": "#main/aaea/thread_count",
                            "default": true
                        },
                        {
                            "id": "#main/aaea/left",
                            "source": "#main/for_trinity/output1"
                        },
                        {
                            "id": "#main/aaea/right",
                            "source": "#main/for_trinity/output2"
                        },
                        {
                            "id": "#main/aaea/est_method",
                            "default": "kallisto",
                            "source": "#main/est_method"
                        },
                        {
                            "id": "#main/aaea/kallisto_add_opts",
                            "default": true
                        },
                        {
                            "id": "#main/aaea/prep_reference",
                            "default": true
                        },
                        {
                            "id": "#main/aaea/output_dir",
                            "source": "#main/output_dir"
                        },
                        {
                            "id": "#main/aaea/seqType",
                            "source": "#main/seqType"
                        },
                        {
                            "id": "#main/aaea/transcripts",
                            "source": "#main/trinity_pe/trinity_results"
                        },
                        {
                            "id": "#main/aaea/cpu",
                            "source": "#main/cpu"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/aaea/output"
                        }
                    ],
                    "run": "#Trinity-aaea.cwl",
                    "label": "align_and_estimate_abundance.pl"
                },
                {
                    "id": "#main/makeblastdb",
                    "in": [
                        {
                            "id": "#main/makeblastdb/input_pep",
                            "source": "#main/transdecoder/pep"
                        },
                        {
                            "id": "#main/makeblastdb/out",
                            "default": "trinity_rslt"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/makeblastdb/db_dir"
                        }
                    ],
                    "run": "#blast-makeblastdb.cwl",
                    "label": "makeblastdb"
                },
                {
                    "id": "#main/blastdbcmd",
                    "in": [
                        {
                            "id": "#main/blastdbcmd/blastdb_dir",
                            "source": "#main/makeblastdb/db_dir"
                        },
                        {
                            "id": "#main/blastdbcmd/db_flag",
                            "source": "#main/db_flag"
                        },
                        {
                            "id": "#main/blastdbcmd/entry_batch_flag",
                            "source": "#main/extract_transcript_id/out"
                        },
                        {
                            "id": "#main/blastdbcmd/out_flag",
                            "source": "#main/out_flag"
                        }
                    ],
                    "out": [
                        {
                            "id": "#main/blastdbcmd/blastdbcmd_results"
                        }
                    ],
                    "run": "#blast-blastdbcmd.cwl",
                    "label": "Blastdbcmd to dump seqs/info."
                }
            ],
            "requirements": []
        }
    ],
    "cwlVersion": "v1.0"
}
