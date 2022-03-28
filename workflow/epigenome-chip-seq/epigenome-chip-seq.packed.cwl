{
    "$graph": [
        {
            "class": "CommandLineTool",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/macs2:2.1.2--py27r351h14c3975_1",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": [
                "macs2",
                "callpeak"
            ],
            "arguments": [
                {
                    "position": 2,
                    "prefix": "-f",
                    "valueFrom": "BAM"
                },
                {
                    "position": 4,
                    "prefix": "-n",
                    "valueFrom": "$(inputs.target_bam.nameroot)"
                },
                {
                    "position": 5,
                    "prefix": "-B",
                    "valueFrom": "$(true)"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-c",
                        "position": 1
                    },
                    "id": "#MACS2-callpeak.cwl/control_bam"
                },
                {
                    "type": "string",
                    "default": "mm",
                    "label": "mouse: mm, human: hs",
                    "inputBinding": {
                        "prefix": "-g",
                        "position": 3
                    },
                    "id": "#MACS2-callpeak.cwl/organism"
                },
                {
                    "type": "float",
                    "default": 0.01,
                    "inputBinding": {
                        "prefix": "-q",
                        "position": 6
                    },
                    "id": "#MACS2-callpeak.cwl/p-value"
                },
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-t",
                        "position": 0
                    },
                    "id": "#MACS2-callpeak.cwl/target_bam"
                }
            ],
            "stdout": "MACS2-stdout.log",
            "stderr": "MACS2-stderr.log",
            "id": "#MACS2-callpeak.cwl",
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.target_bam.nameroot)_control_lambda.bdg"
                    },
                    "id": "#MACS2-callpeak.cwl/control-lambda-bdg"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.target_bam.nameroot)_model.r"
                    },
                    "id": "#MACS2-callpeak.cwl/model-r"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.target_bam.nameroot)_peaks.narrowPeak"
                    },
                    "id": "#MACS2-callpeak.cwl/peaks-narrow-peak"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.target_bam.nameroot)_peaks.xls"
                    },
                    "id": "#MACS2-callpeak.cwl/peaks-xls"
                },
                {
                    "type": "File",
                    "id": "#MACS2-callpeak.cwl/stderr",
                    "outputBinding": {
                        "glob": "MACS2-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#MACS2-callpeak.cwl/stdout",
                    "outputBinding": {
                        "glob": "MACS2-stdout.log"
                    }
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.target_bam.nameroot)_summits.bed"
                    },
                    "id": "#MACS2-callpeak.cwl/summits-bed"
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.target_bam.nameroot)_treat_pileup.bdg"
                    },
                    "id": "#MACS2-callpeak.cwl/treat-pileup-bdg"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "doc": "bedtools intersect allows one to screen for overlaps between two sets of genomic features.",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bedtools:2.27.0--he860b03_3",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": [
                "bedtools",
                "intersect"
            ],
            "arguments": [
                {
                    "position": 0,
                    "prefix": "-v",
                    "valueFrom": "$(true)"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "doc": "Each feature in A is compared to B in search of overlaps",
                    "inputBinding": {
                        "position": 1,
                        "prefix": "-a"
                    },
                    "id": "#bedtools_intersect_no_overlap.cwl/peaks_narrow_peak_a"
                },
                {
                    "type": "File",
                    "doc": "One or more BAM/BED/GFF/VCF file(s)",
                    "inputBinding": {
                        "position": 2,
                        "prefix": "-b"
                    },
                    "id": "#bedtools_intersect_no_overlap.cwl/peaks_narrow_peak_b"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#bedtools_intersect_no_overlap.cwl/result-narrow-peak",
                    "outputBinding": {
                        "glob": "$(inputs.peaks_narrow_peak_a.nameroot).not_overlapped_with_$(inputs.peaks_narrow_peak_b.nameroot).narrowPeak"
                    }
                },
                {
                    "type": "File",
                    "id": "#bedtools_intersect_no_overlap.cwl/stderr",
                    "outputBinding": {
                        "glob": "bedtools_intersect_overlap-stderr.log"
                    }
                }
            ],
            "stdout": "$(inputs.peaks_narrow_peak_a.nameroot).not_overlapped_with_$(inputs.peaks_narrow_peak_b.nameroot).narrowPeak",
            "stderr": "bedtools_intersect_overlap-stderr.log",
            "id": "#bedtools_intersect_no_overlap.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "bedtools intersect allows one to screen for overlaps between two sets of genomic features.",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bedtools:2.27.0--he860b03_3",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": [
                "bedtools",
                "intersect"
            ],
            "arguments": [
                {
                    "position": 0,
                    "prefix": "-u",
                    "valueFrom": "$(true)"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "doc": "Each feature in A is compared to B in search of overlaps",
                    "inputBinding": {
                        "position": 1,
                        "prefix": "-a"
                    },
                    "id": "#bedtools_intersect_overlap.cwl/peaks_narrow_peak_a"
                },
                {
                    "type": "File",
                    "doc": "One or more BAM/BED/GFF/VCF file(s)",
                    "inputBinding": {
                        "position": 2,
                        "prefix": "-b"
                    },
                    "id": "#bedtools_intersect_overlap.cwl/peaks_narrow_peak_b"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#bedtools_intersect_overlap.cwl/result-narrow-peak",
                    "outputBinding": {
                        "glob": "$(inputs.peaks_narrow_peak_a.nameroot).overlapped_with_$(inputs.peaks_narrow_peak_b.nameroot).narrowPeak"
                    }
                },
                {
                    "type": "File",
                    "id": "#bedtools_intersect_overlap.cwl/stderr",
                    "outputBinding": {
                        "glob": "bedtools_intersect_overlap-stderr.log"
                    }
                }
            ],
            "stdout": "$(inputs.peaks_narrow_peak_a.nameroot).overlapped_with_$(inputs.peaks_narrow_peak_b.nameroot).narrowPeak",
            "stderr": "bedtools_intersect_overlap-stderr.log",
            "id": "#bedtools_intersect_overlap.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "A fast and sensitive gapped read aligner",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/bowtie2:2.3.5--py36he860b03_0",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": "bowtie2",
            "arguments": [
                {
                    "prefix": "-S",
                    "position": 3,
                    "valueFrom": "$(inputs.fastq.basename.replace('.gz', '').replace('.fastq', '').replace('.fq', '')).sam"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-U",
                        "position": 1
                    },
                    "id": "#bowtie2-se.cwl/fastq"
                },
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-x",
                        "position": 0,
                        "valueFrom": "$(inputs.genome_index.dirname)/$(inputs.genome_index.nameroot)"
                    },
                    "secondaryFiles": [
                        "^.1.bt2",
                        "^.2.bt2",
                        "^.3.bt2",
                        "^.4.bt2",
                        "^.rev.1.bt2",
                        "^.rev.2.bt2"
                    ],
                    "id": "#bowtie2-se.cwl/genome_index"
                },
                {
                    "type": "int",
                    "default": 4,
                    "inputBinding": {
                        "prefix": "-p",
                        "position": 2
                    },
                    "id": "#bowtie2-se.cwl/num_process"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.fastq.basename.replace('.gz', '').replace('.fastq', '').replace('.fq', '')).sam"
                    },
                    "id": "#bowtie2-se.cwl/sam"
                },
                {
                    "type": "File",
                    "id": "#bowtie2-se.cwl/stderr",
                    "outputBinding": {
                        "glob": "bowtie2-pe-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#bowtie2-se.cwl/stdout",
                    "outputBinding": {
                        "glob": "bowtie2-pe-stdout.log"
                    }
                }
            ],
            "stdout": "bowtie2-pe-stdout.log",
            "stderr": "bowtie2-pe-stderr.log",
            "id": "#bowtie2-se.cwl"
        },
        {
            "class": "CommandLineTool",
            "doc": "An ultra-fast all-in-one FASTQ preprocessor (QC/adapters/trimming/filtering/splitting/merging...)",
            "requirements": [
                {
                    "dockerPull": "quay.io/biocontainers/fastp:0.20.0--hdbcaa40_0",
                    "class": "DockerRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "baseCommand": "fastp",
            "arguments": [
                {
                    "prefix": "-o",
                    "position": 1,
                    "valueFrom": "$(inputs.fastq.basename.replace('.fq', '').replace('.fastq', '').replace('.gz', '')).trim.fastq.gz"
                },
                {
                    "prefix": "--html",
                    "position": 2,
                    "valueFrom": "$(inputs.fastq.nameroot).fastp.html"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "prefix": "-i",
                        "position": 0
                    },
                    "id": "#fastp-se-html.cwl/fastq"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.fastq.nameroot).fastp.html"
                    },
                    "id": "#fastp-se-html.cwl/html"
                },
                {
                    "type": "File",
                    "id": "#fastp-se-html.cwl/stderr",
                    "outputBinding": {
                        "glob": "fastp-se-html-stderr.log"
                    }
                },
                {
                    "type": "File",
                    "id": "#fastp-se-html.cwl/stdout",
                    "outputBinding": {
                        "glob": "fastp-se-html-stdout.log"
                    }
                },
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.fastq.basename.replace('.fq', '').replace('.fastq', '').replace('.gz', '')).trim.fastq.gz"
                    },
                    "id": "#fastp-se-html.cwl/trimmed_fastq"
                }
            ],
            "stdout": "fastp-se-html-stdout.log",
            "stderr": "fastp-se-html-stderr.log",
            "id": "#fastp-se-html.cwl"
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
            "class": "Workflow",
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                },
                {
                    "class": "StepInputExpressionRequirement"
                },
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "secondaryFiles": [
                        "^.1.bt2",
                        "^.2.bt2",
                        "^.3.bt2",
                        "^.4.bt2",
                        "^.rev.1.bt2",
                        "^.rev.2.bt2"
                    ],
                    "id": "#main/bowtie2_genome_index"
                },
                {
                    "type": "File",
                    "id": "#main/fastq1"
                },
                {
                    "type": "File",
                    "id": "#main/fastq2"
                },
                {
                    "type": "File",
                    "id": "#main/macs2_control_bam"
                },
                {
                    "type": "string",
                    "default": "mm",
                    "label": "mouse: mm, human: hs",
                    "id": "#main/macs2_organism"
                },
                {
                    "type": "float",
                    "default": 0.01,
                    "id": "#main/macs2_p_value"
                },
                {
                    "type": "int",
                    "default": 4,
                    "id": "#main/nthreads"
                },
                {
                    "type": "string",
                    "default": "0x4",
                    "id": "#main/samtools_filter_alignments"
                },
                {
                    "type": "int",
                    "default": 42,
                    "id": "#main/samtools_skip_alignments"
                }
            ],
            "steps": [
                {
                    "run": "#bedtools_intersect_no_overlap.cwl",
                    "in": [
                        {
                            "source": "#main/macs2-fastq1/macs2-peaks-narrow-peak",
                            "id": "#main/bedtools-intersect-no-overlap/peaks_narrow_peak_a"
                        },
                        {
                            "source": "#main/macs2-fastq2/macs2-peaks-narrow-peak",
                            "id": "#main/bedtools-intersect-no-overlap/peaks_narrow_peak_b"
                        }
                    ],
                    "out": [
                        "#main/bedtools-intersect-no-overlap/result-narrow-peak"
                    ],
                    "id": "#main/bedtools-intersect-no-overlap"
                },
                {
                    "run": "#bedtools_intersect_overlap.cwl",
                    "in": [
                        {
                            "source": "#main/macs2-fastq1/macs2-peaks-narrow-peak",
                            "id": "#main/bedtools-intersect-overlap/peaks_narrow_peak_a"
                        },
                        {
                            "source": "#main/macs2-fastq2/macs2-peaks-narrow-peak",
                            "id": "#main/bedtools-intersect-overlap/peaks_narrow_peak_b"
                        }
                    ],
                    "out": [
                        "#main/bedtools-intersect-overlap/result-narrow-peak"
                    ],
                    "id": "#main/bedtools-intersect-overlap"
                },
                {
                    "run": "#macs2.cwl",
                    "in": [
                        {
                            "source": "#main/bowtie2_genome_index",
                            "id": "#main/macs2-fastq1/bowtie2_genome_index"
                        },
                        {
                            "source": "#main/fastq1",
                            "id": "#main/macs2-fastq1/fastq"
                        },
                        {
                            "source": "#main/macs2_control_bam",
                            "id": "#main/macs2-fastq1/macs2_control_bam"
                        },
                        {
                            "source": "#main/macs2_organism",
                            "id": "#main/macs2-fastq1/macs2_organism"
                        },
                        {
                            "source": "#main/macs2_p_value",
                            "id": "#main/macs2-fastq1/macs2_p_value"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/macs2-fastq1/nthreads"
                        },
                        {
                            "source": "#main/samtools_filter_alignments",
                            "id": "#main/macs2-fastq1/samtools_filter_alignments"
                        },
                        {
                            "source": "#main/samtools_skip_alignments",
                            "id": "#main/macs2-fastq1/samtools_skip_alignments"
                        }
                    ],
                    "out": [
                        "#main/macs2-fastq1/fastqc-result",
                        "#main/macs2-fastq1/fastp-trimmed-fastq",
                        "#main/macs2-fastq1/fastp-html",
                        "#main/macs2-fastq1/bowtie2-sam",
                        "#main/macs2-fastq1/samtools-view-bam",
                        "#main/macs2-fastq1/samtools-index-bam-index",
                        "#main/macs2-fastq1/macs2-model-r",
                        "#main/macs2-fastq1/macs2-peaks-narrow-peak",
                        "#main/macs2-fastq1/macs2-peaks-xls",
                        "#main/macs2-fastq1/macs2-summits-bed",
                        "#main/macs2-fastq1/macs2-treat-pileup-bdg",
                        "#main/macs2-fastq1/macs2-control-lambda-bdg"
                    ],
                    "id": "#main/macs2-fastq1"
                },
                {
                    "run": "#macs2.cwl",
                    "in": [
                        {
                            "source": "#main/bowtie2_genome_index",
                            "id": "#main/macs2-fastq2/bowtie2_genome_index"
                        },
                        {
                            "source": "#main/fastq2",
                            "id": "#main/macs2-fastq2/fastq"
                        },
                        {
                            "source": "#main/macs2_control_bam",
                            "id": "#main/macs2-fastq2/macs2_control_bam"
                        },
                        {
                            "source": "#main/macs2_organism",
                            "id": "#main/macs2-fastq2/macs2_organism"
                        },
                        {
                            "source": "#main/macs2_p_value",
                            "id": "#main/macs2-fastq2/macs2_p_value"
                        },
                        {
                            "source": "#main/nthreads",
                            "id": "#main/macs2-fastq2/nthreads"
                        },
                        {
                            "source": "#main/samtools_filter_alignments",
                            "id": "#main/macs2-fastq2/samtools_filter_alignments"
                        },
                        {
                            "source": "#main/samtools_skip_alignments",
                            "id": "#main/macs2-fastq2/samtools_skip_alignments"
                        }
                    ],
                    "out": [
                        "#main/macs2-fastq2/fastqc-result",
                        "#main/macs2-fastq2/fastp-trimmed-fastq",
                        "#main/macs2-fastq2/fastp-html",
                        "#main/macs2-fastq2/bowtie2-sam",
                        "#main/macs2-fastq2/samtools-view-bam",
                        "#main/macs2-fastq2/samtools-index-bam-index",
                        "#main/macs2-fastq2/macs2-model-r",
                        "#main/macs2-fastq2/macs2-peaks-narrow-peak",
                        "#main/macs2-fastq2/macs2-peaks-xls",
                        "#main/macs2-fastq2/macs2-summits-bed",
                        "#main/macs2-fastq2/macs2-treat-pileup-bdg",
                        "#main/macs2-fastq2/macs2-control-lambda-bdg"
                    ],
                    "id": "#main/macs2-fastq2"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/bowtie2-sam",
                    "id": "#main/bowtie2-sam-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/bowtie2-sam",
                    "id": "#main/bowtie2-sam-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/fastp-html",
                    "id": "#main/fastp-html-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/fastp-html",
                    "id": "#main/fastp-html-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/fastp-trimmed-fastq",
                    "id": "#main/fastp-trimmed-fastq-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/fastp-trimmed-fastq",
                    "id": "#main/fastp-trimmed-fastq-fastq2"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#main/macs2-fastq1/fastqc-result",
                    "id": "#main/fastqc-result-fastq1"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#main/macs2-fastq2/fastqc-result",
                    "id": "#main/fastqc-result-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/macs2-control-lambda-bdg",
                    "id": "#main/macs2-control-lambda-bdg-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/macs2-control-lambda-bdg",
                    "id": "#main/macs2-control-lambda-bdg-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/macs2-model-r",
                    "id": "#main/macs2-model-r-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/macs2-model-r",
                    "id": "#main/macs2-model-r-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/macs2-peaks-narrow-peak",
                    "id": "#main/macs2-peaks-narrow-peak-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/macs2-peaks-narrow-peak",
                    "id": "#main/macs2-peaks-narrow-peak-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/macs2-peaks-xls",
                    "id": "#main/macs2-peaks-xls-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/macs2-peaks-xls",
                    "id": "#main/macs2-peaks-xls-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/macs2-summits-bed",
                    "id": "#main/macs2-summits-bed-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/macs2-summits-bed",
                    "id": "#main/macs2-summits-bed-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/macs2-treat-pileup-bdg",
                    "id": "#main/macs2-treat-pileup-bdg-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/macs2-treat-pileup-bdg",
                    "id": "#main/macs2-treat-pileup-bdg-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/bedtools-intersect-no-overlap/result-narrow-peak",
                    "id": "#main/narrow-peak-no-overlap"
                },
                {
                    "type": "File",
                    "outputSource": "#main/bedtools-intersect-overlap/result-narrow-peak",
                    "id": "#main/narrow-peak-overlap"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/samtools-index-bam-index",
                    "id": "#main/samtools-index-bam-index-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/samtools-index-bam-index",
                    "id": "#main/samtools-index-bam-index-fastq2"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq1/samtools-view-bam",
                    "id": "#main/samtools-view-bam-fastq1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/macs2-fastq2/samtools-view-bam",
                    "id": "#main/samtools-view-bam-fastq2"
                }
            ],
            "id": "#main"
        },
        {
            "class": "Workflow",
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                },
                {
                    "class": "StepInputExpressionRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "secondaryFiles": [
                        "^.1.bt2",
                        "^.2.bt2",
                        "^.3.bt2",
                        "^.4.bt2",
                        "^.rev.1.bt2",
                        "^.rev.2.bt2"
                    ],
                    "id": "#macs2.cwl/bowtie2_genome_index"
                },
                {
                    "type": "File",
                    "id": "#macs2.cwl/fastq"
                },
                {
                    "type": "File",
                    "id": "#macs2.cwl/macs2_control_bam"
                },
                {
                    "type": "string",
                    "default": "mm",
                    "label": "mouse: mm, human: hs",
                    "id": "#macs2.cwl/macs2_organism"
                },
                {
                    "type": "float",
                    "default": 0.01,
                    "id": "#macs2.cwl/macs2_p_value"
                },
                {
                    "type": "int",
                    "default": 4,
                    "id": "#macs2.cwl/nthreads"
                },
                {
                    "type": "string",
                    "default": "0x4",
                    "id": "#macs2.cwl/samtools_filter_alignments"
                },
                {
                    "type": "int",
                    "default": 42,
                    "id": "#macs2.cwl/samtools_skip_alignments"
                }
            ],
            "steps": [
                {
                    "run": "#bowtie2-se.cwl",
                    "in": [
                        {
                            "source": "#macs2.cwl/fastp/trimmed_fastq",
                            "id": "#macs2.cwl/bowtie2/fastq"
                        },
                        {
                            "source": "#macs2.cwl/bowtie2_genome_index",
                            "id": "#macs2.cwl/bowtie2/genome_index"
                        },
                        {
                            "source": "#macs2.cwl/nthreads",
                            "id": "#macs2.cwl/bowtie2/num_process"
                        }
                    ],
                    "out": [
                        "#macs2.cwl/bowtie2/sam"
                    ],
                    "id": "#macs2.cwl/bowtie2"
                },
                {
                    "run": "#fastp-se-html.cwl",
                    "in": [
                        {
                            "source": "#macs2.cwl/fastq",
                            "id": "#macs2.cwl/fastp/fastq"
                        }
                    ],
                    "out": [
                        "#macs2.cwl/fastp/trimmed_fastq",
                        "#macs2.cwl/fastp/html"
                    ],
                    "id": "#macs2.cwl/fastp"
                },
                {
                    "run": "#fastqc.cwl",
                    "in": [
                        {
                            "default": true,
                            "id": "#macs2.cwl/fastqc/nogroup"
                        },
                        {
                            "source": "#macs2.cwl/nthreads",
                            "id": "#macs2.cwl/fastqc/nthreads"
                        },
                        {
                            "source": [
                                "#macs2.cwl/fastq"
                            ],
                            "linkMerge": "merge_nested",
                            "id": "#macs2.cwl/fastqc/seqfile"
                        }
                    ],
                    "out": [
                        "#macs2.cwl/fastqc/fastqc_result"
                    ],
                    "id": "#macs2.cwl/fastqc"
                },
                {
                    "run": "#MACS2-callpeak.cwl",
                    "in": [
                        {
                            "source": "#macs2.cwl/macs2_control_bam",
                            "id": "#macs2.cwl/macs2/control_bam"
                        },
                        {
                            "source": "#macs2.cwl/macs2_organism",
                            "id": "#macs2.cwl/macs2/organism"
                        },
                        {
                            "source": "#macs2.cwl/macs2_p_value",
                            "id": "#macs2.cwl/macs2/p-value"
                        },
                        {
                            "source": "#macs2.cwl/samtools-view/bam",
                            "id": "#macs2.cwl/macs2/target_bam"
                        }
                    ],
                    "out": [
                        "#macs2.cwl/macs2/model-r",
                        "#macs2.cwl/macs2/peaks-narrow-peak",
                        "#macs2.cwl/macs2/peaks-xls",
                        "#macs2.cwl/macs2/summits-bed",
                        "#macs2.cwl/macs2/treat-pileup-bdg",
                        "#macs2.cwl/macs2/control-lambda-bdg"
                    ],
                    "id": "#macs2.cwl/macs2"
                },
                {
                    "run": "#samtools-index.cwl",
                    "in": [
                        {
                            "source": "#macs2.cwl/samtools-view/bam",
                            "id": "#macs2.cwl/samtools-index/input_bamfile"
                        }
                    ],
                    "out": [
                        "#macs2.cwl/samtools-index/bam_index"
                    ],
                    "id": "#macs2.cwl/samtools-index"
                },
                {
                    "run": "#samtools-view.cwl",
                    "in": [
                        {
                            "source": "#macs2.cwl/samtools_filter_alignments",
                            "id": "#macs2.cwl/samtools-view/filter_alignments"
                        },
                        {
                            "default": true,
                            "id": "#macs2.cwl/samtools-view/ignore_previous_version"
                        },
                        {
                            "default": true,
                            "id": "#macs2.cwl/samtools-view/include_header"
                        },
                        {
                            "source": "#macs2.cwl/bowtie2/sam",
                            "id": "#macs2.cwl/samtools-view/input_file"
                        },
                        {
                            "default": true,
                            "id": "#macs2.cwl/samtools-view/output_bam"
                        },
                        {
                            "valueFrom": "$(inputs.fastq.nameroot).trim.uniq.bam",
                            "id": "#macs2.cwl/samtools-view/output_filename"
                        },
                        {
                            "source": "#macs2.cwl/samtools_skip_alignments",
                            "id": "#macs2.cwl/samtools-view/skip_alignments"
                        },
                        {
                            "source": "#macs2.cwl/nthreads",
                            "id": "#macs2.cwl/samtools-view/threads"
                        }
                    ],
                    "out": [
                        "#macs2.cwl/samtools-view/bam"
                    ],
                    "id": "#macs2.cwl/samtools-view"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/bowtie2/sam",
                    "id": "#macs2.cwl/bowtie2-sam"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/fastp/html",
                    "id": "#macs2.cwl/fastp-html"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/fastp/trimmed_fastq",
                    "id": "#macs2.cwl/fastp-trimmed-fastq"
                },
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "outputSource": "#macs2.cwl/fastqc/fastqc_result",
                    "id": "#macs2.cwl/fastqc-result"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/macs2/control-lambda-bdg",
                    "id": "#macs2.cwl/macs2-control-lambda-bdg"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/macs2/model-r",
                    "id": "#macs2.cwl/macs2-model-r"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/macs2/peaks-narrow-peak",
                    "id": "#macs2.cwl/macs2-peaks-narrow-peak"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/macs2/peaks-xls",
                    "id": "#macs2.cwl/macs2-peaks-xls"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/macs2/summits-bed",
                    "id": "#macs2.cwl/macs2-summits-bed"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/macs2/treat-pileup-bdg",
                    "id": "#macs2.cwl/macs2-treat-pileup-bdg"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/samtools-index/bam_index",
                    "id": "#macs2.cwl/samtools-index-bam-index"
                },
                {
                    "type": "File",
                    "outputSource": "#macs2.cwl/samtools-view/bam",
                    "id": "#macs2.cwl/samtools-view-bam"
                }
            ],
            "id": "#macs2.cwl"
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
                    "id": "#fastqc.cwl/adapters"
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
                    "id": "#fastqc.cwl/casava"
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
                    "id": "#fastqc.cwl/contaminants"
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
                    "id": "#fastqc.cwl/dir"
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
                    "id": "#fastqc.cwl/extract"
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
                    "id": "#fastqc.cwl/input_format"
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
                    "id": "#fastqc.cwl/java"
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
                    "id": "#fastqc.cwl/kmers"
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
                    "id": "#fastqc.cwl/limits"
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
                    "id": "#fastqc.cwl/min_length"
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
                    "id": "#fastqc.cwl/nano"
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
                    "id": "#fastqc.cwl/noextract"
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
                    "id": "#fastqc.cwl/nofilter"
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
                    "id": "#fastqc.cwl/nogroup"
                },
                {
                    "label": "the number of files which can be processed simultaneously",
                    "doc": "Specifies the number of files which can be processed simultaneously. Each thread will be allocated 250MB of memory so you shouldn't run more threads than your available memory will cope with, and not more than 6 threads on a 32 bit machine",
                    "type": "int",
                    "inputBinding": {
                        "prefix": "--threads"
                    },
                    "id": "#fastqc.cwl/nthreads"
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
                    "id": "#fastqc.cwl/quiet"
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
                    "id": "#fastqc.cwl/seqfile"
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
                    "id": "#fastqc.cwl/fastqc_result"
                }
            ],
            "id": "#fastqc.cwl",
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
