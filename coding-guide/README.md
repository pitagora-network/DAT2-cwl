# DAT2-CWL coding guide

## Directory 構造と命名規則

### Workflow

- 基本的に小文字でハイフンつなぎ
- `workflow/rna-seq/rna-seq-se` のように dir を作成する
  - この際 workflow name は `rna-seq-se` となる
  - rna-seq において複数存在する場合、rna-seq の下に `rna-seq-se` や `rna-seq-pe` のような子 dir を作成する
  - 逆に `rna-seq` などと一意に定まる workflow の場合、子 dir を作成せずそのまま `workflow/rna-seq` が worklfow dir となる
- `workflow/rna-seq/rna-seq-se` の中身は以下のファイルが存在する
  - `rna-seq-se.cwl`
    - workflow file
  - `rna-seq-se.yml`
    - job template file
- test job は `test/workflow/test_job` 以下に `rna-seq-se.yml` として作成する

### Tool

- 基本的に小文字でハイフンつなぎ
- `tool/trimmomatic/trimmomatic-se` のように dir を作成する
  - この際 tool name は `trimmomatic-se` となる
  - trimmomatic の中でも複数存在する場合、trimmomatic の下に `trimmomatic-se` や `trimmomatic-pe` のような子 dir を作成する
- `tool/trimmomatic/trimmomatic-se` の中身は以下のファイルが存在する
  - `trimmomatic-se.cwl`
    - tool file
  - `trimmomatic-se.yml`
    - job template file
  - `trimmomatic-se.sh`
    - script file
    - これは、docker image の中に ADD される
  - `Dockerfile`
  - `build.sh`
- test job は `test/tool/test_job` 以下に `trimmomatic-se.yml` として作成する
- 基本的に bioconda の base image を使って bioconda で tool を用意する
  - 省エネのため
  - もちろん、個々人でスクラッチで書いても良い
- 基本的に全ての tool の出力は File
- Log はなるべく cwltool で巻き取る

### 変数名

- shellscript, workflow, tool のそれぞれの変数名は snake case
  - shellscript の仕様上、ハイフンを使うことが出来ない
  - input, output の args など
- workflow steps の step 名, ファイル名は小文字でハイフンつなぎ

## Template

### Workflow Template

- workflow の template を作成する script を用意した

```shell
$ cd script
$ ./prepare_workflow_template workflow_name
$ cd ../workflow
$ tree
.
└── workflow_name
    ├── workflow_name.cwl
    └── workflow_name.yml

1 directory, 2 files

# workflow_1 の下に workflow_2 のように子 dir に分ける場合
$ ./prepare_workflow_template workflow_name_1/workflow_name_2
```

- 中にある程度書き込まれている
  - 適当に編集する

---

- cwl を編集したら validate、template の作成、test_job の作成をする

```shell
$ cd workflow/workflow_name
$ cwltool --validate workflow_name.cwl
$ cwltool --make-template workflow_name.cwl > workflow_name.yml
$ cp workflow_name.yml ../../test/workflow/test_job/
$ vim ../../test/workflow/test_job/workflow_name.yml

# script を使う場合
$ cd script
$ ./build_workflow workflow_name
$ vim ../test/workflow/test_job/workflow_name.yml
```

### Tool Template

- tool の template を作成する script を用意した

```shell
$ cd script
$ ./prepare_tool_template tool_name
$ cd ../tool
$ tree tool_name
tool_name
├── build.sh
├── Dockerfile
├── tool_name.cwl
└── tool_name.sh
└── tool_name.yml

0 directories, 5 files

# tool_1 の下に tool_2 のように子 dir に分ける場合
$ cd script
$ ./prepare_tool_template tool_1/tool_2
$ cd ../tool
$ tree tool_1
tool_1
└── tool_2
    ├── build.sh
    ├── Dockerfile
    ├── tool_2.cwl
    └── tool_2.sh
    └── tool_2.yml

1 directory, 5 files
```

- 中にある程度書き込まれている
  - 適当に編集する

---

- cwl を編集したら docker image の作成、validate、template の作成、test_job の作成をする

```shell
$ cd tool/tool_name
$ bash build.sh
$ cwltool --validate tool_name.cwl
$ cwltool --make-template tool_name.cwl > tool_name.yml
$ cp tool_name.yml ../../test/tool/test_job/
$ vim ../../test/tool/test_job/tool_name.yml

# script を使う場合
$ cd script
$ ./build_tool tool_name
$ vim ../test/tool/test_job/tool_name.yml
```

## Test

### Workflow Test

- `test/workflow/test_job` の中の test job に基づいて test を実行する
  - `build.sh` の実行
  - cwltool を用いた validate
  - cwltool を用いた make template
  - test job を用いた test
- 出力 dir は削除される
  - 出力 file を確認したい場合は `rm -rf ${test_dir}/tmp` をコメントアウトする

```shell
$ cd test/workflow
# workflow ごとの test
$ ./test workflow_name
# workflow dir 以下の全ての workflow の test
$ ./all_test
```

### Tool Test

- `test/tool/test_job` の中の test job に基づいて test を実行する
  - `build.sh` の実行
  - cwltool を用いた validate
  - cwltool を用いた make template
  - test job を用いた test
- 出力 dir は削除される
  - 出力 file を確認したい場合は `rm -rf ${test_dir}/tmp` をコメントアウトする

```shell
$ cd test/tool
# tool ごとの test
$ ./test tool_name
# 全ての tool の test
$ ./all_test
```

### Test Data

- `test/data` 以下に適当に

## Branch 管理

- git-flow?
  - [git-flow - cheatsheet](https://danielkummer.github.io/git-flow-cheatsheet/)
