class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - tar
inputs:
  - default: false
    id: extract
    type: boolean
    inputBinding:
      position: 0
      prefix: '-x'
  - id: file
    type: File
    inputBinding:
      position: 0
      prefix: '--file='
      separate: false
  - default: false
    id: gzip
    type: boolean
    inputBinding:
      position: 0
      prefix: '-z'
  - default: false
    id: verbose
    type: boolean
    inputBinding:
      position: 0
      prefix: '-v'
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: |
        ${
          var extlen = inputs.gzip ? 2 : 1;
          return inputs.file.basename.split('.').slice(0, -extlen).join('.');
        }
  - id: stderr
    type: stderr
  - id: stdout
    type: stdout
doc: manipulate tape archives
requirements:
  - class: DockerRequirement
    dockerPull: 'alpine:3.9'
  - class: InlineJavascriptRequirement
stdout: tar-stdout.log
stderr: tar-stderr.log
