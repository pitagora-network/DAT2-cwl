class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: extract_transcript_id
baseCommand:
  - bash
  - extract_transcript_id.sh
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
  - id: output
    type: string
outputs:
  - id: out
    type: File?
    outputBinding:
      glob: $(inputs.output)
label: extract_transcript_id
requirements:
  - class: DockerRequirement
    dockerPull: dat2-cwl/extraxt_transcript_id
  - class: InlineJavascriptRequirement
stdout: $(inputs.output)
