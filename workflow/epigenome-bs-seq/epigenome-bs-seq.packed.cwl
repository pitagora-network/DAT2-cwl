{
    "$graph": [
        {
            "class": "CommandLineTool",
            "label": "bismark",
            "doc": "bismark",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bismark:0.20.0--0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "bismark"
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": ".fq or .fastq file",
                    "doc": ".fq or .fastq file",
                    "inputBinding": {
                        "position": 2
                    },
                    "id": "#bismark.cwl/fq"
                },
                {
                    "type": "Directory",
                    "label": "The path to the folder containing the unmodified reference genome as well as the subfolders created by the Bismark_Genome_Preparation script",
                    "doc": "The path to the folder containing the unmodified reference genome as well as the subfolders created by the Bismark_Genome_Preparation script",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#bismark.cwl/genome_folder"
                },
                {
                    "type": "int",
                    "default": 1,
                    "inputBinding": {
                        "position": 3,
                        "prefix": "--multicore"
                    },
                    "id": "#bismark.cwl/multicore"
                }
            ],
            "stdout": "bismark-stdout.log",
            "stderr": "bismark-stderr.log",
            "id": "#bismark.cwl",
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "*_bismark_bt2.bam"
                    },
                    "id": "#bismark.cwl/bam"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "*_bismark_bt2_SE_report.txt"
                    },
                    "id": "#bismark.cwl/report"
                },
                {
                    "type": "File",
                    "id": "#bismark.cwl/stderr",
                    "outputBinding": {
                        "glob": "bismark-stderr.log"
                    }
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "label": "bismark genome preparation",
            "doc": "bismark genome preparation",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bismark:0.20.0--0",
                    "class": "DockerRequirement"
                },
                {
                    "listing": [
                        {
                            "entry": "$(inputs.ref_directory)",
                            "writable": true
                        }
                    ],
                    "class": "InitialWorkDirRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": [
                "bismark_genome_preparation"
            ],
            "inputs": [
                {
                    "type": "Directory",
                    "label": "reference directory. Directory Bisulfite_Genome is created inside this directory",
                    "doc": "reference directory. Directory Bisulfite_Genome is created inside this directory",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#bismark_genome_preparation.cwl/ref_directory"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.ref_directory.basename)"
                    },
                    "id": "#bismark_genome_preparation.cwl/output"
                },
                {
                    "type": "File",
                    "id": "#bismark_genome_preparation.cwl/stderr",
                    "outputBinding": {
                        "glob": "dcbdf580ec51382953fef3efce4f33089158fb30"
                    }
                },
                {
                    "type": "File",
                    "id": "#bismark_genome_preparation.cwl/stdout",
                    "outputBinding": {
                        "glob": "fbd69e90e8824971a0cccbeb660e190ca6bbe73e"
                    }
                }
            ],
            "id": "#bismark_genome_preparation.cwl",
            "stderr": "dcbdf580ec51382953fef3efce4f33089158fb30",
            "stdout": "fbd69e90e8824971a0cccbeb660e190ca6bbe73e"
        },
        {
            "class": "CommandLineTool",
            "doc": "concatenate files and print on the standard output",
            "requirements": [
                {
                    "dockerPull": "alpine:3.9",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "cat",
            "inputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {},
                    "id": "#cat.cwl/files"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#cat.cwl/concatinated",
                    "outputBinding": {
                        "glob": "cat-stdout.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#cat.cwl/stderr",
                    "outputBinding": {
                        "glob": "cat-stderr.log"
                    }
                }
            ],
            "stdout": "cat-stdout.log",
            "stderr": "cat-stderr.log",
            "id": "#cat.cwl"
        },
        {
            "class": "ExpressionTool",
            "doc": "Listing specified files from a given directory",
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "Directory",
                    "id": "#listing.cwl/dir"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "string"
                    },
                    "id": "#listing.cwl/file_names"
                }
            ],
            "expression": "${\n  var ret = []\n  for(var i=0; i < inputs.file_names.length; i++) {\n    ret.push({\n      class: \"File\",\n      location: inputs.dir.location+\"/\"+inputs.file_names[i],\n    });\n  }\n  return {\n    files: ret,\n  };\n}\n",
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "id": "#listing.cwl/files"
                }
            ],
            "id": "#listing.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "manipulate tape archives",
            "requirements": [
                {
                    "dockerPull": "alpine:3.9",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": "tar",
            "inputs": [
                {
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-x"
                    },
                    "id": "#tar.cwl/extract"
                },
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "--file=",
                        "separate": false
                    },
                    "id": "#tar.cwl/file"
                },
                {
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-z"
                    },
                    "id": "#tar.cwl/gzip"
                },
                {
                    "type": "boolean",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-v"
                    },
                    "id": "#tar.cwl/verbose"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "${\n  var extlen = inputs.gzip ? 2 : 1;\n  return inputs.file.basename.split('.').slice(0, -extlen).join('.');\n}\n"
                    },
                    "id": "#tar.cwl/output"
                },
                {
                    "type": "File",
                    "id": "#tar.cwl/stderr",
                    "outputBinding": {
                        "glob": "tar-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#tar.cwl/stdout",
                    "outputBinding": {
                        "glob": "tar-stdout.log"
                    }
                }
            ],
            "stdout": "tar-stdout.log",
            "stderr": "tar-stderr.log",
            "id": "#tar.cwl"
        },
        {
            "class": "CommandLineTool",
            "label": "Trim Galore",
            "doc": "Trim Galore",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/trim-galore:0.5.0--0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "trim_galore"
            ],
            "inputs": [
                {
                    "type": "int",
                    "label": "Trim low-quality ends from reads in addition to adapter removal",
                    "doc": "Trim low-quality ends from reads in addition to adapter removal",
                    "inputBinding": {
                        "prefix": "-q"
                    },
                    "id": "#trim_galore.cwl/quality"
                },
                {
                    "type": "File",
                    "label": "input file was an MspI digested RRBS sample",
                    "doc": "input file was an MspI digested RRBS sample",
                    "inputBinding": {
                        "prefix": "-rrbs"
                    },
                    "id": "#trim_galore.cwl/rrbs"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.rrbs.nameroot)_trimmed.fq"
                    },
                    "id": "#trim_galore.cwl/fq"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.rrbs.nameroot).fastq_trimming_report.txt"
                    },
                    "id": "#trim_galore.cwl/report"
                },
                {
                    "type": "File",
                    "id": "#trim_galore.cwl/stderr",
                    "outputBinding": {
                        "glob": "trim_galore-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#trim_galore.cwl/stdout",
                    "outputBinding": {
                        "glob": "trim_galore-stdout.log"
                    }
                }
            ],
            "stdout": "trim_galore-stdout.log",
            "stderr": "trim_galore-stderr.log",
            "id": "#trim_galore.cwl"
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
            "doc": "bismark genome preparation workflow",
            "requirements": [],
            "inputs": [
                {
                    "type": "File",
                    "doc": "fasta file",
                    "label": "fasta file",
                    "id": "#bismark-genome-preparation.cwl/fasta"
                }
            ],
            "steps": [
                {
                    "run": "#bismark_genome_preparation.cwl",
                    "in": [
                        {
                            "source": "#bismark-genome-preparation.cwl/rename/renamed_dir",
                            "id": "#bismark-genome-preparation.cwl/bismark_genome_preparation/ref_directory"
                        }
                    ],
                    "out": [
                        "#bismark-genome-preparation.cwl/bismark_genome_preparation/output"
                    ],
                    "id": "#bismark-genome-preparation.cwl/bismark_genome_preparation"
                },
                {
                    "run": {
                        "class": "CommandLineTool",
                        "baseCommand": [
                            "true"
                        ],
                        "requirements": [
                            {
                                "listing": [
                                    {
                                        "entry": "$(inputs.fastafile)"
                                    }
                                ],
                                "class": "InitialWorkDirRequirement"
                            }
                        ],
                        "inputs": [
                            {
                                "type": "File",
                                "id": "#bismark-genome-preparation.cwl/rename/087f547a-1e77-49d2-979a-0252d2c1046f/fastafile"
                            }
                        ],
                        "outputs": [
                            {
                                "type": "Directory",
                                "outputBinding": {
                                    "glob": "$(runtime.outdir)"
                                },
                                "id": "#bismark-genome-preparation.cwl/rename/087f547a-1e77-49d2-979a-0252d2c1046f/renamed_dir"
                            }
                        ],
                        "id": "#bismark-genome-preparation.cwl/rename/087f547a-1e77-49d2-979a-0252d2c1046f"
                    },
                    "in": [
                        {
                            "source": "#bismark-genome-preparation.cwl/fasta",
                            "id": "#bismark-genome-preparation.cwl/rename/fastafile"
                        }
                    ],
                    "out": [
                        "#bismark-genome-preparation.cwl/rename/renamed_dir"
                    ],
                    "id": "#bismark-genome-preparation.cwl/rename"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputSource": "#bismark-genome-preparation.cwl/bismark_genome_preparation/output",
                    "id": "#bismark-genome-preparation.cwl/output"
                }
            ],
            "id": "#bismark-genome-preparation.cwl"
        },
        {
            "class": "Workflow",
            "doc": "string",
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                },
                {
                    "class": "ScatterFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "string"
                    },
                    "label": "list of SRA Run ID e.g. SRR1274307",
                    "doc": "list of SRA Run ID e.g. SRR1274307",
                    "id": "#download-rawdata.cwl/run_ids"
                },
                {
                    "type": "int",
                    "default": 4,
                    "doc": "number of threads to use",
                    "id": "#download-rawdata.cwl/threads"
                }
            ],
            "steps": [
                {
                    "run": "#download-sra.cwl",
                    "in": [
                        {
                            "source": "#download-rawdata.cwl/run_ids",
                            "id": "#download-rawdata.cwl/download_sra/run_ids"
                        }
                    ],
                    "out": [
                        "#download-rawdata.cwl/download_sra/sraFiles"
                    ],
                    "id": "#download-rawdata.cwl/download_sra"
                },
                {
                    "run": "#pfastq-dump-multi.cwl",
                    "in": [
                        {
                            "source": "#download-rawdata.cwl/threads",
                            "id": "#download-rawdata.cwl/pfastq_dump/nthreads"
                        },
                        {
                            "source": "#download-rawdata.cwl/download_sra/sraFiles",
                            "id": "#download-rawdata.cwl/pfastq_dump/sraFiles"
                        }
                    ],
                    "out": [
                        "#download-rawdata.cwl/pfastq_dump/fastqFiles"
                    ],
                    "id": "#download-rawdata.cwl/pfastq_dump"
                }
            ],
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#download-rawdata.cwl/pfastq_dump/fastqFiles",
                    "id": "#download-rawdata.cwl/fastq_files"
                }
            ],
            "id": "#download-rawdata.cwl"
        },
        {
            "class": "Workflow",
            "doc": "string",
            "requirements": [],
            "inputs": [
                {
                    "doc": "Name of created fasta file",
                    "type": "string",
                    "default": "hg38.fasta",
                    "id": "#download-reference-fasta.cwl/fastafilename"
                },
                {
                    "doc": "Download target URL",
                    "type": "string",
                    "id": "#download-reference-fasta.cwl/url"
                }
            ],
            "steps": [
                {
                    "run": "#cat.cwl",
                    "in": [
                        {
                            "source": "#download-reference-fasta.cwl/lists/files",
                            "id": "#download-reference-fasta.cwl/cat/files"
                        }
                    ],
                    "out": [
                        "#download-reference-fasta.cwl/cat/concatinated"
                    ],
                    "id": "#download-reference-fasta.cwl/cat"
                },
                {
                    "run": "#listing.cwl",
                    "in": [
                        {
                            "source": "#download-reference-fasta.cwl/tar/output",
                            "id": "#download-reference-fasta.cwl/lists/dir"
                        },
                        {
                            "default": [
                                "chr1.fa",
                                "chr2.fa",
                                "chr3.fa",
                                "chr4.fa",
                                "chr5.fa",
                                "chr6.fa",
                                "chr7.fa",
                                "chr8.fa",
                                "chr9.fa",
                                "chr10.fa",
                                "chr11.fa",
                                "chr12.fa",
                                "chr13.fa",
                                "chr14.fa",
                                "chr15.fa",
                                "chr16.fa",
                                "chr17.fa",
                                "chr18.fa",
                                "chr19.fa",
                                "chr20.fa",
                                "chr21.fa",
                                "chr22.fa",
                                "chrX.fa",
                                "chrY.fa",
                                "chrM.fa",
                                "chrEBV.fa"
                            ],
                            "id": "#download-reference-fasta.cwl/lists/file_names"
                        }
                    ],
                    "out": [
                        "#download-reference-fasta.cwl/lists/files"
                    ],
                    "id": "#download-reference-fasta.cwl/lists"
                },
                {
                    "run": {
                        "class": "CommandLineTool",
                        "baseCommand": [
                            "true"
                        ],
                        "requirements": [
                            {
                                "listing": [
                                    {
                                        "entryname": "$(inputs.finalfilename)",
                                        "entry": "$(inputs.oldfile)"
                                    }
                                ],
                                "class": "InitialWorkDirRequirement"
                            }
                        ],
                        "inputs": [
                            {
                                "type": "string",
                                "id": "#download-reference-fasta.cwl/rename/fb32bd8c-684b-46a2-8ebb-0f4c10770ef6/finalfilename"
                            },
                            {
                                "type": "File",
                                "id": "#download-reference-fasta.cwl/rename/fb32bd8c-684b-46a2-8ebb-0f4c10770ef6/oldfile"
                            }
                        ],
                        "outputs": [
                            {
                                "type": "File",
                                "outputBinding": {
                                    "glob": "$(inputs.finalfilename)"
                                },
                                "id": "#download-reference-fasta.cwl/rename/fb32bd8c-684b-46a2-8ebb-0f4c10770ef6/renamed_file"
                            }
                        ],
                        "id": "#download-reference-fasta.cwl/rename/fb32bd8c-684b-46a2-8ebb-0f4c10770ef6"
                    },
                    "in": [
                        {
                            "source": "#download-reference-fasta.cwl/fastafilename",
                            "id": "#download-reference-fasta.cwl/rename/finalfilename"
                        },
                        {
                            "source": "#download-reference-fasta.cwl/cat/concatinated",
                            "id": "#download-reference-fasta.cwl/rename/oldfile"
                        }
                    ],
                    "out": [
                        "#download-reference-fasta.cwl/rename/renamed_file"
                    ],
                    "id": "#download-reference-fasta.cwl/rename"
                },
                {
                    "run": "#tar.cwl",
                    "in": [
                        {
                            "default": true,
                            "id": "#download-reference-fasta.cwl/tar/extract"
                        },
                        {
                            "source": "#download-reference-fasta.cwl/wget/downloaded",
                            "id": "#download-reference-fasta.cwl/tar/file"
                        },
                        {
                            "default": true,
                            "id": "#download-reference-fasta.cwl/tar/gzip"
                        }
                    ],
                    "out": [
                        "#download-reference-fasta.cwl/tar/output"
                    ],
                    "id": "#download-reference-fasta.cwl/tar"
                },
                {
                    "run": "#wget.cwl",
                    "in": [
                        {
                            "source": "#download-reference-fasta.cwl/url",
                            "id": "#download-reference-fasta.cwl/wget/url"
                        },
                        {
                            "default": true,
                            "id": "#download-reference-fasta.cwl/wget/use_remote_name"
                        }
                    ],
                    "out": [
                        "#download-reference-fasta.cwl/wget/downloaded"
                    ],
                    "id": "#download-reference-fasta.cwl/wget"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#download-reference-fasta.cwl/rename/renamed_file",
                    "id": "#download-reference-fasta.cwl/output_fasta"
                }
            ],
            "id": "#download-reference-fasta.cwl"
        },
        {
            "class": "Workflow",
            "doc": "BSseq workflow",
            "requirements": [
                {
                    "class": "ScatterFeatureRequirement"
                },
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "int",
                    "default": 1,
                    "label": "trim_galore thread number and bismark multicore",
                    "doc": "trim_galore thread number and bismark multicore",
                    "id": "#main/nthreads"
                },
                {
                    "type": "int",
                    "default": 20,
                    "label": "trim_galore quality",
                    "doc": "trim_galore quality",
                    "id": "#main/quality"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "string"
                    },
                    "label": "list of SRA Run ID e.g. SRR1274307",
                    "doc": "list of SRA Run ID e.g. SRR1274307",
                    "id": "#main/run_ids"
                },
                {
                    "doc": "Download target URL",
                    "type": "string",
                    "default": "ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/analysisSet/hg38.analysisSet.chroms.tar.gz",
                    "id": "#main/url"
                }
            ],
            "steps": [
                {
                    "run": "#bismark.cwl",
                    "in": [
                        {
                            "source": "#main/trim_galore_rawdata/fq",
                            "id": "#main/bismark_exec/fq"
                        },
                        {
                            "source": "#main/bismark_genome_preparation/output",
                            "id": "#main/bismark_exec/genome_folder"
                        }
                    ],
                    "scatter": "#main/bismark_exec/fq",
                    "out": [
                        "#main/bismark_exec/bam",
                        "#main/bismark_exec/report"
                    ],
                    "id": "#main/bismark_exec"
                },
                {
                    "run": "#bismark-genome-preparation.cwl",
                    "in": [
                        {
                            "source": "#main/download_reference_fasta/output_fasta",
                            "id": "#main/bismark_genome_preparation/fasta"
                        }
                    ],
                    "out": [
                        "#main/bismark_genome_preparation/output"
                    ],
                    "id": "#main/bismark_genome_preparation"
                },
                {
                    "run": "#download-rawdata.cwl",
                    "in": [
                        {
                            "source": "#main/run_ids",
                            "id": "#main/download_rawdata/run_ids"
                        }
                    ],
                    "out": [
                        "#main/download_rawdata/fastq_files"
                    ],
                    "id": "#main/download_rawdata"
                },
                {
                    "run": "#download-reference-fasta.cwl",
                    "in": [
                        {
                            "source": "#main/url",
                            "id": "#main/download_reference_fasta/url"
                        }
                    ],
                    "out": [
                        "#main/download_reference_fasta/output_fasta"
                    ],
                    "id": "#main/download_reference_fasta"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "source": "#main/download_rawdata/fastq_files",
                            "id": "#main/fastqc_rawdata/fastq_files"
                        }
                    ],
                    "out": [
                        "#main/fastqc_rawdata/output"
                    ],
                    "id": "#main/fastqc_rawdata"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "source": "#main/trim_galore_rawdata/fq",
                            "id": "#main/fastqc_trimmed_data/fastq_files"
                        }
                    ],
                    "out": [
                        "#main/fastqc_trimmed_data/output"
                    ],
                    "id": "#main/fastqc_trimmed_data"
                },
                {
                    "run": "#trim_galore.cwl",
                    "in": [
                        {
                            "default": true,
                            "id": "#main/trim_galore_rawdata/nogroup"
                        },
                        {
                            "source": "#main/quality",
                            "id": "#main/trim_galore_rawdata/quality"
                        },
                        {
                            "source": "#main/download_rawdata/fastq_files",
                            "id": "#main/trim_galore_rawdata/rrbs"
                        }
                    ],
                    "scatter": "#main/trim_galore_rawdata/rrbs",
                    "out": [
                        "#main/trim_galore_rawdata/fq"
                    ],
                    "id": "#main/trim_galore_rawdata"
                }
            ],
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#main/bismark_exec/bam",
                    "id": "#main/bam"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#main/fastqc_rawdata/output",
                    "id": "#main/fastqc_result_rawdata"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#main/fastqc_trimmed_data/output",
                    "id": "#main/fastqc_result_trimmed_data"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#main/bismark_exec/report",
                    "id": "#main/report"
                }
            ],
            "id": "#main"
        },
        {
            "class": "Workflow",
            "doc": "execute fastqc workflow",
            "requirements": [],
            "inputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "id": "#fastqc.cwl/fastq_files"
                },
                {
                    "type": "int",
                    "default": 4,
                    "id": "#fastqc.cwl/nthreads"
                }
            ],
            "steps": [
                {
                    "run": "#fastqc.cwl_2",
                    "in": [
                        {
                            "default": true,
                            "id": "#fastqc.cwl/fastqc/nogroup"
                        },
                        {
                            "source": "#fastqc.cwl/nthreads",
                            "id": "#fastqc.cwl/fastqc/nthreads"
                        },
                        {
                            "source": "#fastqc.cwl/fastq_files",
                            "id": "#fastqc.cwl/fastqc/seqfile"
                        }
                    ],
                    "out": [
                        "#fastqc.cwl/fastqc/fastqc_result"
                    ],
                    "id": "#fastqc.cwl/fastqc"
                }
            ],
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#fastqc.cwl/fastqc/fastqc_result",
                    "id": "#fastqc.cwl/output"
                }
            ],
            "id": "#fastqc.cwl"
        },
        {
            "class": "CommandLineTool",
            "label": "download-sra: A simple download tool to get .sra file",
            "doc": "A simple download tool to get .sra file from a repository of INSDC members. https://github.com/inutano/download-sra",
            "hints": [
                {
                    "dockerPull": "ghcr.io/inutano/download-sra:cb2bba4",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "download-sra"
            ],
            "inputs": [
                {
                    "type": "string",
                    "default": "ncbi",
                    "inputBinding": {
                        "position": 1,
                        "prefix": "-r"
                    },
                    "id": "#download-sra.cwl/repo"
                },
                {
                    "type": [
                        "string",
                        {
                            "type": "array",
                            "items": "string"
                        }
                    ],
                    "inputBinding": {
                        "position": 2
                    },
                    "id": "#download-sra.cwl/run_ids"
                }
            ],
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputBinding": {
                        "glob": "*sra"
                    },
                    "id": "#download-sra.cwl/sraFiles"
                }
            ],
            "id": "#download-sra.cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "label": "FastQC: A quality control tool for high throughput sequence data",
            "doc": "FastQC aims to provide a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines. It provides a modular set of analyses which you can use to give a quick impression of whether your data has any problems of which you should be aware before doing any further analysis. http://www.bioinformatics.babraham.ac.uk/projects/fastqc/",
            "hints": [
                {
                    "dockerPull": "quay.io/biocontainers/fastqc:0.11.7--pl5.22.0_2",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "fastqc"
            ],
            "arguments": [
                {
                    "prefix": "--outdir",
                    "valueFrom": "$(runtime.outdir)"
                }
            ],
            "inputs": [
                {
                    "label": "a non-default file which contains the list of adapter sequences which will be explicity searched against the library",
                    "doc": "Specifies a non-default file which contains the list of adapter sequences which will be explicity searched against the library. The file must contain sets of named adapters in the form name[tab]sequence. Lines prefixed with a hash will be ignored.",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "--adapters"
                    },
                    "id": "#fastqc.cwl_2/adapters"
                },
                {
                    "label": "Files come from raw casava output",
                    "doc": "Files come from raw casava output. Files in the same sample group (differing only by the group number) will be analysed as a set rather than individually. Sequences with the filter flag set in the header will be excluded from the analysis. Files must have the same names given to them by casava (including being gzipped and ending with .gz) otherwise they won't be grouped together correctly.",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": false,
                    "inputBinding": {
                        "prefix": "--casava"
                    },
                    "id": "#fastqc.cwl_2/casava"
                },
                {
                    "label": "a non-default file which contains the list of contaminants to screen overrepresented sequences against",
                    "doc": "Specifies a non-default file which contains the list of contaminants to screen overrepresented sequences against. The file must contain sets of named contaminants in the form name[tab]sequence. Lines prefixed with a hash will be ignored.",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "--contaminants"
                    },
                    "id": "#fastqc.cwl_2/contaminants"
                },
                {
                    "label": "a directory to be used for temporary files written when generating report images",
                    "doc": "Selects a directory to be used for temporary files written when generating report images. Defaults to system temp directory if not specified.",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "inputBinding": {
                        "prefix": "--dir"
                    },
                    "id": "#fastqc.cwl_2/dir"
                },
                {
                    "label": "the zipped output file will be uncompressed",
                    "doc": "If set then the zipped output file will be uncompressed in the same directory after it has been created. By default this option will be set if fastqc is run in non-interactive mode.",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": false,
                    "inputBinding": {
                        "prefix": "--extract"
                    },
                    "id": "#fastqc.cwl_2/extract"
                },
                {
                    "label": "Bypasses the normal sequence file format detection and forces the program to use the specified format",
                    "doc": "Bypasses the normal sequence file format detection and forces the program to use the specified format. Valid formats are bam,sam,bam_mapped,sam_mapped and fastq",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--format"
                    },
                    "id": "#fastqc.cwl_2/input_format"
                },
                {
                    "label": "the full path to the java binary you want to use to launch fastqc",
                    "doc": "Provides the full path to the java binary you want to use to launch fastqc. If not supplied then java is assumed to be in your path.",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "--java"
                    },
                    "id": "#fastqc.cwl_2/java"
                },
                {
                    "label": "the length of Kmer to look for in the Kmer content module",
                    "doc": "Specifies the length of Kmer to look for in the Kmer content module. Specified Kmer length must be between 2 and 10. Default length is 7 if not specified.",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "prefix": "--kmers"
                    },
                    "id": "#fastqc.cwl_2/kmers"
                },
                {
                    "label": "a non-default file which contains a set of criteria which will be used to determine the warn/error limits for the various modules",
                    "doc": "Specifies a non-default file which contains a set of criteria which will be used to determine the warn/error limits for the various modules. This file can also be used to selectively remove some modules from the output all together. The format needs to mirror the default limits.txt file found in the Configuration folder.",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "--limits"
                    },
                    "id": "#fastqc.cwl_2/limits"
                },
                {
                    "label": "Sets an artificial lower limit on the length of the sequence to be shown in the report",
                    "doc": "Sets an artificial lower limit on the length of the sequence to be shown in the report. As long as you set this to a value greater or equal to your longest read length then this will be the sequence length used to create your read groups. This can be useful for making directly comaparable statistics from datasets with somewhat variable read lengths.",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "prefix": "--min_length"
                    },
                    "id": "#fastqc.cwl_2/min_length"
                },
                {
                    "label": "Files come from naopore sequences and are in fast5 format",
                    "doc": "Files come from naopore sequences and are in fast5 format. In this mode you can pass in directories to process and the program will take in all fast5 files within those directories and produce a single output file from the sequences found in all files.",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": false,
                    "inputBinding": {
                        "prefix": "--nano"
                    },
                    "id": "#fastqc.cwl_2/nano"
                },
                {
                    "label": "Do not uncompress the output file",
                    "doc": "Do not uncompress the output file after creating it. You should set this option if you do not wish to uncompress the output when running in non-interactive mode.",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--noextract"
                    },
                    "id": "#fastqc.cwl_2/noextract"
                },
                {
                    "label": "If running with --casava then don't remove read flagged by casava as poor quality when performing the QC analysis.",
                    "doc": "If running with --casava then don't remove read flagged by casava as poor quality when performing the QC analysis.",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": false,
                    "inputBinding": {
                        "prefix": "--nofilter"
                    },
                    "id": "#fastqc.cwl_2/nofilter"
                },
                {
                    "label": "Disable grouping of bases for reads >50bp",
                    "doc": "Disable grouping of bases for reads >50bp. All reports will show data for every base in the read. WARNING: Using this option will cause fastqc to crash and burn if you use it on really long reads, and your plots may end up a ridiculous size. You have been warned!",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--nogroup"
                    },
                    "id": "#fastqc.cwl_2/nogroup"
                },
                {
                    "label": "the number of files which can be processed simultaneously",
                    "doc": "Specifies the number of files which can be processed simultaneously. Each thread will be allocated 250MB of memory so you shouldn't run more threads than your available memory will cope with, and not more than 6 threads on a 32 bit machine",
                    "type": "int",
                    "inputBinding": {
                        "prefix": "--threads"
                    },
                    "id": "#fastqc.cwl_2/nthreads"
                },
                {
                    "label": "Supress all progress messages on stdout and only report errors",
                    "doc": "Supress all progress messages on stdout and only report errors.",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": false,
                    "inputBinding": {
                        "prefix": "--quiet"
                    },
                    "id": "#fastqc.cwl_2/quiet"
                },
                {
                    "label": "a set of sequence files",
                    "doc": "a set of sequence files",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "position": 100
                    },
                    "id": "#fastqc.cwl_2/seqfile"
                }
            ],
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputBinding": {
                        "glob": "*_fastqc.zip"
                    },
                    "id": "#fastqc.cwl_2/fastqc_result"
                }
            ],
            "id": "#fastqc.cwl_2",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "label": "pfastq-dump: A bash implementation of parallel-fastq-dump, parallel fastq-dump wrapper",
            "doc": "pfastq-dump is a bash implementation of parallel-fastq-dump, parallel fastq-dump wrapper. --stdout option is additionally supported, but almost same features. It also uses -N and -X options of fastq-dump to specify blocks of data to be decompressed separately. https://github.com/inutano/pfastq-dump",
            "hints": [
                {
                    "dockerPull": "quay.io/inutano/sra-toolkit:v2.9.0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "pfastq-dump"
            ],
            "inputs": [
                {
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--gzip"
                    },
                    "id": "#pfastq-dump-multi.cwl/gzip"
                },
                {
                    "type": "int",
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#pfastq-dump-multi.cwl/nthreads"
                },
                {
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--readids"
                    },
                    "id": "#pfastq-dump-multi.cwl/readids"
                },
                {
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--skip-technical"
                    },
                    "id": "#pfastq-dump-multi.cwl/skip_technical"
                },
                {
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--split-files"
                    },
                    "id": "#pfastq-dump-multi.cwl/split_files"
                },
                {
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "default": true,
                    "inputBinding": {
                        "prefix": "--split-spot"
                    },
                    "id": "#pfastq-dump-multi.cwl/split_spot"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "position": 50
                    },
                    "id": "#pfastq-dump-multi.cwl/sraFiles"
                }
            ],
            "outputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "format": "http://edamontology.org/format_1930",
                    "outputBinding": {
                        "glob": "*fastq*"
                    },
                    "id": "#pfastq-dump-multi.cwl/fastqFiles"
                },
                {
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "format": "http://edamontology.org/format_1930",
                    "outputBinding": {
                        "glob": "*_1.fastq*"
                    },
                    "id": "#pfastq-dump-multi.cwl/forward"
                },
                {
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "format": "http://edamontology.org/format_1930",
                    "outputBinding": {
                        "glob": "*_2.fastq*"
                    },
                    "id": "#pfastq-dump-multi.cwl/reverse"
                }
            ],
            "id": "#pfastq-dump-multi.cwl",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0",
            "https://schema.org/codeRepository": "https://github.com/pitagora-network/pitagora-cwl",
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/identifier": "https://orcid.org/0000-0003-3777-5945",
                    "https://schema.org/email": "mailto:inutano@gmail.com",
                    "https://schema.org/name": "Tazro Ohta"
                }
            ]
        }
    ],
    "cwlVersion": "v1.0",
    "$schemas": [
        "http://edamontology.org/EDAM_1.18.owl",
        "https://schema.org/version/latest/schemaorg-current-http.rdf"
    ]
}
