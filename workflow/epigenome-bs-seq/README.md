# DAT2-cwl epigenome BS sequencing data analysis workflow

[![test-workflow-epigenome-bs-seq](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-epigenome-bs-seq.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-epigenome-bs-seq.yml)

Written by [@manabuishii](https://github.com/manabuishii).

Please refer to p.164 of NGS_DAT 2nd edition for details of the analysis.

See [CWL Viewer - epigenome-bs-seq.cwl](https://w3id.org/cwl/view/git/c7a71e8eb87f728b93492aa7df71a6e89d3a297b/workflow/epigenome-bs-seq/epigenome-bs-seq.cwl) for workflow `inputs`, `outputs`, and `graph`.

## Testing

Run tests in the local environment:

```bash
$ cwltool ./epigenome-bs-seq.cwl ./test-job.yml
```

### Required Memory

You should have at least 32 GB of memory.

### NOTE

### bismark

bismark uses CPU double specified.

ex. specified 2 , bismark uses 4
