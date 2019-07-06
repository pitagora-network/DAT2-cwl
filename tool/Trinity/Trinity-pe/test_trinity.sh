#!/bin/sh
set -eux

wget https://github.com/trinityrnaseq/trinityrnaseq/raw/devel/sample_data/test_Trinity_Assembly/reads.right.fq.gz
wget https://github.com/trinityrnaseq/trinityrnaseq/raw/devel/sample_data/test_Trinity_Assembly/reads.left.fq.gz

cwltool --debug Trinity-pe.cwl Trinity-pe.yaml
