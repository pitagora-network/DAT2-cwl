# DAT2-cwl bacteria genome data analysis workflow

[![test-workflow-bacteria-genome](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-bacteria-genome.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-bacteria-genome.yml)

Written by [@suecharo](https://github.com/suecharo).

Please refer to p.246 of NGS_DAT 2nd edition for details of the analysis.

See [CWL Viewer - bacteria-genome.cwl](https://w3id.org/cwl/view/git/c7a71e8eb87f728b93492aa7df71a6e89d3a297b/workflow/bacteria-genome/bacteria-genome.cwl) for workflow `inputs`, `outputs`, and `graph`.

## Testing

Run tests in the local environment:

```bash
$ cwltool ./bacteria-genome.cwl ./test-job.yml
```
