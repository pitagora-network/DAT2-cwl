# DAT2-cwl epigenome ChIP-seq genome data analysis workflow

[![test-workflow-epigenome-chip-seq](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-epigenome-chip-seq.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-epigenome-chip-seq.yml)

Written by [@suecharo](https://github.com/suecharo).

Please refer to p.114 of NGS_DAT 2nd edition for details of the analysis.

See [CWL Viewer - epigenome-chip-seq.cwl](https://w3id.org/cwl/view/git/dad35f6d3743aa92b751333bd2e15cda259d4d43/workflow/epigenome-chip-seq/epigenome-chip-seq.packed.cwl?part=main) for workflow `inputs`, `outputs`, and `graph`.

## Testing

Run tests in the local environment:

```bash
$ cwltool ./epigenome-chip-seq.cwl ./test-job.yml
```
