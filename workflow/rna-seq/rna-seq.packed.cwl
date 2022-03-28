{
    "$graph": [
        {
            "class": "CommandLineTool",
            "id": "#deseq2.cwl",
            "baseCommand": [
                "Rscript",
                "/workdir/deseq2.R"
            ],
            "inputs": [
                {
                    "id": "#deseq2.cwl/deseq2/sample2condition.txt",
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    }
                },
                {
                    "id": "#deseq2.cwl/deseq2/target2gene.txt",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 2
                    }
                },
                {
                    "id": "#deseq2.cwl/deseq2/rsem_out",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "position": 3
                    }
                }
            ],
            "label": "deseq2",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/deseq2:1.0.0"
                },
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.rsem_out)",
                            "writable": true
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ],
            "outputs": [
                {
                    "id": "#deseq2.cwl/deseq2/output",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "output"
                    }
                }
            ]
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
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
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
            "doc": "decompression tool using Lempel-Ziv coding (LZ77)",
            "requirements": [
                {
                    "dockerPull": "alpine:3.9",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "gunzip",
                "--stdout"
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {},
                    "id": "#gunzip.cwl/file"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#gunzip.cwl/decompressed",
                    "outputBinding": {
                        "glob": "$(inputs.file.nameroot)"
                    }
                },
                {
                    "type": "File",
                    "id": "#gunzip.cwl/stderr",
                    "outputBinding": {
                        "glob": "gunzip-stderr.log"
                    }
                }
            ],
            "stdout": "$(inputs.file.nameroot)",
            "stderr": "gunzip-stderr.log",
            "id": "#gunzip.cwl",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "kallisto",
                "index"
            ],
            "inputs": [
                {
                    "id": "#kallisto_index.cwl/fasta_files",
                    "type": "File",
                    "inputBinding": {
                        "position": 10
                    },
                    "label": "The Fasta file supplied can be either in plaintext or gzipped format",
                    "doc": "The Fasta file supplied can be either in plaintext or gzipped format"
                },
                {
                    "id": "#kallisto_index.cwl/index_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "label": "Filename for the kallisto index to be constructed",
                    "doc": "Filename for the kallisto index to be constructed"
                },
                {
                    "default": 31,
                    "id": "#kallisto_index.cwl/kmer_size",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-k"
                    },
                    "label": "k-mer (odd) length (default: 31, max value: 31)",
                    "doc": "k-mer (odd) length (default: 31, max value: 31)"
                },
                {
                    "default": true,
                    "id": "#kallisto_index.cwl/make_unique",
                    "type": "boolean",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--make-unique"
                    },
                    "label": "Replace repeated target names with unique names",
                    "doc": "Replace repeated target names with unique names"
                }
            ],
            "outputs": [
                {
                    "id": "#kallisto_index.cwl/index_file",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.index_name)"
                    }
                }
            ],
            "doc": "kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. https://pachterlab.github.io/kallisto/manual.html#index",
            "label": "kallisto index: builds an index from a FASTA formatted file of target sequences",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "-i",
                    "valueFrom": "$(runtime.outdir)/$(inputs.index_name)"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/kallisto:0.44.0--h7d86c95_2"
                }
            ],
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "id": "#kallisto_index.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "kallisto",
                "quant"
            ],
            "inputs": [
                {
                    "id": "#kallisto_quant-pe.cwl/bias",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--bias"
                    },
                    "label": "Perform sequence based bias correction",
                    "doc": "Perform sequence based bias correction"
                },
                {
                    "default": 0,
                    "id": "#kallisto_quant-pe.cwl/bootstrap_samples",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--bootstrap-samples=",
                        "separate": false
                    },
                    "label": "Number of bootstrap samples",
                    "doc": "Number of bootstrap samples (default: 0)"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/chromosome",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--chromosome"
                    },
                    "label": "Tab separated file with chrosome names and lengths",
                    "doc": "Tab separated file with chrosome names and lengths (optional for --genomebam, but recommended)"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/fq1",
                    "type": "File",
                    "inputBinding": {
                        "position": 50
                    },
                    "label": "Input forward FASTQ file",
                    "doc": "Input FASTQ file"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/fq2",
                    "type": "File",
                    "inputBinding": {
                        "position": 60
                    },
                    "label": "Input reverse FASTQ file",
                    "doc": "Input FASTQ file"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/fr_stranded",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--fr-stranded"
                    },
                    "label": "Strand specific reads, first read forward",
                    "doc": "Strand specific reads, first read forward"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/fragment_length",
                    "type": [
                        "null",
                        "double"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--fragment-length=",
                        "separate": false
                    },
                    "label": "Estimated average fragment length",
                    "doc": "Estimated average fragment length"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/fusion",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--fusion"
                    },
                    "label": "Search for fusions for Pizzly",
                    "doc": "Search for fusions for Pizzly"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/genome_bam",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--genomebam"
                    },
                    "label": "Project pseudoalignments to genome sorted BAM file",
                    "doc": "Project pseudoalignments to genome sorted BAM file"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/gtf",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--gtf"
                    },
                    "label": "GTF file for transcriptome information",
                    "doc": "GTF file for transcriptome information (required for --genomebam)"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/index_file",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-i"
                    },
                    "label": "[Required] Filename for the kallisto index",
                    "doc": "Filename for the kallisto index to be used for quantification"
                },
                {
                    "default": 1,
                    "id": "#kallisto_quant-pe.cwl/nthreads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--threads=",
                        "separate": false
                    },
                    "label": "Number of threads",
                    "doc": "Number of threads to use (default: 1)"
                },
                {
                    "default": "kallisto_quant",
                    "id": "#kallisto_quant-pe.cwl/out_dir_name",
                    "type": "string",
                    "label": "Name of the directory to write output to",
                    "doc": "Name of the directory to write output to (default: kallisto_quant)"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/plain_text",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--plaintext"
                    },
                    "label": "Output plaintext instead of HDF5",
                    "doc": "Output plaintext instead of HDF5"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/pseudo_bam",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--pseudobam"
                    },
                    "label": "Save pseudoalignments to transcriptome to BAM file",
                    "doc": "Save pseudoalignments to transcriptome to BAM file"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/rf_stranded",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--rf-stranded"
                    },
                    "label": "Strand specific reads, first read reverse",
                    "doc": "Strand specific reads, first read reverse"
                },
                {
                    "default": 42,
                    "id": "#kallisto_quant-pe.cwl/seed",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--seed=",
                        "separate": false
                    },
                    "label": "Seed for the bootstrap sampling",
                    "doc": "Seed for the bootstrap sampling (default: 42)"
                },
                {
                    "id": "#kallisto_quant-pe.cwl/standard_deviation",
                    "type": [
                        "null",
                        "double"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sd=",
                        "separate": false
                    },
                    "label": "Estimated standard deviation of fragment length",
                    "doc": "Estimated standard deviation of fragment length (default: -l, -s values are estimated from paired end data, but are required when using --single)"
                }
            ],
            "outputs": [
                {
                    "id": "#kallisto_quant-pe.cwl/quant_output",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.out_dir_name)"
                    }
                }
            ],
            "doc": "kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. https://pachterlab.github.io/kallisto/manual.html#quant",
            "label": "kallisto quant: runs the quantification algorithm",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "-o",
                    "valueFrom": "$(runtime.outdir)/$(inputs.out_dir_name)"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/kallisto:0.44.0--h7d86c95_2"
                }
            ],
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "id": "#kallisto_quant-pe.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "id": "#mkdir_rsem.cwl",
            "baseCommand": [
                "bash",
                "mkdir_rsem.sh"
            ],
            "inputs": [],
            "outputs": [
                {
                    "id": "#mkdir_rsem.cwl/mkdir_rsem/RSEM_reference",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "RSEM_reference/"
                    }
                }
            ],
            "label": "mkdir_rsem",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/mkdir_rsem:1.0.0"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#mkdir_star.cwl",
            "baseCommand": [
                "bash",
                "mkdir_star.sh"
            ],
            "inputs": [],
            "outputs": [
                {
                    "id": "#mkdir_star.cwl/mkdir_star/STAR_reference",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "STAR_reference/"
                    }
                }
            ],
            "label": "mkdir_star",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/mkdir_star:1.0.0"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "rsem-calculate-expression",
                "--paired-end"
            ],
            "inputs": [
                {
                    "id": "#rsem_calculate-expression-pe.cwl/nthreads",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--num-threads"
                    },
                    "label": "Number of threads to use",
                    "doc": "Number of threads to use. Both Bowtie/Bowtie2, expression estimation and 'samtools sort' will use this many threads. (Default: 1)"
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/rsem_index_dir",
                    "type": "Directory",
                    "label": "A path to the directory contains RSEM index files",
                    "doc": "A path to the directory contains RSEM index files"
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/rsem_index_prefix",
                    "type": [
                        "null",
                        "string"
                    ],
                    "label": "The name of RSEM index files",
                    "doc": "The name of RSEM index files"
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/rsem_output_prefix",
                    "type": "string",
                    "inputBinding": {
                        "position": 4
                    },
                    "label": "The name of the sample analyzed",
                    "doc": "The name of the sample analyzed. All output files are prefixed by this name (e.g., sample_name.genes.results)"
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/bam",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--bam"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#rsem_calculate-expression-pe.cwl/genes_result",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.rsem_output_prefix+'.genes.results')"
                    }
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/isoforms_result",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.rsem_output_prefix+'.isoforms.results')"
                    }
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/stat",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.rsem_output_prefix+'.stat')"
                    }
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/transcript_bam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.rsem_output_prefix+'.transcript.bam')"
                    }
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/transcript_sorted_bam",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.rsem_output_prefix+'.transcript.sorted.bam')"
                    }
                },
                {
                    "id": "#rsem_calculate-expression-pe.cwl/transcript_sorted_bam_bai",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.rsem_output_prefix+'.transcript.sorted.bam.bai')"
                    }
                }
            ],
            "doc": "RSEM is a software package for estimating gene and isoform expression levels from RNA-Seq data. The RSEM package provides an user-friendly interface, supports threads for parallel computation of the EM algorithm, single-end and paired-end read data, quality scores, variable-length reads and RSPD estimation. In addition, it provides posterior mean and 95% credibility interval estimates for expression levels.  http://deweylab.biostat.wisc.edu/rsem/rsem-calculate-expression.html",
            "label": "rsem-calculate-expression: calculate expression values (BAM input version CWL)",
            "arguments": [
                {
                    "position": 3,
                    "valueFrom": "$(inputs.rsem_index_dir.path)/$(inputs.rsem_index_prefix)"
                }
            ],
            "requirements": [
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.rsem_index_dir.basename)",
                            "writable": true
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/rsem:1.3.0--boost1.64_3"
                }
            ],
            "id": "#rsem_calculate-expression-pe.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "rsem-prepare-reference"
            ],
            "inputs": [
                {
                    "id": "#rsem_index.cwl/gtf",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--gtf"
                    },
                    "label": "extract transcript reference sequences using the gene annotations specified in <file>",
                    "doc": "If this option is on, RSEM assumes that 'reference_fasta_file(s)' contains the sequence of a genome, and will extract transcript reference sequences using the gene annotations specified in <file>, which should be in GTF format."
                },
                {
                    "id": "#rsem_index.cwl/reference_fasta",
                    "type": "File",
                    "inputBinding": {
                        "position": 2
                    },
                    "label": "A path to directory contains reference fasta files",
                    "doc": "Either a comma-separated list of Multi-FASTA formatted files OR a directory name. If a directory name is specified, RSEM will read all files with suffix '.fa' or '.fasta' in this directory. The files should contain either the sequences of transcripts or an entire genome, depending on whether the '--gtf' option is used."
                },
                {
                    "id": "#rsem_index.cwl/num_threads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--num-threads"
                    }
                },
                {
                    "id": "#rsem_index.cwl/reference_dir",
                    "type": [
                        "null",
                        "Directory"
                    ]
                },
                {
                    "id": "#rsem_index.cwl/reference_prefix",
                    "type": "string"
                }
            ],
            "outputs": [
                {
                    "id": "#rsem_index.cwl/rsem_index",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.reference_dir.basename)"
                    }
                }
            ],
            "doc": "RSEM is a software package for estimating gene and isoform expression levels from RNA-Seq data. The RSEM package provides an user-friendly interface, supports threads for parallel computation of the EM algorithm, single-end and paired-end read data, quality scores, variable-length reads and RSPD estimation. In addition, it provides posterior mean and 95% credibility interval estimates for expression levels.  http://deweylab.github.io/RSEM/rsem-prepare-reference.html",
            "label": "rsem-prepare-reference: preparing reference sequences",
            "arguments": [
                {
                    "position": 3,
                    "prefix": "",
                    "separate": false,
                    "valueFrom": "$(inputs.reference_dir.basename)/$(inputs.reference_prefix)"
                }
            ],
            "requirements": [
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.reference_dir)",
                            "writable": true
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/rsem:1.3.0--boost1.64_3"
                }
            ],
            "id": "#rsem_index.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "id": "#sample2condition.cwl",
            "baseCommand": [
                "sample2condition.sh"
            ],
            "inputs": [
                {
                    "id": "#sample2condition.cwl/sample2condition/SraRunTable",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#sample2condition.cwl/sample2condition/output1",
                    "type": "File",
                    "outputBinding": {
                        "glob": "sample2condition.txt"
                    }
                }
            ],
            "label": "sample2condition",
            "arguments": [
                {
                    "position": 0
                }
            ],
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/sample2condition:1.0.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#sample_txt.cwl",
            "baseCommand": [
                "sample_txt.sh"
            ],
            "inputs": [
                {
                    "id": "#sample_txt.cwl/sample_txt/SraRunTable",
                    "type": "File",
                    "inputBinding": {
                        "position": 0
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#sample_txt.cwl/sample_txt/sample.txt",
                    "type": "File",
                    "outputBinding": {
                        "glob": "sample.txt"
                    }
                }
            ],
            "label": "sample_txt",
            "arguments": [
                {
                    "position": 0
                }
            ],
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/sample_txt:1.0.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#sleuth.cwl",
            "label": "sleuth",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/sleuth:1.0.0"
                },
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.kallisto_out)",
                            "writable": true
                        }
                    ]
                }
            ],
            "hints": [
                {
                    "loadListing": "deep_listing",
                    "class": "LoadListingRequirement"
                },
                {
                    "networkAccess": true,
                    "class": "file:///home/ubuntu/git/github.com/pitagora-network/DAT2-cwl/tool/sleuth/NetworkAcess"
                }
            ],
            "inputs": [
                {
                    "id": "#sleuth.cwl/sleuth/sample.txt",
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    }
                },
                {
                    "id": "#sleuth.cwl/sleuth/target2gene.txt",
                    "type": "File",
                    "inputBinding": {
                        "position": 2
                    }
                },
                {
                    "id": "#sleuth.cwl/sleuth/kallisto_out",
                    "type": {
                        "type": "array",
                        "items": "Directory"
                    },
                    "inputBinding": {
                        "position": 3
                    }
                }
            ],
            "baseCommand": [
                "Rscript",
                "/workdir/sleuth.R"
            ],
            "outputs": [
                {
                    "id": "#sleuth.cwl/sleuth/output",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "output"
                    }
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "STAR",
                "--runMode",
                "genomeGenerate"
            ],
            "inputs": [
                {
                    "id": "#star_index.cwl/genomeDir",
                    "type": "Directory",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--genomeDir"
                    }
                },
                {
                    "id": "#star_index.cwl/genomeFastaFiles",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--genomeFastaFiles"
                    }
                },
                {
                    "id": "#star_index.cwl/runThreadN",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--runThreadN"
                    }
                },
                {
                    "id": "#star_index.cwl/sjdbGTFfile",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sjdbGTFfile"
                    }
                },
                {
                    "id": "#star_index.cwl/sjdbOverhang",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sjdbOverhang"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#star_index.cwl/starIndex",
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.genomeDir.basename)"
                    }
                }
            ],
            "doc": "STAR: Spliced Transcripts Alignment to a Reference. https://github.com/alexdobin/STAR/blob/main/doc/STARmanual.pdf",
            "label": "STAR genomeGenerate: Generating genome indexes.",
            "requirements": [
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.genomeDir)",
                            "writable": true
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/star:2.7.1a--0"
                }
            ],
            "id": "#star_index.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "STAR",
                "--runMode",
                "alignReads"
            ],
            "inputs": [
                {
                    "default": 1000000,
                    "id": "#star_mapping-pe.cwl/alignIntronMax",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--alignIntronMax"
                    },
                    "label": "maximum intron size",
                    "doc": "maximum intron size, if 0, max intron size will be determined by (2^winBinNbits)*winAnchorDistNbins"
                },
                {
                    "default": 20,
                    "id": "#star_mapping-pe.cwl/alignIntronMin",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--alignIntronMin"
                    },
                    "label": "minimum intron size",
                    "doc": "minimum intron size: genomic gap is considered intron if its length>=alignIntronMin, otherwise it is considered Deletion"
                },
                {
                    "default": 1000000,
                    "id": "#star_mapping-pe.cwl/alignMatesGapMax",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--alignMatesGapMax"
                    },
                    "label": "maximum gap between two mates",
                    "doc": "maximum gap between two mates, if 0, max intron gap will be determined by (2^winBinNbits)*winAnchorDistNbins"
                },
                {
                    "default": 1,
                    "id": "#star_mapping-pe.cwl/alignSJDBoverhangMin",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--alignSJDBoverhangMin"
                    },
                    "label": "minimum overhang (i.e. block size) for annotated (sjdb) spliced alignments",
                    "doc": "minimum overhang (i.e. block size) for annotated (sjdb) spliced alignments"
                },
                {
                    "default": 8,
                    "id": "#star_mapping-pe.cwl/alignSJoverhangMin",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--alignSJoverhangMin"
                    },
                    "label": "minimum overhang (i.e. block size) for spliced alignments",
                    "doc": "minimum overhang (i.e. block size) for spliced alignments"
                },
                {
                    "id": "#star_mapping-pe.cwl/fq1",
                    "type": "File",
                    "inputBinding": {
                        "position": 50,
                        "prefix": "--readFilesIn"
                    },
                    "label": "path to file that contain input read1",
                    "doc": "path to file that contain input read1"
                },
                {
                    "id": "#star_mapping-pe.cwl/fq2",
                    "type": "File",
                    "inputBinding": {
                        "position": 51
                    },
                    "label": "path to file that contain input read2",
                    "doc": "path to file that contain input read2"
                },
                {
                    "id": "#star_mapping-pe.cwl/genomeDir",
                    "type": "Directory",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--genomeDir"
                    },
                    "label": "path to the directory where genome files are stored",
                    "doc": "path to the directory where genome files are stored"
                },
                {
                    "id": "#star_mapping-pe.cwl/limitBAMsortRAM",
                    "type": [
                        "null",
                        "long"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--limitBAMsortRAM"
                    },
                    "label": "maximum available RAM for sorting BAM",
                    "doc": "maximum available RAM for sorting BAM. If =0, it will be set to the genome index size. 0 value can only be used with \u2013genomeLoad NoSharedMemory option"
                },
                {
                    "id": "#star_mapping-pe.cwl/nthreads",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--runThreadN"
                    },
                    "label": "Number of threads",
                    "doc": "defines the number of threads to be used for genome generation, it has to be set to the number of available cores on the server node."
                },
                {
                    "default": 10,
                    "id": "#star_mapping-pe.cwl/outBAMcompression",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outBAMcompression"
                    },
                    "label": "BAM compression level",
                    "doc": "BAM compression level, -1=default compression (6?), 0=no compression, 10=maximum compression"
                },
                {
                    "default": 999,
                    "id": "#star_mapping-pe.cwl/outFilterMismatchNmax",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outFilterMismatchNmax"
                    },
                    "label": "alignment will be output only if it has no more mismatches than this value",
                    "doc": "alignment will be output only if it has no more mismatches than this value"
                },
                {
                    "default": 0.04,
                    "id": "#star_mapping-pe.cwl/outFilterMismatchNoverReadLmax",
                    "type": "float",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outFilterMismatchNoverReadLmax"
                    },
                    "label": "alignment will be output only if its ratio of mismatches to *read* length is less than or equal to this value.",
                    "doc": "alignment will be output only if its ratio of mismatches to *read* length is less than or equal to this value."
                },
                {
                    "default": 20,
                    "id": "#star_mapping-pe.cwl/outFilterMultimapNmax",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outFilterMultimapNmax"
                    },
                    "label": "maximum number of loci the read is allowed to map to",
                    "doc": "maximum number of loci the read is allowed to map to. Alignments (all of them) will be output only if the read maps to no more loci than this value. Otherwise no alignments will be output, and the read will be counted as \u201dmapped to too many loci\u201d in the Log.final.out ."
                },
                {
                    "default": "BySJout",
                    "id": "#star_mapping-pe.cwl/outFilterType",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outFilterType"
                    },
                    "label": "type of filtering",
                    "doc": "Normal: standard filtering using only current alignment, BySJout: keep only those reads that contain junctions that passed filtering into SJ.out.tab"
                },
                {
                    "default": [
                        "NH",
                        "HI",
                        "AS",
                        "NM",
                        "MD"
                    ],
                    "id": "#star_mapping-pe.cwl/outSAMattributes",
                    "type": {
                        "type": "array",
                        "items": "string"
                    },
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outSAMattributes"
                    },
                    "label": "a string of desired SAM attributes, in the order desired for the output SAM",
                    "doc": "NH: any combination in any order, Standard: NH HI AS nM, All: NH HI AS nM NM MD jM jI ch, None: no attributes"
                },
                {
                    "default": "intronMotif",
                    "id": "#star_mapping-pe.cwl/outSAMstrandField",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outSAMstrandField"
                    },
                    "label": "Cuffinks-like strand field flag",
                    "doc": "Cuffinks-like strand field flag. None: not used, intronMotif: strand derived from the intron motif. Reads with inconsistent and/or non-canonical introns are filtered out."
                },
                {
                    "default": [
                        "BAM",
                        "Unsorted"
                    ],
                    "id": "#star_mapping-pe.cwl/outSAMtype",
                    "type": {
                        "type": "array",
                        "items": "string"
                    },
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--outSAMtype",
                        "shellQuote": false
                    },
                    "label": "type of SAM/BAM output",
                    "doc": "1st word: BAM: output BAM without sorting, SAM: output SAM without sorting, None: no SAM/BAM output, 2nd, 3rd: Unsorted: standard unsorted, SortedByCoordinate: sorted by coordinate. This option will allocate extra memory for sorting which can be specified by -limitBAMsortRAM"
                },
                {
                    "default": "Within",
                    "id": "#star_mapping-pe.cwl/outSAMunmapped",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outSAMunmapped"
                    },
                    "label": "output of unmapped reads in the SAM format",
                    "doc": "1st word: None: no output, Within: output unmapped reads within the main SAM file (i.e. Aligned.out.sam). 2nd word: KeepPairs: record unmapped mate for each alignment, and, in case of unsorted output, keep it adjacent to its mapped mate. Only a\u21b5ects multi-mapping reads."
                },
                {
                    "default": "Unique",
                    "id": "#star_mapping-pe.cwl/outSJfilterReads",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outSJfilterReads"
                    },
                    "label": "which reads to consider for collapsed splice junctions output",
                    "doc": "which reads to consider for collapsed splice junctions output. All: all reads, unique- and multi-mappers, Unique: uniquely mapping reads only."
                },
                {
                    "default": "STAR",
                    "id": "#star_mapping-pe.cwl/output_dir_name",
                    "type": "string",
                    "label": "Name of the directory to write output files in",
                    "doc": "Name of the directory to write output files in"
                },
                {
                    "default": [
                        "TranscriptomeSAM",
                        "GeneCounts"
                    ],
                    "id": "#star_mapping-pe.cwl/quantMode",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--quantMode"
                    },
                    "label": "types of quantification requested",
                    "doc": "types of quantification requested. -: none, TranscriptomeSAM: output SAM/BAM alignments to transcriptome into a separate file, GeneCounts: count reads per gene"
                },
                {
                    "default": 10,
                    "id": "#star_mapping-pe.cwl/quantTranscriptomeBAMcompression",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--quantTranscriptomeBAMcompression"
                    },
                    "label": "transcriptome BAM compression level",
                    "doc": "transcriptome BAM compression level, -1=default compression (6?), 0=no compression, 10=maximum compression"
                },
                {
                    "default": 1,
                    "id": "#star_mapping-pe.cwl/sjdbScore",
                    "type": "int",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sjdbScore"
                    },
                    "label": "extra alignment score for alignmets that cross database junctions",
                    "doc": "extra alignment score for alignmets that cross database junctions"
                },
                {
                    "id": "#star_mapping-pe.cwl/outFileNamePrefix",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--outFileNamePrefix"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/readFilesCommand",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--readFilesCommand"
                    }
                }
            ],
            "outputs": [
                {
                    "id": "#star_mapping-pe.cwl/aligned",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n  if (inputs.outSAMtype == \"BAM Unsorted\")\n    return p+\"Aligned.out.bam\";\n  var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Aligned.sortedByCoord.out.bam\";\n}\n"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/bamRemDups",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n  if (inputs.bamRemoveDuplicatesType != \"UniqueIdentical\")\n    return null;\n  var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Processed.out.bam\";\n}\n"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/mappingstats",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "loadContents": true,
                        "glob": "${\n  var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Log.final.out\";\n}\n"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/readspergene",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n  var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"ReadsPerGene.out.tab\";\n}\n"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/transcriptomesam",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n  var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Aligned.toTranscriptome.out.bam\";\n}\n"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/Log.out",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${   var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\"; return p+\"Log.out\"; }"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/Log.progress.out",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n  var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Log.progress.out\";\n}\n"
                    }
                },
                {
                    "id": "#star_mapping-pe.cwl/SJ.out.tab",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n  var p=inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"SJ.out.tab\";\n}\n"
                    }
                }
            ],
            "doc": "STAR: Spliced Transcripts Alignment to a Reference. https://github.com/alexdobin/STAR/blob/main/doc/STARmanual.pdf",
            "label": "STAR mapping: running mapping jobs.",
            "requirements": [
                {
                    "class": "ShellCommandRequirement"
                },
                {
                    "class": "InitialWorkDirRequirement",
                    "listing": [
                        {
                            "entry": "$(inputs.genomeDir)",
                            "writable": true
                        }
                    ]
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/star:2.7.1a--0"
                }
            ],
            "id": "#star_mapping-pe.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "id": "#target2gene.cwl",
            "baseCommand": [
                "Rscript",
                "/workdir/target2gene.R"
            ],
            "inputs": [],
            "outputs": [
                {
                    "id": "#target2gene.cwl/target2gene/target2gene.txt",
                    "type": "File",
                    "outputBinding": {
                        "glob": "target2gene.txt"
                    }
                }
            ],
            "label": "target2gene",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "ghcr.io/pitagora-network/target2gene:1.0.0"
                }
            ],
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
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
            "id": "#wget.cwl",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "Workflow",
            "doc": "DAT2 workflow RNA-seq",
            "requirements": [
                {
                    "class": "MultipleInputFeatureRequirement"
                },
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "id": "#main/nthreads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "default": 4
                },
                {
                    "id": "#main/fasta_url",
                    "type": "string"
                },
                {
                    "id": "#main/fasta_name",
                    "type": "string"
                },
                {
                    "id": "#main/gtf_url",
                    "type": "string"
                },
                {
                    "id": "#main/gtf_name",
                    "type": "string"
                },
                {
                    "id": "#main/fastrq_dump_split_files",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true
                },
                {
                    "id": "#main/runid_0",
                    "type": "string"
                },
                {
                    "id": "#main/runid_1",
                    "type": "string"
                },
                {
                    "id": "#main/runid_2",
                    "type": "string"
                },
                {
                    "id": "#main/runid_3",
                    "type": "string"
                },
                {
                    "id": "#main/runid_4",
                    "type": "string"
                },
                {
                    "id": "#main/runid_5",
                    "type": "string"
                },
                {
                    "id": "#main/runid_6",
                    "type": "string"
                },
                {
                    "id": "#main/target2gene_SraRunTable",
                    "type": "File"
                },
                {
                    "id": "#main/rsem_index_prefix",
                    "type": "string"
                },
                {
                    "id": "#main/star_quantMode",
                    "type": "string"
                },
                {
                    "id": "#main/star_outSAMtype",
                    "type": {
                        "type": "array",
                        "items": "string"
                    }
                },
                {
                    "id": "#main/kallisto_fasta_url",
                    "type": "string"
                },
                {
                    "id": "#main/kallisto_fasta_name",
                    "type": "string"
                },
                {
                    "id": "#main/kallisto_index_name",
                    "type": "string"
                },
                {
                    "id": "#main/kallisto_bootstrap_samples",
                    "type": [
                        "null",
                        "int"
                    ],
                    "default": 100
                }
            ],
            "steps": [
                {
                    "run": "#rnaseq-kallisto-sleuth.cwl",
                    "in": [
                        {
                            "source": "#main/target2gene_SraRunTable",
                            "id": "#main/kallisto-sleuth/SraRunTable"
                        },
                        {
                            "source": "#main/kallisto_bootstrap_samples",
                            "id": "#main/kallisto-sleuth/bootstrap_samples"
                        },
                        {
                            "source": "#main/kallisto_index_name",
                            "id": "#main/kallisto-sleuth/index_name"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/kallisto-sleuth/nthreads"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/kallisto-sleuth/nthreads_1"
                        },
                        {
                            "source": "#main/kallisto_fasta_name",
                            "id": "#main/kallisto-sleuth/output_name"
                        },
                        {
                            "source": "#main/runid_0",
                            "id": "#main/kallisto-sleuth/runid"
                        },
                        {
                            "source": "#main/runid_1",
                            "id": "#main/kallisto-sleuth/runid_1"
                        },
                        {
                            "source": "#main/runid_2",
                            "id": "#main/kallisto-sleuth/runid_2"
                        },
                        {
                            "source": "#main/runid_3",
                            "id": "#main/kallisto-sleuth/runid_3"
                        },
                        {
                            "source": "#main/runid_4",
                            "id": "#main/kallisto-sleuth/runid_4"
                        },
                        {
                            "source": "#main/runid_5",
                            "id": "#main/kallisto-sleuth/runid_5"
                        },
                        {
                            "source": "#main/runid_6",
                            "id": "#main/kallisto-sleuth/runid_6"
                        },
                        {
                            "source": "#main/kallisto_fasta_url",
                            "id": "#main/kallisto-sleuth/url"
                        }
                    ],
                    "out": [
                        "#main/kallisto-sleuth/downloaded",
                        "#main/kallisto-sleuth/fastqFiles",
                        "#main/kallisto-sleuth/fastqFiles_1",
                        "#main/kallisto-sleuth/fastqFiles_2",
                        "#main/kallisto-sleuth/fastqFiles_3",
                        "#main/kallisto-sleuth/fastqFiles_4",
                        "#main/kallisto-sleuth/fastqFiles_5",
                        "#main/kallisto-sleuth/fastqFiles_6",
                        "#main/kallisto-sleuth/index_file",
                        "#main/kallisto-sleuth/output"
                    ],
                    "id": "#main/kallisto-sleuth"
                },
                {
                    "run": "#rnaseq-star-rsem-deseq2.cwl",
                    "in": [
                        {
                            "source": "#main/target2gene_SraRunTable",
                            "id": "#main/star-rsem-deseq2/SraRunTable"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads_1"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads_2"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads_3"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads_4"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads_5"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/nthreads_6"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/num_threads"
                        },
                        {
                            "source": "#main/star_outSAMtype",
                            "id": "#main/star-rsem-deseq2/outSAMtype"
                        },
                        {
                            "source": "#main/fasta_name",
                            "id": "#main/star-rsem-deseq2/output_name"
                        },
                        {
                            "source": "#main/gtf_name",
                            "id": "#main/star-rsem-deseq2/output_name_1"
                        },
                        {
                            "source": "#main/star_quantMode",
                            "id": "#main/star-rsem-deseq2/quantMode"
                        },
                        {
                            "source": "#main/rsem_index_prefix",
                            "id": "#main/star-rsem-deseq2/reference_prefix"
                        },
                        {
                            "source": "#main/rsem_index_prefix",
                            "id": "#main/star-rsem-deseq2/rsem_index_prefix"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/star-rsem-deseq2/runThreadN"
                        },
                        {
                            "source": "#main/runid_0",
                            "id": "#main/star-rsem-deseq2/runid"
                        },
                        {
                            "source": "#main/runid_1",
                            "id": "#main/star-rsem-deseq2/runid_1"
                        },
                        {
                            "source": "#main/runid_2",
                            "id": "#main/star-rsem-deseq2/runid_2"
                        },
                        {
                            "source": "#main/runid_3",
                            "id": "#main/star-rsem-deseq2/runid_3"
                        },
                        {
                            "source": "#main/runid_4",
                            "id": "#main/star-rsem-deseq2/runid_4"
                        },
                        {
                            "source": "#main/runid_5",
                            "id": "#main/star-rsem-deseq2/runid_5"
                        },
                        {
                            "source": "#main/runid_6",
                            "id": "#main/star-rsem-deseq2/runid_6"
                        },
                        {
                            "source": "#main/fastrq_dump_split_files",
                            "id": "#main/star-rsem-deseq2/split_files"
                        },
                        {
                            "source": "#main/fasta_url",
                            "id": "#main/star-rsem-deseq2/url"
                        },
                        {
                            "source": "#main/gtf_url",
                            "id": "#main/star-rsem-deseq2/url_1"
                        }
                    ],
                    "out": [
                        "#main/star-rsem-deseq2/aligned",
                        "#main/star-rsem-deseq2/aligned_1",
                        "#main/star-rsem-deseq2/aligned_2",
                        "#main/star-rsem-deseq2/aligned_3",
                        "#main/star-rsem-deseq2/aligned_4",
                        "#main/star-rsem-deseq2/aligned_5",
                        "#main/star-rsem-deseq2/aligned_6",
                        "#main/star-rsem-deseq2/bamRemDups",
                        "#main/star-rsem-deseq2/bamRemDups_1",
                        "#main/star-rsem-deseq2/bamRemDups_2",
                        "#main/star-rsem-deseq2/bamRemDups_3",
                        "#main/star-rsem-deseq2/bamRemDups_4",
                        "#main/star-rsem-deseq2/bamRemDups_5",
                        "#main/star-rsem-deseq2/bamRemDups_6",
                        "#main/star-rsem-deseq2/downloaded",
                        "#main/star-rsem-deseq2/downloaded_1",
                        "#main/star-rsem-deseq2/fastqFiles",
                        "#main/star-rsem-deseq2/fastqFiles_1",
                        "#main/star-rsem-deseq2/fastqFiles_2",
                        "#main/star-rsem-deseq2/fastqFiles_3",
                        "#main/star-rsem-deseq2/fastqFiles_4",
                        "#main/star-rsem-deseq2/fastqFiles_5",
                        "#main/star-rsem-deseq2/fastqFiles_6",
                        "#main/star-rsem-deseq2/genes_result",
                        "#main/star-rsem-deseq2/genes_result_1",
                        "#main/star-rsem-deseq2/genes_result_2",
                        "#main/star-rsem-deseq2/genes_result_3",
                        "#main/star-rsem-deseq2/genes_result_4",
                        "#main/star-rsem-deseq2/genes_result_5",
                        "#main/star-rsem-deseq2/genes_result_6",
                        "#main/star-rsem-deseq2/isoforms_result",
                        "#main/star-rsem-deseq2/isoforms_result_1",
                        "#main/star-rsem-deseq2/isoforms_result_2",
                        "#main/star-rsem-deseq2/isoforms_result_3",
                        "#main/star-rsem-deseq2/isoforms_result_4",
                        "#main/star-rsem-deseq2/isoforms_result_5",
                        "#main/star-rsem-deseq2/isoforms_result_6",
                        "#main/star-rsem-deseq2/Log.out",
                        "#main/star-rsem-deseq2/Log.out_1",
                        "#main/star-rsem-deseq2/Log.out_2",
                        "#main/star-rsem-deseq2/Log.out_3",
                        "#main/star-rsem-deseq2/Log.out_4",
                        "#main/star-rsem-deseq2/Log.out_5",
                        "#main/star-rsem-deseq2/Log.out_6",
                        "#main/star-rsem-deseq2/Log.progress.out",
                        "#main/star-rsem-deseq2/Log.progress.out_1",
                        "#main/star-rsem-deseq2/Log.progress.out_2",
                        "#main/star-rsem-deseq2/Log.progress.out_3",
                        "#main/star-rsem-deseq2/Log.progress.out_4",
                        "#main/star-rsem-deseq2/Log.progress.out_5",
                        "#main/star-rsem-deseq2/Log.progress.out_6",
                        "#main/star-rsem-deseq2/mappingstats",
                        "#main/star-rsem-deseq2/mappingstats_1",
                        "#main/star-rsem-deseq2/mappingstats_2",
                        "#main/star-rsem-deseq2/mappingstats_3",
                        "#main/star-rsem-deseq2/mappingstats_4",
                        "#main/star-rsem-deseq2/mappingstats_5",
                        "#main/star-rsem-deseq2/mappingstats_6",
                        "#main/star-rsem-deseq2/output",
                        "#main/star-rsem-deseq2/readspergene",
                        "#main/star-rsem-deseq2/readspergene_1",
                        "#main/star-rsem-deseq2/readspergene_2",
                        "#main/star-rsem-deseq2/readspergene_3",
                        "#main/star-rsem-deseq2/readspergene_4",
                        "#main/star-rsem-deseq2/readspergene_5",
                        "#main/star-rsem-deseq2/readspergene_6",
                        "#main/star-rsem-deseq2/rsem_index_1",
                        "#main/star-rsem-deseq2/SJ.out.tab",
                        "#main/star-rsem-deseq2/SJ.out.tab_1",
                        "#main/star-rsem-deseq2/SJ.out.tab_2",
                        "#main/star-rsem-deseq2/SJ.out.tab_3",
                        "#main/star-rsem-deseq2/SJ.out.tab_4",
                        "#main/star-rsem-deseq2/SJ.out.tab_5",
                        "#main/star-rsem-deseq2/SJ.out.tab_6",
                        "#main/star-rsem-deseq2/starIndex",
                        "#main/star-rsem-deseq2/stat",
                        "#main/star-rsem-deseq2/stat_1",
                        "#main/star-rsem-deseq2/stat_2",
                        "#main/star-rsem-deseq2/stat_3",
                        "#main/star-rsem-deseq2/stat_4",
                        "#main/star-rsem-deseq2/stat_5",
                        "#main/star-rsem-deseq2/stat_6",
                        "#main/star-rsem-deseq2/transcript_bam",
                        "#main/star-rsem-deseq2/transcript_bam_1",
                        "#main/star-rsem-deseq2/transcript_bam_2",
                        "#main/star-rsem-deseq2/transcript_bam_3",
                        "#main/star-rsem-deseq2/transcript_bam_4",
                        "#main/star-rsem-deseq2/transcript_bam_5",
                        "#main/star-rsem-deseq2/transcript_bam_6",
                        "#main/star-rsem-deseq2/transcript_sorted_bam",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_1",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_2",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_3",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_4",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_5",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_6",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai_1",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai_2",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai_3",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai_4",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai_5",
                        "#main/star-rsem-deseq2/transcript_sorted_bam_bai_6",
                        "#main/star-rsem-deseq2/transcriptomesam",
                        "#main/star-rsem-deseq2/transcriptomesam_1",
                        "#main/star-rsem-deseq2/transcriptomesam_2",
                        "#main/star-rsem-deseq2/transcriptomesam_3",
                        "#main/star-rsem-deseq2/transcriptomesam_4",
                        "#main/star-rsem-deseq2/transcriptomesam_5",
                        "#main/star-rsem-deseq2/transcriptomesam_6"
                    ],
                    "id": "#main/star-rsem-deseq2"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputSource": "#main/star-rsem-deseq2/output",
                    "id": "#main/deseq2-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/kallisto-sleuth/fastqFiles",
                        "#main/kallisto-sleuth/fastqFiles_1",
                        "#main/kallisto-sleuth/fastqFiles_2",
                        "#main/kallisto-sleuth/fastqFiles_3",
                        "#main/kallisto-sleuth/fastqFiles_4",
                        "#main/kallisto-sleuth/fastqFiles_5",
                        "#main/kallisto-sleuth/fastqFiles_6"
                    ],
                    "linkMerge": "merge_flattened",
                    "id": "#main/kallisto-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/genes_result",
                        "#main/star-rsem-deseq2/genes_result_1",
                        "#main/star-rsem-deseq2/genes_result_2",
                        "#main/star-rsem-deseq2/genes_result_3",
                        "#main/star-rsem-deseq2/genes_result_4",
                        "#main/star-rsem-deseq2/genes_result_5",
                        "#main/star-rsem-deseq2/genes_result_6"
                    ],
                    "id": "#main/rsem-genes-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/isoforms_result",
                        "#main/star-rsem-deseq2/isoforms_result_1",
                        "#main/star-rsem-deseq2/isoforms_result_2",
                        "#main/star-rsem-deseq2/isoforms_result_3",
                        "#main/star-rsem-deseq2/isoforms_result_4",
                        "#main/star-rsem-deseq2/isoforms_result_5",
                        "#main/star-rsem-deseq2/isoforms_result_6"
                    ],
                    "id": "#main/rsem-isoforms-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "Directory"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/stat",
                        "#main/star-rsem-deseq2/stat_1",
                        "#main/star-rsem-deseq2/stat_2",
                        "#main/star-rsem-deseq2/stat_3",
                        "#main/star-rsem-deseq2/stat_4",
                        "#main/star-rsem-deseq2/stat_5",
                        "#main/star-rsem-deseq2/stat_6"
                    ],
                    "id": "#main/rsem-stat-results"
                },
                {
                    "type": "Directory",
                    "outputSource": "#main/kallisto-sleuth/output",
                    "id": "#main/sleuth-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/bamRemDups",
                        "#main/star-rsem-deseq2/bamRemDups_1",
                        "#main/star-rsem-deseq2/bamRemDups_2",
                        "#main/star-rsem-deseq2/bamRemDups_3",
                        "#main/star-rsem-deseq2/bamRemDups_4",
                        "#main/star-rsem-deseq2/bamRemDups_5",
                        "#main/star-rsem-deseq2/bamRemDups_6"
                    ],
                    "id": "#main/star-bam-rem-dups-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/aligned",
                        "#main/star-rsem-deseq2/aligned_1",
                        "#main/star-rsem-deseq2/aligned_2",
                        "#main/star-rsem-deseq2/aligned_3",
                        "#main/star-rsem-deseq2/aligned_4",
                        "#main/star-rsem-deseq2/aligned_5",
                        "#main/star-rsem-deseq2/aligned_6"
                    ],
                    "id": "#main/star-bam-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/mappingstats",
                        "#main/star-rsem-deseq2/mappingstats_1",
                        "#main/star-rsem-deseq2/mappingstats_2",
                        "#main/star-rsem-deseq2/mappingstats_3",
                        "#main/star-rsem-deseq2/mappingstats_4",
                        "#main/star-rsem-deseq2/mappingstats_5",
                        "#main/star-rsem-deseq2/mappingstats_6"
                    ],
                    "id": "#main/star-mapping-stats-results"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": [
                        "#main/star-rsem-deseq2/readspergene",
                        "#main/star-rsem-deseq2/readspergene_1",
                        "#main/star-rsem-deseq2/readspergene_2",
                        "#main/star-rsem-deseq2/readspergene_3",
                        "#main/star-rsem-deseq2/readspergene_4",
                        "#main/star-rsem-deseq2/readspergene_5",
                        "#main/star-rsem-deseq2/readspergene_6"
                    ],
                    "id": "#main/star-read-per-gene-results"
                }
            ],
            "id": "#main",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "id": "#rnaseq-kallisto-pe.cwl/bootstrap_samples",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/index_file",
                    "type": "File"
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/out_dir_name",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/runid",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/nthreads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/split_files",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/nthreads_1",
                    "type": [
                        "null",
                        "int"
                    ]
                }
            ],
            "outputs": [
                {
                    "id": "#rnaseq-kallisto-pe.cwl/quant_output",
                    "outputSource": [
                        "#rnaseq-kallisto-pe.cwl/kallisto_quant/quant_output"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/fastqFiles",
                    "outputSource": [
                        "#rnaseq-kallisto-pe.cwl/fasterq_dump/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                }
            ],
            "steps": [
                {
                    "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/bootstrap_samples",
                            "source": "#rnaseq-kallisto-pe.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/fq1",
                            "source": "#rnaseq-kallisto-pe.cwl/fasterq_dump/forward"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/fq2",
                            "source": "#rnaseq-kallisto-pe.cwl/fasterq_dump/reverse"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/index_file",
                            "source": "#rnaseq-kallisto-pe.cwl/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/nthreads",
                            "source": "#rnaseq-kallisto-pe.cwl/nthreads_1"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/out_dir_name",
                            "default": [],
                            "source": "#rnaseq-kallisto-pe.cwl/out_dir_name"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/kallisto_quant/quant_output"
                        }
                    ],
                    "run": "#kallisto_quant-pe.cwl",
                    "label": "kallisto quant: runs the quantification algorithm"
                },
                {
                    "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump/nthreads",
                            "source": "#rnaseq-kallisto-pe.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump/split_files",
                            "source": "#rnaseq-kallisto-pe.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump/runid",
                            "source": "#rnaseq-kallisto-pe.cwl/runid"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump/forward"
                        },
                        {
                            "id": "#rnaseq-kallisto-pe.cwl/fasterq_dump/reverse"
                        }
                    ],
                    "run": "#fasterq-dump.cwl",
                    "label": "fasterq-dump: dump .sra format file to generate fastq file"
                }
            ],
            "requirements": [],
            "id": "#rnaseq-kallisto-pe.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/url",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/output_name",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/index_name",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/nthreads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid_1",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid_2",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid_3",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid_4",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid_5",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/runid_6",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/nthreads_1",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/SraRunTable",
                    "type": "File"
                }
            ],
            "outputs": [
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/downloaded",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/wget/downloaded"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/index_file",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles_1",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles_2",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles_3",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles_4",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles_5",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/fastqFiles_6",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/output",
                    "outputSource": [
                        "#rnaseq-kallisto-sleuth.cwl/sleuth/output"
                    ],
                    "type": "Directory"
                }
            ],
            "steps": [
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/wget",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/wget/output_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/output_name"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/wget/url",
                            "source": "#rnaseq-kallisto-sleuth.cwl/url"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/wget/downloaded"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/wget/stderr"
                        }
                    ],
                    "run": "#wget.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_index",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/fasta_files",
                            "source": "#rnaseq-kallisto-sleuth.cwl/wget/downloaded"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/index_name"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        }
                    ],
                    "run": "#kallisto_index.cwl",
                    "label": "kallisto index: builds an index from a FASTA formatted file of target sequences"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_1"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_1"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_2"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_2"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_3"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_3"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_4"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_4"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_5"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_5"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/bootstrap_samples",
                            "source": "#rnaseq-kallisto-sleuth.cwl/bootstrap_samples"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/index_file",
                            "source": "#rnaseq-kallisto-sleuth.cwl/kallisto_index/index_file"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/out_dir_name",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_6"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/runid",
                            "source": "#rnaseq-kallisto-sleuth.cwl/runid_6"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/nthreads",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/nthreads_1",
                            "source": "#rnaseq-kallisto-sleuth.cwl/nthreads_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/quant_output"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/fastqFiles"
                        }
                    ],
                    "run": "#rnaseq-kallisto-pe.cwl"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/sleuth",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/sleuth/sample.txt",
                            "source": "#rnaseq-kallisto-sleuth.cwl/sample_for_sleuth/sample.txt"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/sleuth/target2gene.txt",
                            "source": "#rnaseq-kallisto-sleuth.cwl/target2gene/target2gene.txt"
                        },
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/sleuth/kallisto_out",
                            "source": [
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe/quant_output",
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_1/quant_output",
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_2/quant_output",
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_3/quant_output",
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_4/quant_output",
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_5/quant_output",
                                "#rnaseq-kallisto-sleuth.cwl/kallisto_wf_pe_6/quant_output"
                            ]
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/sleuth/output"
                        }
                    ],
                    "run": "#sleuth.cwl",
                    "label": "sleuth"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/target2gene",
                    "in": [],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/target2gene/target2gene.txt"
                        }
                    ],
                    "run": "#target2gene.cwl",
                    "label": "target2gene"
                },
                {
                    "id": "#rnaseq-kallisto-sleuth.cwl/sample_for_sleuth",
                    "in": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/sample_for_sleuth/SraRunTable",
                            "source": "#rnaseq-kallisto-sleuth.cwl/SraRunTable"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-kallisto-sleuth.cwl/sample_for_sleuth/sample.txt"
                        }
                    ],
                    "run": "#sample_txt.cwl",
                    "label": "sample_txt"
                }
            ],
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                },
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ],
            "id": "#rnaseq-kallisto-sleuth.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/reference_prefix",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/num_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SraRunTable",
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/url",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/output_name",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/url_1",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/output_name_1",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runThreadN",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/split_files",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid_1",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid_2",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid_3",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid_4",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid_5",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/runid_6",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/quantMode",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/outSAMtype",
                    "type": {
                        "type": "array",
                        "items": "string"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads_1",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads_2",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads_3",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads_4",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads_5",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/nthreads_6",
                    "type": [
                        "null",
                        "int"
                    ]
                }
            ],
            "outputs": [
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/starIndex",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/downloaded",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/wget/downloaded"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/downloaded_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/wget_1/downloaded"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned_1",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned_2",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned_3",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned_4",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned_5",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcriptomesam_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_bai_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_sorted_bam_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/transcript_bam_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/stat_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/SJ.out.tab_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/readspergene_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/mappingstats_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.progress.out_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/Log.out_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/isoforms_result_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/genes_result_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/fastqFiles_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/bamRemDups_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/aligned_6",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/output",
                    "outputSource": [
                        "#rnaseq-star-rsem-deseq2.cwl/deseq2/output"
                    ],
                    "type": "Directory"
                }
            ],
            "steps": [
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip/file",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/wget/downloaded"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip/decompressed"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip/stderr"
                        }
                    ],
                    "run": "#gunzip.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip_1",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip_1/file",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/wget_1/downloaded"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip_1/decompressed"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/gunzip_1/stderr"
                        }
                    ],
                    "run": "#gunzip.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_index",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_index/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/for_star_index_dir_sh/STAR_reference"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_index/genomeFastaFiles",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/gunzip_1/decompressed"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_index/runThreadN",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runThreadN"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_index/sjdbGTFfile",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/gunzip/decompressed"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        }
                    ],
                    "run": "#star_index.cwl",
                    "label": "STAR genomeGenerate: Generating genome indexes."
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/gtf",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/gunzip/decompressed"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/reference_fasta",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/gunzip_1/decompressed"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/num_threads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/num_threads"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/reference_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/for_rsem_index_dir_sh/RSEM_reference"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/reference_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/reference_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        }
                    ],
                    "run": "#rsem_index.cwl",
                    "label": "rsem-prepare-reference: preparing reference sequences"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/for_star_index_dir_sh",
                    "in": [],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/for_star_index_dir_sh/STAR_reference"
                        }
                    ],
                    "run": "#mkdir_star.cwl",
                    "label": "mkdir_star"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/for_rsem_index_dir_sh",
                    "in": [],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/for_rsem_index_dir_sh/RSEM_reference"
                        }
                    ],
                    "run": "#mkdir_rsem.cwl",
                    "label": "mkdir_rsem"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/deseq2",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/deseq2/sample2condition.txt",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/sample2condition/output1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/deseq2/target2gene.txt",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/target2gene/target2gene.txt"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/deseq2/rsem_out",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/genes_result",
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/genes_result",
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/genes_result",
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/genes_result",
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/genes_result",
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/genes_result",
                                "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/genes_result"
                            ]
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/deseq2/output"
                        }
                    ],
                    "run": "#deseq2.cwl",
                    "label": "deseq2"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/target2gene",
                    "in": [],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/target2gene/target2gene.txt"
                        }
                    ],
                    "run": "#target2gene.cwl",
                    "label": "target2gene"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/sample2condition",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/sample2condition/SraRunTable",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/SraRunTable"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/sample2condition/output1"
                        }
                    ],
                    "run": "#sample2condition.cwl",
                    "label": "sample2condition"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/wget",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget/output_name",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/output_name"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget/url",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/url"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget/downloaded"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget/stderr"
                        }
                    ],
                    "run": "#wget.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/wget_1",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget_1/output_name",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/output_name_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget_1/url",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/url_1"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget_1/downloaded"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/wget_1/stderr"
                        }
                    ],
                    "run": "#wget.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_1/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_2/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_3"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_3"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_3"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_3"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_3"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_3"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_3/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_4"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_4"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_4"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_4"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_4"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_4"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_4/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_5"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_5"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_5"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_5"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_5"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_5"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_5/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                },
                {
                    "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/split_files",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/runid",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_6"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/nthreads",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_6"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/genomeDir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/star_index/starIndex"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/nthreads_1",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_6"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_6"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-deseq2.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/quantMode",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index/rsem_index"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/runid_6"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/nthreads_2",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/nthreads_6"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-deseq2.cwl/rsem_index_prefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/SJ.out.tab"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcript_sorted_bam_bai"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-deseq2.cwl/star_rsem_wf_pe_6/transcriptomesam"
                        }
                    ],
                    "run": "#rnaseq-star-rsem-pe.cwl"
                }
            ],
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                },
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ],
            "id": "#rnaseq-star-rsem-deseq2.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/split_files",
                    "type": [
                        "null",
                        "boolean"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/runid",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/nthreads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/genomeDir",
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/nthreads_1",
                    "type": "int"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/outFileNamePrefix",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/outSAMtype",
                    "type": {
                        "type": "array",
                        "items": "string"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/quantMode",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/rsem_index_dir",
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/rsem_output_prefix",
                    "type": "string"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/nthreads_2",
                    "type": "int"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/rsem_index_prefix",
                    "type": [
                        "null",
                        "string"
                    ]
                }
            ],
            "outputs": [
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/fastqFiles",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/fasterq_dump/fastqFiles"
                    ],
                    "type": {
                        "type": "array",
                        "items": "File"
                    }
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/SJ.out.tab",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/SJ.out.tab"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/readspergene",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/readspergene"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/mappingstats",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/mappingstats"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/Log.progress.out",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/Log.progress.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/Log.out",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/Log.out"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/bamRemDups",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/bamRemDups"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/transcript_sorted_bam_bai",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/transcript_sorted_bam_bai"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/transcript_sorted_bam",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/transcript_sorted_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/transcript_bam",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/transcript_bam"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/stat",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/stat"
                    ],
                    "type": "Directory"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/isoforms_result",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/isoforms_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/genes_result",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/genes_result"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/aligned",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/aligned"
                    ],
                    "type": "File"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/transcriptomesam",
                    "outputSource": [
                        "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/transcriptomesam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ]
                }
            ],
            "steps": [
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/nthreads",
                            "source": "#rnaseq-star-rsem-pe.cwl/nthreads"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/split_files",
                            "source": "#rnaseq-star-rsem-pe.cwl/split_files"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/runid",
                            "source": "#rnaseq-star-rsem-pe.cwl/runid"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/fastqFiles"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/forward"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/reverse"
                        }
                    ],
                    "run": "#fasterq-dump.cwl",
                    "label": "fasterq-dump: dump .sra format file to generate fastq file"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/nthreads",
                            "source": "#rnaseq-star-rsem-pe.cwl/nthreads_2"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/rsem_index_dir",
                            "source": "#rnaseq-star-rsem-pe.cwl/rsem_index_dir"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/rsem_index_prefix",
                            "source": "#rnaseq-star-rsem-pe.cwl/rsem_index_prefix"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/rsem_output_prefix",
                            "source": "#rnaseq-star-rsem-pe.cwl/rsem_output_prefix"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/bam",
                            "source": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/transcriptomesam"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/genes_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/isoforms_result"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/stat"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/transcript_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/transcript_sorted_bam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/rsem_calculate_expression_pe/transcript_sorted_bam_bai"
                        }
                    ],
                    "run": "#rsem_calculate-expression-pe.cwl",
                    "label": "rsem-calculate-expression: calculate expression values (BAM input version CWL)"
                },
                {
                    "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe",
                    "in": [
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/fq1",
                            "source": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/forward"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/fq2",
                            "source": "#rnaseq-star-rsem-pe.cwl/fasterq_dump/reverse"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/genomeDir",
                            "source": "#rnaseq-star-rsem-pe.cwl/genomeDir"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/nthreads",
                            "source": "#rnaseq-star-rsem-pe.cwl/nthreads_1"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/outSAMtype",
                            "source": [
                                "#rnaseq-star-rsem-pe.cwl/outSAMtype"
                            ]
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/quantMode",
                            "source": "#rnaseq-star-rsem-pe.cwl/quantMode"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/outFileNamePrefix",
                            "source": "#rnaseq-star-rsem-pe.cwl/outFileNamePrefix"
                        }
                    ],
                    "out": [
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/aligned"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/bamRemDups"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/mappingstats"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/readspergene"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/transcriptomesam"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/Log.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/Log.progress.out"
                        },
                        {
                            "id": "#rnaseq-star-rsem-pe.cwl/star_mapping_pe/SJ.out.tab"
                        }
                    ],
                    "run": "#star_mapping-pe.cwl",
                    "label": "STAR mapping: running mapping jobs."
                }
            ],
            "requirements": [],
            "id": "#rnaseq-star-rsem-pe.cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ],
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ]
        }
    ],
    "cwlVersion": "v1.2",
    "$schemas": [
        "https://schema.org/version/latest/schemaorg-current-http.rdf",
        "http://edamontology.org/EDAM_1.18.owl"
    ]
}
