---
title: wandb job create
menu:
  reference:
    identifier: ko-ref-cli-wandb-job-wandb-job-create
---

**사용법**

`wandb job create [OPTIONS] {git|code|image} PATH`

**요약**

wandb run 없이 소스에서 job을 생성합니다.

job은 git, code 또는 image의 세 가지 유형일 수 있습니다.

git: 경로 또는 명시적으로 제공된 메인 Python 실행 파일을 가리키는 진입점이 있는 git 소스입니다. code: requirements.txt 파일이 포함된 코드 경로입니다. image: Docker 이미지입니다.

**옵션**

| **옵션** | **설명** |
| :--- | :--- |
| `-p, --project` | job을 나열하려는 Project입니다. |
| `-e, --entity` | job이 속한 Entity입니다. |
| `-n, --name` | job 이름 |
| `-d, --description` | job 설명 |
| `-a, --alias` | job의 에일리어스 |
| `--entry-point` | 실행 파일 및 진입점 파일을 포함한 스크립트의 진입점입니다. code 또는 repo job에 필요합니다. `--build-context`가 제공된 경우 진입점 코맨드의 경로는 빌드 컨텍스트를 기준으로 합니다. |
| `-g, --git-hash` | git job의 소스로 사용할 커밋 참조 |
| `-r, --runtime` | job을 실행할 Python 런타임 |
| `-b, --build-context` | job 소스 코드의 루트에서 빌드 컨텍스트까지의 경로입니다. 제공된 경우 Dockerfile 및 진입점의 기본 경로로 사용됩니다. |
| `--base-image` | job에 사용할 기본 이미지입니다. image job과 호환되지 않습니다. |
| `--dockerfile` | job의 Dockerfile 경로입니다. `--build-context`가 제공된 경우 Dockerfile 경로는 빌드 컨텍스트를 기준으로 합니다. |
