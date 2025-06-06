---
title: Run
menu:
  reference:
    identifier: ko-ref-python-public-api-run
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L276-L1007 >}}

엔티티 및 프로젝트와 연결된 단일 run입니다.

```python
Run(
    client: "RetryingClient",
    entity: str,
    project: str,
    run_id: str,
    attrs: Optional[Mapping] = None,
    include_sweeps: bool = (True)
)
```

| 어트리뷰트 |  |
| :--- | :--- |

## 메소드

### `create`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L377-L417)

```python
@classmethod
create(
    api, run_id=None, project=None, entity=None
)
```

지정된 프로젝트에 대한 run을 생성합니다.

### `delete`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L540-L568)

```python
delete(
    delete_artifacts=(False)
)
```

wandb 백엔드에서 지정된 run을 삭제합니다.

### `display`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L16-L37)

```python
display(
    height=420, hidden=(False)
) -> bool
```

이 오브젝트를 jupyter에 표시합니다.

### `file`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L632-L642)

```python
file(
    name
)
```

아티팩트에서 지정된 이름을 가진 파일의 경로를 반환합니다.

| 인수 |  |
| :--- | :--- |
| name (str): 요청된 파일의 이름입니다. |

| 반환 |  |
| :--- | :--- |
| name 인수와 일치하는 `File`입니다. |

### `files`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L619-L630)

```python
files(
    names=None, per_page=50
)
```

이름이 지정된 각 파일에 대한 파일 경로를 반환합니다.

| 인수 |  |
| :--- | :--- |
| names (list): 요청된 파일의 이름입니다. 비어 있으면 모든 파일을 반환합니다. per_page (int): 페이지당 결과 수입니다. |

| 반환 |  |
| :--- | :--- |
| `File` 오브젝트에 대한 반복자인 `Files` 오브젝트입니다. |

### `history`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L668-L708)

```python
history(
    samples=500, keys=None, x_axis="_step", pandas=(True), stream="default"
)
```

run에 대한 샘플링된 히스토리 메트릭을 반환합니다.

히스토리 레코드가 샘플링되어도 괜찮다면 더 간단하고 빠릅니다.

| 인수 |  |
| :--- | :--- |
| `samples` | (int, optional) 반환할 샘플 수 |
| `pandas` | (bool, optional) pandas 데이터프레임을 반환합니다 |
| `keys` | (list, optional) 특정 키에 대한 메트릭만 반환합니다 |
| `x_axis` | (str, optional) 이 메트릭을 xAxis 기본값인 _step으로 사용합니다 |
| `stream` | (str, optional) 메트릭의 경우 "default", 머신 메트릭의 경우 "system" |

| 반환 |  |
| :--- | :--- |
| `pandas.DataFrame` | pandas=True인 경우 히스토리 메트릭의 `pandas.DataFrame`을 반환합니다. dict 목록: pandas=False인 경우 히스토리 메트릭의 dict 목록을 반환합니다. |

### `load`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L419-L488)

```python
load(
    force=(False)
)
```

### `log_artifact`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L860-L905)

```python
log_artifact(
    artifact: "wandb.Artifact",
    aliases: Optional[Collection[str]] = None,
    tags: Optional[Collection[str]] = None
)
```

아티팩트를 run의 출력으로 선언합니다.

| 인수 |  |
| :--- | :--- |
| artifact (`Artifact`): `wandb.Api().artifact(name)`에서 반환된 아티팩트입니다. aliases (list, optional): 이 아티팩트에 적용할 에일리어스입니다. |
| `tags` | (list, optional) 이 아티팩트에 적용할 태그(있는 경우)입니다. |

| 반환 |  |
| :--- | :--- |
| `Artifact` 오브젝트입니다. |

### `logged_artifacts`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L766-L798)

```python
logged_artifacts(
    per_page: int = 100
) -> public.RunArtifacts
```

이 run에서 로그된 모든 아티팩트를 가져옵니다.

run 중에 로그된 모든 출력 아티팩트를 검색합니다. 반복하거나 단일 목록으로 수집할 수 있는 페이지 매김된 결과를 반환합니다.

| 인수 |  |
| :--- | :--- |
| `per_page` | API 요청당 가져올 아티팩트 수입니다. |

| 반환 |  |
| :--- | :--- |
| 이 run 중에 출력으로 로그된 모든 Artifact 오브젝트의 반복 가능한 컬렉션입니다. |

#### 예시:

```
>>> import wandb
>>> import tempfile
>>> with tempfile.NamedTemporaryFile(
...     mode="w", delete=False, suffix=".txt"
... ) as tmp:
...     tmp.write("This is a test artifact")
...     tmp_path = tmp.name
>>> run = wandb.init(project="artifact-example")
>>> artifact = wandb.Artifact("test_artifact", type="dataset")
>>> artifact.add_file(tmp_path)
>>> run.log_artifact(artifact)
>>> run.finish()
>>> api = wandb.Api()
>>> finished_run = api.run(f"{run.entity}/{run.project}/{run.id}")
>>> for logged_artifact in finished_run.logged_artifacts():
...     print(logged_artifact.name)
test_artifact
```

### `save`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L570-L571)

```python
save()
```

### `scan_history`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L710-L764)

```python
scan_history(
    keys=None, page_size=1000, min_step=None, max_step=None
)
```

run에 대한 모든 히스토리 레코드의 반복 가능한 컬렉션을 반환합니다.

#### 예시:

예제 run에 대한 모든 손실 값을 내보냅니다.

```python
run = api.run("l2k2/examples-numpy-boston/i0wt6xua")
history = run.scan_history(keys=["Loss"])
losses = [row["Loss"] for row in history]
```

| 인수 |  |
| :--- | :--- |
| keys ([str], optional): 이러한 키만 가져오고, 정의된 모든 키를 가진 행만 가져옵니다. page_size (int, optional): API에서 가져올 페이지 크기입니다. min_step (int, optional): 한 번에 스캔할 최소 페이지 수입니다. max_step (int, optional): 한 번에 스캔할 최대 페이지 수입니다. |

| 반환 |  |
| :--- | :--- |
| 히스토리 레코드(dict)에 대한 반복 가능한 컬렉션입니다. |

### `snake_to_camel`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L12-L14)

```python
snake_to_camel(
    string
)
```

### `to_html`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L993-L1001)

```python
to_html(
    height=420, hidden=(False)
)
```

이 run을 표시하는 iframe을 포함하는 HTML을 생성합니다.

### `update`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L512-L538)

```python
update()
```

wandb 백엔드에 대한 run 오브젝트의 변경 사항을 유지합니다.

### `upload_file`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L644-L666)

```python
upload_file(
    path, root="."
)
```

파일을 업로드합니다.

| 인수 |  |
| :--- | :--- |
| path (str): 업로드할 파일의 이름입니다. root (str): 파일을 기준으로 저장할 루트 경로입니다. 즉, 파일을 "my_dir/file.txt"로 run에 저장하고 현재 "my_dir"에 있는 경우 루트를 "../"로 설정합니다. |

| 반환 |  |
| :--- | :--- |
| name 인수와 일치하는 `File`입니다. |

### `use_artifact`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L827-L858)

```python
use_artifact(
    artifact, use_as=None
)
```

아티팩트를 run에 대한 입력으로 선언합니다.

| 인수 |  |
| :--- | :--- |
| artifact (`Artifact`): `wandb.Api().artifact(name)`에서 반환된 아티팩트입니다. use_as (string, optional): 스크립트에서 아티팩트가 사용되는 방식을 식별하는 문자열입니다. 베타 wandb Launch 기능의 아티팩트 스와핑 기능을 사용할 때 run에서 사용되는 아티팩트를 쉽게 구별하는 데 사용됩니다. |

| 반환 |  |
| :--- | :--- |
| `Artifact` 오브젝트입니다. |

### `used_artifacts`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L800-L825)

```python
used_artifacts(
    per_page: int = 100
) -> public.RunArtifacts
```

이 run에서 명시적으로 사용된 아티팩트를 가져옵니다.

일반적으로 `run.use_artifact()`를 통해 run 중에 사용된 것으로 명시적으로 선언된 입력 아티팩트만 검색합니다. 반복하거나 단일 목록으로 수집할 수 있는 페이지 매김된 결과를 반환합니다.

| 인수 |  |
| :--- | :--- |
| `per_page` | API 요청당 가져올 아티팩트 수입니다. |

| 반환 |  |
| :--- | :--- |
| 이 run에서 입력으로 명시적으로 사용된 Artifact 오브젝트의 반복 가능한 컬렉션입니다. |

#### 예시:

```
>>> import wandb
>>> run = wandb.init(project="artifact-example")
>>> run.use_artifact("test_artifact:latest")
>>> run.finish()
>>> api = wandb.Api()
>>> finished_run = api.run(f"{run.entity}/{run.project}/{run.id}")
>>> for used_artifact in finished_run.used_artifacts():
...     print(used_artifact.name)
test_artifact
```

### `wait_until_finished`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L490-L510)

```python
wait_until_finished()
```
