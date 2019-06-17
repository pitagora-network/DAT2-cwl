class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - bash
inputs:
  - id: input_1
    type: File
    inputBinding:
      position: 1
outputs:
  - id: gzipped
    type: File
    outputBinding:
      glob: '*.gz'
  - id: stderr
    type: stderr
  - id: stdout
    type: stdout
doc: string
arguments:
  - position: 0
    valueFrom: /workdir/gzip.sh
requirements:
  - class: DockerRequirement
    dockerPull: 'dat2-cwl/gzip:latest'
stdout: gzip-stdout.log
stderr: gzip-stderr.log
