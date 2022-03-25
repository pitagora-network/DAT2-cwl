{
    "$graph": [
        {
            "class": "CommandLineTool",
            "doc": "Output statistics of input sequence reads",
            "requirements": [
                {
                    "dockerPull": "ghcr.io/pitagora-network/bbmap-stats:1.0.0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "bash",
            "arguments": [
                {
                    "position": 0,
                    "valueFrom": "/bbmap/stats.sh"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#bbmap-stats.cwl/input_fastq"
                }
            ],
            "stdout": "bbmap-stats.txt",
            "stderr": "bbmap-stats-stderr.log",
            "id": "#bbmap-stats.cwl",
            "outputs": [
                {
                    "type": "File",
                    "id": "#bbmap-stats.cwl/stats",
                    "outputBinding": {
                        "glob": "bbmap-stats.txt"
                    }
                },
                {
                    "type": "File",
                    "id": "#bbmap-stats.cwl/stderr",
                    "outputBinding": {
                        "glob": "bbmap-stats-stderr.log"
                    }
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bwa:0.7.17--h84994c4_5",
                    "class": "DockerRequirement"
                },
                {
                    "listing": [
                        "$(inputs.input_fasta)"
                    ],
                    "class": "InitialWorkDirRequirement"
                }
            ],
            "baseCommand": [
                "bwa",
                "index"
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": "input fasta file",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#bwa-index.cwl/input_fasta"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.input_fasta.basename).amb"
                    },
                    "id": "#bwa-index.cwl/amb"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.input_fasta.basename).ann"
                    },
                    "id": "#bwa-index.cwl/ann"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.input_fasta.basename).bwt"
                    },
                    "id": "#bwa-index.cwl/bwt"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.input_fasta.basename).pac"
                    },
                    "id": "#bwa-index.cwl/pac"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.input_fasta.basename).sa"
                    },
                    "id": "#bwa-index.cwl/sa"
                },
                {
                    "type": "File",
                    "id": "#bwa-index.cwl/stderr",
                    "outputBinding": {
                        "glob": "bwa-index-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#bwa-index.cwl/stdout",
                    "outputBinding": {
                        "glob": "bwa-index-stdout.log"
                    }
                }
            ],
            "stdout": "bwa-index-stdout.log",
            "stderr": "bwa-index-stderr.log",
            "id": "#bwa-index.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bwa:0.7.17--h84994c4_5",
                    "class": "DockerRequirement"
                },
                {
                    "listing": [
                        "$(inputs.index_base)",
                        "$(inputs.amb)",
                        "$(inputs.ann)",
                        "$(inputs.bwt)",
                        "$(inputs.pac)",
                        "$(inputs.sa)"
                    ],
                    "class": "InitialWorkDirRequirement"
                }
            ],
            "baseCommand": [
                "bwa",
                "mem"
            ],
            "inputs": [
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/amb"
                },
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/ann"
                },
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/bwt"
                },
                {
                    "type": "File",
                    "label": "input fastq file to map (single-end or forward for pair-end)",
                    "inputBinding": {
                        "position": 2
                    },
                    "id": "#bwa-mem.cwl/fastq_forward"
                },
                {
                    "type": [
                        "null",
                        "File"
                    ],
                    "label": "input fastq file to map (reverse for pair-end)",
                    "inputBinding": {
                        "position": 3
                    },
                    "id": "#bwa-mem.cwl/fastq_reverse"
                },
                {
                    "type": [
                        "null",
                        "string"
                    ],
                    "label": "read group header line such as '@RG\tID:foo\tSM:bar'",
                    "inputBinding": {
                        "prefix": "-R"
                    },
                    "id": "#bwa-mem.cwl/group_header_line"
                },
                {
                    "type": "File",
                    "label": "fasta file for index basename",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#bwa-mem.cwl/index_base"
                },
                {
                    "type": "string",
                    "label": "sam file to output results to",
                    "default": "out.sam",
                    "inputBinding": {
                        "prefix": "-o"
                    },
                    "id": "#bwa-mem.cwl/output_sam"
                },
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/pac"
                },
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/sa"
                },
                {
                    "type": "int",
                    "label": "number of threads",
                    "default": 4,
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#bwa-mem.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.output_sam)"
                    },
                    "id": "#bwa-mem.cwl/output"
                },
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/stderr",
                    "outputBinding": {
                        "glob": "bwa-mem-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#bwa-mem.cwl/stdout",
                    "outputBinding": {
                        "glob": "bwa-mem-stdout.log"
                    }
                }
            ],
            "stdout": "bwa-mem-stdout.log",
            "stderr": "bwa-mem-stderr.log",
            "id": "#bwa-mem.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/jellyfish:1.1.12--h2d50403_0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "jellyfish",
                "count"
            ],
            "inputs": [
                {
                    "type": "boolean",
                    "label": "Count both strand, canonical representation",
                    "default": true,
                    "inputBinding": {
                        "prefix": "-C"
                    },
                    "id": "#jellyfish-count.cwl/both_strands"
                },
                {
                    "type": "File",
                    "label": "fasta or fastq file",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#jellyfish-count.cwl/input_file"
                },
                {
                    "type": "int",
                    "label": "Length of mer",
                    "default": 21,
                    "inputBinding": {
                        "prefix": "--mer-len"
                    },
                    "id": "#jellyfish-count.cwl/mer_len"
                },
                {
                    "type": "string",
                    "label": "Output prefix",
                    "default": "reads.jf",
                    "inputBinding": {
                        "prefix": "-o"
                    },
                    "id": "#jellyfish-count.cwl/output"
                },
                {
                    "type": "int",
                    "label": "Hash size",
                    "default": 1000000000,
                    "inputBinding": {
                        "prefix": "-s"
                    },
                    "id": "#jellyfish-count.cwl/size"
                },
                {
                    "type": "int",
                    "label": "Number of threads",
                    "default": 4,
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#jellyfish-count.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.output)_0"
                    },
                    "id": "#jellyfish-count.cwl/kmer0"
                },
                {
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.output)_1"
                    },
                    "id": "#jellyfish-count.cwl/kmer1"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputBinding": {
                        "glob": "$(inputs.output)*"
                    },
                    "id": "#jellyfish-count.cwl/kmers"
                },
                {
                    "type": "File",
                    "id": "#jellyfish-count.cwl/stderr",
                    "outputBinding": {
                        "glob": "jellyfish-count-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#jellyfish-count.cwl/stdout",
                    "outputBinding": {
                        "glob": "jellyfish-count-stdout.log"
                    }
                }
            ],
            "stdout": "jellyfish-count-stdout.log",
            "stderr": "jellyfish-count-stderr.log",
            "id": "#jellyfish-count.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/jellyfish:1.1.12--h2d50403_0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "jellyfish",
                "histo"
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": "jellyfish count output",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#jellyfish-histo.cwl/kmer_db"
                },
                {
                    "type": "int",
                    "default": 4,
                    "label": "Number of threads",
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#jellyfish-histo.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#jellyfish-histo.cwl/stderr",
                    "outputBinding": {
                        "glob": "jellyfish-histo-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#jellyfish-histo.cwl/stdout",
                    "outputBinding": {
                        "glob": "reads.histo"
                    }
                }
            ],
            "stdout": "reads.histo",
            "stderr": "jellyfish-histo-stderr.log",
            "id": "#jellyfish-histo.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/nanoplot:1.20.0--py36_0",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "NanoPlot",
            "inputs": [
                {
                    "type": "File",
                    "label": "sequence file",
                    "inputBinding": {
                        "prefix": "--fastq"
                    },
                    "id": "#nanoplot.cwl/sequence"
                },
                {
                    "type": "int",
                    "default": 2,
                    "label": "Set the allowed number of threads to be used by the script",
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#nanoplot.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "HistogramReadlength.png"
                    },
                    "id": "#nanoplot.cwl/HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "LengthvsQualityScatterPlot_dot.png"
                    },
                    "id": "#nanoplot.cwl/LengthvsQualityScatterPlot_dot"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "LengthvsQualityScatterPlot_kde.png"
                    },
                    "id": "#nanoplot.cwl/LengthvsQualityScatterPlot_kde"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "LogTransformed_HistogramReadlength.png"
                    },
                    "id": "#nanoplot.cwl/LogTransformed_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "NanoPlot-report.html"
                    },
                    "id": "#nanoplot.cwl/NanoPlot-report"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "NanoStats.txt"
                    },
                    "id": "#nanoplot.cwl/NanoStats"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "Weighted_HistogramReadlength.png"
                    },
                    "id": "#nanoplot.cwl/Weighted_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "Weighted_LogTransformed_HistogramReadlength.png"
                    },
                    "id": "#nanoplot.cwl/Weighted_LogTransformed_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "Yield_By_Length.png"
                    },
                    "id": "#nanoplot.cwl/Yield_By_Length"
                },
                {
                    "type": "File",
                    "id": "#nanoplot.cwl/stderr",
                    "outputBinding": {
                        "glob": "nanoplot-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#nanoplot.cwl/stdout",
                    "outputBinding": {
                        "glob": "nanoplot-stdout.log"
                    }
                }
            ],
            "stdout": "nanoplot-stdout.log",
            "stderr": "nanoplot-stderr.log",
            "id": "#nanoplot.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "Pilon for hybrid genome assembly",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/pilon:1.23--0",
                    "class": "DockerRequirement"
                },
                {
                    "listing": [
                        {
                            "entry": "$(inputs.aligned_bam)",
                            "entryname": "$(inputs.aligned_bam.basename)"
                        },
                        {
                            "entry": "$(inputs.bam_index)",
                            "entryname": "$(inputs.bam_index.basename)"
                        }
                    ],
                    "class": "InitialWorkDirRequirement"
                }
            ],
            "baseCommand": [
                "java"
            ],
            "arguments": [
                {
                    "position": -2,
                    "valueFrom": "-jar"
                },
                {
                    "position": -1,
                    "valueFrom": "/usr/local/share/pilon-1.23-0/pilon-1.23.jar"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": "A bam file of unknown type",
                    "doc": "A bam file of unknown type; Pilon will scan it and attempt to classify it",
                    "inputBinding": {
                        "prefix": "--bam"
                    },
                    "id": "#pilon.cwl/aligned_bam"
                },
                {
                    "type": "File",
                    "label": "A bam file index",
                    "id": "#pilon.cwl/bam_index"
                },
                {
                    "type": "File",
                    "label": "genome fasta file to be polished",
                    "inputBinding": {
                        "prefix": "--genome"
                    },
                    "id": "#pilon.cwl/genome_fasta"
                },
                {
                    "type": "string",
                    "default": "14g",
                    "label": "maximum memory size allocated for JVM",
                    "inputBinding": {
                        "prefix": "-Xms",
                        "separate": false,
                        "position": -3
                    },
                    "id": "#pilon.cwl/java_heapsize"
                },
                {
                    "type": "string",
                    "label": "Prefix for output files",
                    "default": "worm.pilon",
                    "inputBinding": {
                        "prefix": "--output"
                    },
                    "id": "#pilon.cwl/output_prefix"
                },
                {
                    "type": "int",
                    "label": "Degree of parallelism to use for certain processing",
                    "default": 4,
                    "doc": "Degree of parallelism to use for certain processing (default 1). Experimental.",
                    "inputBinding": {
                        "prefix": "--threads"
                    },
                    "id": "#pilon.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).fasta"
                    },
                    "id": "#pilon.cwl/fasta"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "*bam"
                    },
                    "id": "#pilon.cwl/out_bam"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "*bai"
                    },
                    "id": "#pilon.cwl/out_bam_index"
                },
                {
                    "type": "File",
                    "id": "#pilon.cwl/stderr",
                    "outputBinding": {
                        "glob": "pilon-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#pilon.cwl/stdout",
                    "outputBinding": {
                        "glob": "pilon-stdout.log"
                    }
                }
            ],
            "stdout": "pilon-stdout.log",
            "stderr": "pilon-stderr.log",
            "id": "#pilon.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "samtools index to create index for given bam file",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/samtools:1.9--h8571acd_11",
                    "class": "DockerRequirement"
                },
                {
                    "listing": [
                        "$(inputs.input_bamfile)"
                    ],
                    "class": "InitialWorkDirRequirement"
                }
            ],
            "baseCommand": [
                "samtools",
                "index"
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#samtools-index.cwl/input_bamfile"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.input_bamfile.basename).bai"
                    },
                    "id": "#samtools-index.cwl/bam_index"
                },
                {
                    "type": "File",
                    "id": "#samtools-index.cwl/stderr",
                    "outputBinding": {
                        "glob": "samtools-index-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#samtools-index.cwl/stdout",
                    "outputBinding": {
                        "glob": "samtools-index-stdout.log"
                    }
                }
            ],
            "stdout": "samtools-index-stdout.log",
            "stderr": "samtools-index-stderr.log",
            "id": "#samtools-index.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "samtools sort, sort given bam file",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/samtools:1.9--h8571acd_11",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "samtools",
                "sort"
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": "Input bamfile",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#samtools-sort.cwl/input_bamfile"
                },
                {
                    "type": "string",
                    "default": "aln.sorted.bam",
                    "label": "Write final output to FILENAME",
                    "inputBinding": {
                        "prefix": "-o"
                    },
                    "id": "#samtools-sort.cwl/output_bam"
                },
                {
                    "type": "int",
                    "default": 4,
                    "inputBinding": {
                        "prefix": "-@"
                    },
                    "id": "#samtools-sort.cwl/threads"
                },
                {
                    "type": "string",
                    "default": "sort.tmp",
                    "label": "Write temporary files to PREFIX.nnnn.bam",
                    "inputBinding": {
                        "prefix": "-T"
                    },
                    "id": "#samtools-sort.cwl/tmpfile"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.output_bam)"
                    },
                    "id": "#samtools-sort.cwl/sorted_bam"
                },
                {
                    "type": "File",
                    "id": "#samtools-sort.cwl/stderr",
                    "outputBinding": {
                        "glob": "samtools-sort-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#samtools-sort.cwl/stdout",
                    "outputBinding": {
                        "glob": "samtools-sort-stdout.log"
                    }
                }
            ],
            "stdout": "samtools-sort-stdout.log",
            "stderr": "samtools-sort-stderr.log",
            "id": "#samtools-sort.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "samtools view to convert sam format to bam format",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/samtools:1.9--h8571acd_11",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": [
                "samtools",
                "view"
            ],
            "inputs": [
                {
                    "type": [
                        "null",
                        "string"
                    ],
                    "label": "Do not output alignments with any bits set in INT present in the FLAG field. INT can be specified in hex by beginning with `0x' (i.e. /^0x[0-9A-F]+/) or in octal by beginning with `0' (i.e. /^0[0-7]+/) [0].",
                    "inputBinding": {
                        "prefix": "-F"
                    },
                    "id": "#samtools-view.cwl/filter_alignments"
                },
                {
                    "type": "boolean",
                    "label": "ignored for compatibility with previous samtools versions",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-S"
                    },
                    "id": "#samtools-view.cwl/ignore_previous_version"
                },
                {
                    "type": "boolean",
                    "label": "include the header in the output",
                    "default": false,
                    "inputBinding": {
                        "prefix": "-h"
                    },
                    "id": "#samtools-view.cwl/include_header"
                },
                {
                    "type": "File",
                    "label": "input file",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#samtools-view.cwl/input_file"
                },
                {
                    "type": "boolean",
                    "label": "output BAM",
                    "default": true,
                    "inputBinding": {
                        "prefix": "-b"
                    },
                    "id": "#samtools-view.cwl/output_bam"
                },
                {
                    "type": "string",
                    "label": "output file name",
                    "default": "aln.bam",
                    "inputBinding": {
                        "prefix": "-o"
                    },
                    "id": "#samtools-view.cwl/output_filename"
                },
                {
                    "type": [
                        "null",
                        "int"
                    ],
                    "label": "Skip alignments with MAPQ smaller than INT [0].",
                    "inputBinding": {
                        "prefix": "-q"
                    },
                    "id": "#samtools-view.cwl/skip_alignments"
                },
                {
                    "type": "int",
                    "label": "Number of additional threads to use",
                    "default": 4,
                    "inputBinding": {
                        "prefix": "-@"
                    },
                    "id": "#samtools-view.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    },
                    "id": "#samtools-view.cwl/bam"
                },
                {
                    "type": "File",
                    "id": "#samtools-view.cwl/stderr",
                    "outputBinding": {
                        "glob": "samtools-view-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#samtools-view.cwl/stdout",
                    "outputBinding": {
                        "glob": "samtools-view-stdout.log"
                    }
                }
            ],
            "stdout": "samtools-view-stdout.log",
            "stderr": "samtools-view-stderr.log",
            "id": "#samtools-view.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/inutano/wtdbg2:v2.2",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "wtdbg2",
            "inputs": [
                {
                    "type": "string",
                    "label": "Provide genome size, e.g. 100.4m, 2.3g. In this version, it is used with -X/--rdcov-cutoff in selecting reads just after readed all.",
                    "inputBinding": {
                        "prefix": "--genome-size"
                    },
                    "id": "#wtdbg2.cwl/genome_size"
                },
                {
                    "type": "string",
                    "label": "Prefix of output files (REQUIRED)",
                    "default": "worm.wtdbg2",
                    "inputBinding": {
                        "prefix": "-o"
                    },
                    "id": "#wtdbg2.cwl/output_prefix"
                },
                {
                    "type": "boolean",
                    "label": "Force to overwrite output files",
                    "default": true,
                    "inputBinding": {
                        "prefix": "-f"
                    },
                    "id": "#wtdbg2.cwl/overwrite"
                },
                {
                    "type": "File",
                    "label": "Long reads sequences file (REQUIRED; can be multiple)",
                    "inputBinding": {
                        "prefix": "-i"
                    },
                    "id": "#wtdbg2.cwl/sequence"
                },
                {
                    "type": "int",
                    "label": "Number of threads, 0 for all cores",
                    "default": 0,
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#wtdbg2.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "label": "Distribution of number of k-mers in a BIN",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).binkmer*"
                    },
                    "id": "#wtdbg2.cwl/binkmer"
                },
                {
                    "type": "File",
                    "label": "Filtered BINs",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).closed_bins*"
                    },
                    "id": "#wtdbg2.cwl/closed_bins"
                },
                {
                    "type": "File",
                    "label": "Reads clip information",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).clps*"
                    },
                    "id": "#wtdbg2.cwl/clps"
                },
                {
                    "type": "File",
                    "label": "Contigs layout file. Will be read by wtdbg-cns. This file is the main result of wtdbg",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).ctg.lay*"
                    },
                    "id": "#wtdbg2.cwl/contig_layout"
                },
                {
                    "type": "File",
                    "label": "DOT file for contigs",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).ctg.dot*"
                    },
                    "id": "#wtdbg2.cwl/dot_contig"
                },
                {
                    "type": "File",
                    "label": "DOT file after merging bubble and remove tips",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).3.dot*"
                    },
                    "id": "#wtdbg2.cwl/dot_file_after_merging_bubble"
                },
                {
                    "type": "File",
                    "label": "DOT file after transitive reduction",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).2.dot*"
                    },
                    "id": "#wtdbg2.cwl/dot_file_after_transitive_reduction"
                },
                {
                    "type": "File",
                    "label": "DOT file for initialized graph",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).1.dot*"
                    },
                    "id": "#wtdbg2.cwl/dot_file_initialized_graph"
                },
                {
                    "type": "File",
                    "label": "DOT file for unitigs",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).frg.dot*"
                    },
                    "id": "#wtdbg2.cwl/dot_unitigs"
                },
                {
                    "type": "File",
                    "label": "Log file of graph simplification",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).events*"
                    },
                    "id": "#wtdbg2.cwl/events"
                },
                {
                    "type": "File",
                    "label": "KBMAP file, all vs all alignments",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).alignments*"
                    },
                    "id": "#wtdbg2.cwl/kbmap"
                },
                {
                    "type": "File",
                    "label": "Distribution of k-mer depth",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).kmerdep*"
                    },
                    "id": "#wtdbg2.cwl/kmerdep"
                },
                {
                    "type": "File",
                    "label": "nodes and their positions in reads",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).1.nodes*"
                    },
                    "id": "#wtdbg2.cwl/nodes"
                },
                {
                    "type": "File",
                    "label": "unitigs and their nodes",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).frg.nodes*"
                    },
                    "id": "#wtdbg2.cwl/nodes_unitigs"
                },
                {
                    "type": "File",
                    "label": "reads and their nodes",
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).1.reads*"
                    },
                    "id": "#wtdbg2.cwl/reads"
                },
                {
                    "type": "File",
                    "label": "wtdbg print runtime information on progrom's STDERR stream. --quiet to disiable it",
                    "id": "#wtdbg2.cwl/stderr",
                    "outputBinding": {
                        "glob": "wtdbg2-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#wtdbg2.cwl/stdout",
                    "outputBinding": {
                        "glob": "wtdbg2-stdout.log"
                    }
                }
            ],
            "stdout": "wtdbg2-stdout.log",
            "stderr": "wtdbg2-stderr.log",
            "id": "#wtdbg2.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "string",
            "requirements": [
                {
                    "dockerPull": "quay.io/inutano/wtdbg2:v2.2",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "wtpoa-cns",
            "inputs": [
                {
                    "type": "File",
                    "label": "Input file(s) *.ctg.lay from wtdbg",
                    "inputBinding": {
                        "prefix": "-i"
                    },
                    "id": "#wtpoa-cns.cwl/input_contigs"
                },
                {
                    "type": "string",
                    "default": "worm.wtdbg2.fa",
                    "label": "Output files",
                    "inputBinding": {
                        "prefix": "-o"
                    },
                    "id": "#wtpoa-cns.cwl/output_filename"
                },
                {
                    "type": "boolean",
                    "default": true,
                    "label": "Force overwrite",
                    "inputBinding": {
                        "prefix": "-f"
                    },
                    "id": "#wtpoa-cns.cwl/overwrite"
                },
                {
                    "type": "int",
                    "default": 32,
                    "label": "Number of threads",
                    "inputBinding": {
                        "prefix": "-t"
                    },
                    "id": "#wtpoa-cns.cwl/threads"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.output_filename)"
                    },
                    "id": "#wtpoa-cns.cwl/output_file"
                },
                {
                    "type": "File",
                    "id": "#wtpoa-cns.cwl/stderr",
                    "outputBinding": {
                        "glob": "wtpoa-cns-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#wtpoa-cns.cwl/stdout",
                    "outputBinding": {
                        "glob": "wtpoa-cns-stdout.log"
                    }
                }
            ],
            "stdout": "wtpoa-cns-stdout.log",
            "stderr": "wtpoa-cns-stderr.log",
            "id": "#wtpoa-cns.cwl"
        },
        {
            "class": "Workflow",
            "doc": "Animal Genome Assembly pipeline by Kazuharu Arakawa (@gaou_ak) without assembly step by canu, CWLized by Tazro Ohta (@inutano)",
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "string",
                    "id": "#main/ESTIMATED_GENOME_SIZE"
                },
                {
                    "type": "File",
                    "id": "#main/INPUT_LONGREAD"
                },
                {
                    "type": "File",
                    "id": "#main/INPUT_SHORTREAD"
                },
                {
                    "type": "int",
                    "id": "#main/THREADS"
                }
            ],
            "steps": [
                {
                    "run": "#bbmap-stats.cwl",
                    "in": [
                        {
                            "source": "#main/INPUT_LONGREAD",
                            "id": "#main/bbmap-stats-initial/input_fastq"
                        }
                    ],
                    "out": [
                        "#main/bbmap-stats-initial/stats"
                    ],
                    "id": "#main/bbmap-stats-initial"
                },
                {
                    "run": "#bbmap-stats.cwl",
                    "in": [
                        {
                            "source": "#main/wtpoa-cns/output_file",
                            "id": "#main/bbmap-stats-wtdbg2-contigs/input_fastq"
                        }
                    ],
                    "out": [
                        "#main/bbmap-stats-wtdbg2-contigs/stats"
                    ],
                    "id": "#main/bbmap-stats-wtdbg2-contigs"
                },
                {
                    "run": "#hybrid_error_correction.cwl",
                    "in": [
                        {
                            "source": "#main/wtpoa-cns/output_file",
                            "id": "#main/error_correction1/INPUT_FASTA"
                        },
                        {
                            "source": "#main/INPUT_SHORTREAD",
                            "id": "#main/error_correction1/INPUT_SHORTREAD"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/error_correction1/THREADS"
                        }
                    ],
                    "out": [
                        "#main/error_correction1/fasta"
                    ],
                    "id": "#main/error_correction1"
                },
                {
                    "run": "#hybrid_error_correction.cwl",
                    "in": [
                        {
                            "source": "#main/error_correction1/fasta",
                            "id": "#main/error_correction2/INPUT_FASTA"
                        },
                        {
                            "source": "#main/INPUT_SHORTREAD",
                            "id": "#main/error_correction2/INPUT_SHORTREAD"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/error_correction2/THREADS"
                        }
                    ],
                    "out": [
                        "#main/error_correction2/fasta"
                    ],
                    "id": "#main/error_correction2"
                },
                {
                    "run": "#hybrid_error_correction.cwl",
                    "in": [
                        {
                            "source": "#main/error_correction2/fasta",
                            "id": "#main/error_correction3/INPUT_FASTA"
                        },
                        {
                            "source": "#main/INPUT_SHORTREAD",
                            "id": "#main/error_correction3/INPUT_SHORTREAD"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/error_correction3/THREADS"
                        }
                    ],
                    "out": [
                        "#main/error_correction3/fasta"
                    ],
                    "id": "#main/error_correction3"
                },
                {
                    "run": "#hybrid_error_correction.cwl",
                    "in": [
                        {
                            "source": "#main/error_correction3/fasta",
                            "id": "#main/error_correction4/INPUT_FASTA"
                        },
                        {
                            "source": "#main/INPUT_SHORTREAD",
                            "id": "#main/error_correction4/INPUT_SHORTREAD"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/error_correction4/THREADS"
                        }
                    ],
                    "out": [
                        "#main/error_correction4/fasta"
                    ],
                    "id": "#main/error_correction4"
                },
                {
                    "run": "#jellyfish-count.cwl",
                    "in": [
                        {
                            "source": "#main/INPUT_SHORTREAD",
                            "id": "#main/jellyfish-count/input_file"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/jellyfish-count/threads"
                        }
                    ],
                    "out": [
                        "#main/jellyfish-count/kmer0"
                    ],
                    "id": "#main/jellyfish-count"
                },
                {
                    "run": "#jellyfish-histo.cwl",
                    "in": [
                        {
                            "source": "#main/jellyfish-count/kmer0",
                            "id": "#main/jellyfish-histo/kmer_db"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/jellyfish-histo/threads"
                        }
                    ],
                    "out": [
                        "#main/jellyfish-histo/stdout"
                    ],
                    "id": "#main/jellyfish-histo"
                },
                {
                    "run": "#nanoplot.cwl",
                    "in": [
                        {
                            "source": "#main/INPUT_LONGREAD",
                            "id": "#main/nanoplot/sequence"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/nanoplot/threads"
                        }
                    ],
                    "out": [
                        "#main/nanoplot/HistogramReadlength",
                        "#main/nanoplot/LogTransformed_HistogramReadlength",
                        "#main/nanoplot/Yield_By_Length",
                        "#main/nanoplot/LengthvsQualityScatterPlot_dot",
                        "#main/nanoplot/Weighted_HistogramReadlength",
                        "#main/nanoplot/LengthvsQualityScatterPlot_kde",
                        "#main/nanoplot/Weighted_LogTransformed_HistogramReadlength",
                        "#main/nanoplot/NanoPlot-report",
                        "#main/nanoplot/NanoStats"
                    ],
                    "id": "#main/nanoplot"
                },
                {
                    "run": "#wtdbg2.cwl",
                    "in": [
                        {
                            "source": "#main/ESTIMATED_GENOME_SIZE",
                            "id": "#main/wtdbg2/genome_size"
                        },
                        {
                            "source": "#main/INPUT_LONGREAD",
                            "id": "#main/wtdbg2/sequence"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/wtdbg2/threads"
                        }
                    ],
                    "out": [
                        "#main/wtdbg2/dot_file_initialized_graph",
                        "#main/wtdbg2/nodes",
                        "#main/wtdbg2/reads",
                        "#main/wtdbg2/dot_file_after_transitive_reduction",
                        "#main/wtdbg2/dot_file_after_merging_bubble",
                        "#main/wtdbg2/kbmap",
                        "#main/wtdbg2/binkmer",
                        "#main/wtdbg2/closed_bins",
                        "#main/wtdbg2/clps",
                        "#main/wtdbg2/dot_contig",
                        "#main/wtdbg2/contig_layout",
                        "#main/wtdbg2/events",
                        "#main/wtdbg2/dot_unitigs",
                        "#main/wtdbg2/nodes_unitigs",
                        "#main/wtdbg2/kmerdep"
                    ],
                    "id": "#main/wtdbg2"
                },
                {
                    "run": "#wtpoa-cns.cwl",
                    "in": [
                        {
                            "source": "#main/wtdbg2/contig_layout",
                            "id": "#main/wtpoa-cns/input_contigs"
                        },
                        {
                            "source": "#main/THREADS",
                            "id": "#main/wtpoa-cns/threads"
                        }
                    ],
                    "out": [
                        "#main/wtpoa-cns/output_file"
                    ],
                    "id": "#main/wtpoa-cns"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/bbmap-stats-initial/stats",
                    "id": "#main/bbmap-stats-initial_stats"
                },
                {
                    "type": "File",
                    "outputSource": "#main/bbmap-stats-wtdbg2-contigs/stats",
                    "id": "#main/bbmap-stats-wtdbg2-contigs_stats"
                },
                {
                    "type": "File",
                    "outputSource": "#main/error_correction1/fasta",
                    "id": "#main/error_corrected_fasta_1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/error_correction2/fasta",
                    "id": "#main/error_corrected_fasta_2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/error_correction3/fasta",
                    "id": "#main/error_corrected_fasta_3"
                },
                {
                    "type": "File",
                    "outputSource": "#main/error_correction4/fasta",
                    "id": "#main/error_corrected_fasta_4"
                },
                {
                    "type": "File",
                    "outputSource": "#main/jellyfish-histo/stdout",
                    "id": "#main/jellyfish-histo_stdout"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/HistogramReadlength",
                    "id": "#main/nanoplot_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/LengthvsQualityScatterPlot_dot",
                    "id": "#main/nanoplot_LengthvsQualityScatterPlot_dot"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/LengthvsQualityScatterPlot_kde",
                    "id": "#main/nanoplot_LengthvsQualityScatterPlot_kde"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/LogTransformed_HistogramReadlength",
                    "id": "#main/nanoplot_LogTransformed_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/NanoPlot-report",
                    "id": "#main/nanoplot_NanoPlot-report"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/NanoStats",
                    "id": "#main/nanoplot_NanoStats"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/Weighted_HistogramReadlength",
                    "id": "#main/nanoplot_Weighted_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/Weighted_LogTransformed_HistogramReadlength",
                    "id": "#main/nanoplot_Weighted_LogTransformed_HistogramReadlength"
                },
                {
                    "type": "File",
                    "outputSource": "#main/nanoplot/Yield_By_Length",
                    "id": "#main/nanoplot_Yield_By_Length"
                },
                {
                    "type": "File",
                    "outputSource": "#main/wtpoa-cns/output_file",
                    "id": "#main/wtpoa-cns_output_file"
                }
            ],
            "id": "#main"
        },
        {
            "class": "Workflow",
            "doc": "Sub workflow used in the Animal Genome Assembly pipeline by Kazuharu Arakawa (@gaou_ak), CWLized by Tazro Ohta (@inutano)",
            "requirements": [],
            "inputs": [
                {
                    "type": "File",
                    "id": "#hybrid_error_correction.cwl/INPUT_FASTA"
                },
                {
                    "type": "File",
                    "id": "#hybrid_error_correction.cwl/INPUT_SHORTREAD"
                },
                {
                    "type": "int",
                    "id": "#hybrid_error_correction.cwl/THREADS"
                }
            ],
            "steps": [
                {
                    "run": "#bwa-index.cwl",
                    "in": [
                        {
                            "source": "#hybrid_error_correction.cwl/INPUT_FASTA",
                            "id": "#hybrid_error_correction.cwl/bwa-index/input_fasta"
                        }
                    ],
                    "out": [
                        "#hybrid_error_correction.cwl/bwa-index/amb",
                        "#hybrid_error_correction.cwl/bwa-index/ann",
                        "#hybrid_error_correction.cwl/bwa-index/bwt",
                        "#hybrid_error_correction.cwl/bwa-index/pac",
                        "#hybrid_error_correction.cwl/bwa-index/sa"
                    ],
                    "id": "#hybrid_error_correction.cwl/bwa-index"
                },
                {
                    "run": "#bwa-mem.cwl",
                    "in": [
                        {
                            "source": "#hybrid_error_correction.cwl/bwa-index/amb",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/amb"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/bwa-index/ann",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/ann"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/bwa-index/bwt",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/bwt"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/INPUT_SHORTREAD",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/fastq_forward"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/INPUT_FASTA",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/index_base"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/bwa-index/pac",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/pac"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/bwa-index/sa",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/sa"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/THREADS",
                            "id": "#hybrid_error_correction.cwl/bwa-mem/threads"
                        }
                    ],
                    "out": [
                        "#hybrid_error_correction.cwl/bwa-mem/output"
                    ],
                    "id": "#hybrid_error_correction.cwl/bwa-mem"
                },
                {
                    "run": "#pilon.cwl",
                    "in": [
                        {
                            "source": "#hybrid_error_correction.cwl/samtools-sort/sorted_bam",
                            "id": "#hybrid_error_correction.cwl/pilon/aligned_bam"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/samtools-index/bam_index",
                            "id": "#hybrid_error_correction.cwl/pilon/bam_index"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/INPUT_FASTA",
                            "id": "#hybrid_error_correction.cwl/pilon/genome_fasta"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/THREADS",
                            "id": "#hybrid_error_correction.cwl/pilon/threads"
                        }
                    ],
                    "out": [
                        "#hybrid_error_correction.cwl/pilon/fasta"
                    ],
                    "id": "#hybrid_error_correction.cwl/pilon"
                },
                {
                    "run": "#samtools-index.cwl",
                    "in": [
                        {
                            "source": "#hybrid_error_correction.cwl/samtools-sort/sorted_bam",
                            "id": "#hybrid_error_correction.cwl/samtools-index/input_bamfile"
                        }
                    ],
                    "out": [
                        "#hybrid_error_correction.cwl/samtools-index/bam_index"
                    ],
                    "id": "#hybrid_error_correction.cwl/samtools-index"
                },
                {
                    "run": "#samtools-sort.cwl",
                    "in": [
                        {
                            "source": "#hybrid_error_correction.cwl/samtools-view/bam",
                            "id": "#hybrid_error_correction.cwl/samtools-sort/input_bamfile"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/THREADS",
                            "id": "#hybrid_error_correction.cwl/samtools-sort/threads"
                        }
                    ],
                    "out": [
                        "#hybrid_error_correction.cwl/samtools-sort/sorted_bam"
                    ],
                    "id": "#hybrid_error_correction.cwl/samtools-sort"
                },
                {
                    "run": "#samtools-view.cwl",
                    "in": [
                        {
                            "source": "#hybrid_error_correction.cwl/bwa-mem/output",
                            "id": "#hybrid_error_correction.cwl/samtools-view/input_file"
                        },
                        {
                            "source": "#hybrid_error_correction.cwl/THREADS",
                            "id": "#hybrid_error_correction.cwl/samtools-view/threads"
                        }
                    ],
                    "out": [
                        "#hybrid_error_correction.cwl/samtools-view/bam"
                    ],
                    "id": "#hybrid_error_correction.cwl/samtools-view"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#hybrid_error_correction.cwl/pilon/fasta",
                    "id": "#hybrid_error_correction.cwl/fasta"
                }
            ],
            "id": "#hybrid_error_correction.cwl"
        }
    ],
    "cwlVersion": "v1.0"
}
