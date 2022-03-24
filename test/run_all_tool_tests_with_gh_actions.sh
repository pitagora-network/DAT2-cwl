#!/bin/bash

set -euxo pipefail

workflows=$(gh workflow list --limit 300 | grep -v "^#" | awk '{print $1}' | grep "test-tool")

for workflow in $workflows; do
  echo "Running workflow $workflow"
  gh workflow run $workflow
done