# conding: utf-8
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent.resolve()
GIT_DIR = SCRIPT_DIR.parent.resolve()
TOOL_DIR = GIT_DIR.joinpath("tool").resolve()

TEMPLATE_NO_TEST = "|[`{tool_file_name}`]({tool_file_path_from_script_dir})|no test|"
TEMPLATE_EXISTS_TEST = "|[`{tool_file_name}`]({tool_file_path_from_script_dir})|[![{action_name}](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/{action_name}.yml/badge.svg?branch=main)](https://github.com/pitagora-network/DAT2-cwl/actions/workflows/{action_name}.yml)|"


def main():
    contents = [
        "| Tool | Status |",
        "| ---- | ------ |",
    ]
    tool_files = list(TOOL_DIR.glob("**/*.cwl"))
    for tool_file in tool_files:
        tool_file_name = tool_file.name
        tool_file_dir = tool_file.parent
        tool_file_from_git_dir = tool_file_dir.relative_to(GIT_DIR)
        tool_file_path_from_script_dir = f"../{tool_file_from_git_dir}"

        yevis_metadata = tool_file_dir.joinpath("yevis-metadata.yml")
        if yevis_metadata.exists():
            action_name = "test-tool-" + tool_file_name.replace(".cwl", "").replace("_", "-").replace(".", "-").lower()
            contents.append(TEMPLATE_EXISTS_TEST.format(
                tool_file_name=tool_file_name,
                tool_file_path_from_script_dir=tool_file_path_from_script_dir,
                action_name=action_name
            ))
        else:
            contents.append(TEMPLATE_NO_TEST.format(
                tool_file_name=tool_file_name,
                tool_file_path_from_script_dir=tool_file_path_from_script_dir
            ))
    print("\n".join(contents))


if __name__ == "__main__":
    main()
