#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: ExpressionTool
doc: Returns `T` value from `T?` if the given value is not null. Otherwise fails with `permanentFailure`.
inputs:
  input:
    type: Any?
expression: |
  ${
    if (inputs.input === null) {
      throw new Error("Input is null but it should not");
    }
    return {
      unwrapped: inputs.input,
    };
  }
outputs:
  unwrapped: Any
requirements:
  InlineJavascriptRequirement: {}
