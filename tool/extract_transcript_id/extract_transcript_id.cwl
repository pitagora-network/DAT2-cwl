class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: "https://www.sevenbridges.com/"
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
    dockerPull: ghcr.io/pitagora-network/extract_transcript_id:1.0.0
  - class: InlineJavascriptRequirement
stdout: $(inputs.output)
