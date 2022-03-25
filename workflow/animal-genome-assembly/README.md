# DAT2-cwl animal genome assembly data analysis workflow

[![test-workflow-animal-genome-assembly](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-animal-genome-assembly.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/test-workflow-animal-genome-assembly.yml)

Written by [@inutano](https://github.com/inutano)

Please refer to p.274 of NGS_DAT 2nd edition for details of the analysis.

See [CWL Viewer - animal-genome-assembly.cwl](https://w3id.org/cwl/view/git/b63171820f546def8c26f558182912a71af88b48/workflow/animal-genome-assembly/animal-genome-assembly.cwl) for workflow `inputs`, `outputs`, and `graph`.

## Testing

Run tests in the local environment:

```bash
$ cwltool ./animal-genome-assembly.cwl ./test-job.yml
```
