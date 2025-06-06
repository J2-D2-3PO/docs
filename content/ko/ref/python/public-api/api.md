---
title: Api
menu:
  reference:
    identifier: ko-ref-python-public-api-api
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L104-L1573 >}}

wandb 서버를 쿼리하는 데 사용됩니다.

```python
Api(
    overrides: Optional[Dict[str, Any]] = None,
    timeout: Optional[int] = None,
    api_key: Optional[str] = None
) -> None
```

#### 예시:

가장 일반적인 초기화 방법

```
>>> wandb.Api()
```

| ARG |   |
| :--- | :--- |
| `overrides` | (사전) `https://api.wandb.ai`가 아닌 wandb 서버를 사용하는 경우 `base_url`을 설정할 수 있습니다. `entity`, `project` 및 `run`에 대한 기본값을 설정할 수도 있습니다. |

| 속성 |   |
| :--- | :--- |

## 메소드

### `artifact`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1299-L1321)

```python
artifact(
    name: str,
    type: Optional[str] = None
)
```

`project/name` 또는 `entity/project/name` 형식으로 경로를 파싱하여 단일 아티팩트를 반환합니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 아티팩트 이름입니다. project/ 또는 entity/project/로 시작할 수 있습니다. 이름에 entity가 지정되지 않은 경우 Run 또는 API 설정의 entity가 사용됩니다. 유효한 이름은 name:version name:alias 형식일 수 있습니다. |
| `type` | (str, 선택 사항) 가져올 아티팩트의 유형입니다. |

| 반환 |   |
| :--- | :--- |
| `Artifact` 오브젝트입니다. |

| 예외 |   |
| :--- | :--- |
| `ValueError` | 아티팩트 이름이 지정되지 않은 경우 |
| `ValueError` | 아티팩트 유형이 지정되었지만 가져온 아티팩트의 유형과 일치하지 않는 경우 |

#### 참고:

이 메소드는 외부 전용입니다. wandb 리포지토리 코드 내에서 `api.artifact()`를 호출하지 마십시오.

### `artifact_collection`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1181-L1210)

```python
artifact_collection(
    type_name: str,
    name: str
) -> "public.ArtifactCollection"
```

유형별로 단일 아티팩트 컬렉션을 반환하고 `entity/project/name` 형식으로 경로를 파싱합니다.

| ARG |   |
| :--- | :--- |
| `type_name` | (str) 가져올 아티팩트 컬렉션의 유형입니다. |
| `name` | (str) 아티팩트 컬렉션 이름입니다. entity/project로 시작할 수 있습니다. |

| 반환 |   |
| :--- | :--- |
| `ArtifactCollection` 오브젝트입니다. |

### `artifact_collection_exists`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1442-L1459)

```python
artifact_collection_exists(
    name: str,
    type: str
) -> bool
```

지정된 프로젝트 및 entity 내에 아티팩트 컬렉션이 있는지 여부를 반환합니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 아티팩트 컬렉션 이름입니다. entity/project로 시작할 수 있습니다. entity 또는 project가 지정되지 않은 경우 채워진 경우 오버라이드 파라미터에서 추론됩니다. 그렇지 않으면 entity는 사용자 설정에서 가져오고 project는 기본적으로 "uncategorized"로 설정됩니다. |
| `type` | (str) 아티팩트 컬렉션의 유형 |

| 반환 |   |
| :--- | :--- |
| 아티팩트 컬렉션이 있으면 True, 그렇지 않으면 False입니다. |

### `artifact_collections`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1154-L1179)

```python
artifact_collections(
    project_name: str,
    type_name: str,
    per_page: Optional[int] = 50
) -> "public.ArtifactCollections"
```

일치하는 아티팩트 컬렉션의 컬렉션을 반환합니다.

| ARG |   |
| :--- | :--- |
| `project_name` | (str) 필터링할 프로젝트의 이름입니다. |
| `type_name` | (str) 필터링할 아티팩트 유형의 이름입니다. |
| `per_page` | (int, 선택 사항) 쿼리 페이지 매김에 대한 페이지 크기를 설정합니다. None은 기본 크기를 사용합니다. 일반적으로 이를 변경할 이유는 없습니다. |

| 반환 |   |
| :--- | :--- |
| 반복 가능한 `ArtifactCollections` 오브젝트입니다. |

### `artifact_exists`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1420-L1440)

```python
artifact_exists(
    name: str,
    type: Optional[str] = None
) -> bool
```

지정된 프로젝트 및 entity 내에 아티팩트 버전이 있는지 여부를 반환합니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 아티팩트 이름입니다. entity/project로 시작할 수 있습니다. entity 또는 project가 지정되지 않은 경우 채워진 경우 오버라이드 파라미터에서 추론됩니다. 그렇지 않으면 entity는 사용자 설정에서 가져오고 project는 기본적으로 "uncategorized"로 설정됩니다. 유효한 이름은 name:version name:alias 형식일 수 있습니다. |
| `type` | (str, 선택 사항) 아티팩트 유형 |

| 반환 |   |
| :--- | :--- |
| 아티팩트 버전이 있으면 True, 그렇지 않으면 False입니다. |

### `artifact_type`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1130-L1152)

```python
artifact_type(
    type_name: str,
    project: Optional[str] = None
) -> "public.ArtifactType"
```

일치하는 `ArtifactType`을 반환합니다.

| ARG |   |
| :--- | :--- |
| `type_name` | (str) 검색할 아티팩트 유형의 이름입니다. |
| `project` | (str, 선택 사항) 지정된 경우 필터링할 프로젝트 이름 또는 경로입니다. |

| 반환 |   |
| :--- | :--- |
| `ArtifactType` 오브젝트입니다. |

### `artifact_types`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1109-L1128)

```python
artifact_types(
    project: Optional[str] = None
) -> "public.ArtifactTypes"
```

일치하는 아티팩트 유형의 컬렉션을 반환합니다.

| ARG |   |
| :--- | :--- |
| `project` | (str, 선택 사항) 지정된 경우 필터링할 프로젝트 이름 또는 경로입니다. |

| 반환 |   |
| :--- | :--- |
| 반복 가능한 `ArtifactTypes` 오브젝트입니다. |

### `artifact_versions`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1212-L1222)

```python
artifact_versions(
    type_name, name, per_page=50
)
```

더 이상 사용되지 않습니다. 대신 `artifacts(type_name, name)`을 사용하세요.

### `artifacts`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1224-L1260)

```python
artifacts(
    type_name: str,
    name: str,
    per_page: Optional[int] = 50,
    tags: Optional[List[str]] = None
) -> "public.Artifacts"
```

지정된 파라미터에서 `Artifacts` 컬렉션을 반환합니다.

| ARG |   |
| :--- | :--- |
| `type_name` | (str) 가져올 아티팩트의 유형입니다. |
| `name` | (str) 아티팩트 컬렉션 이름입니다. entity/project로 시작할 수 있습니다. |
| `per_page` | (int, 선택 사항) 쿼리 페이지 매김에 대한 페이지 크기를 설정합니다. None은 기본 크기를 사용합니다. 일반적으로 이를 변경할 이유는 없습니다. |
| `tags` | (list[str], 선택 사항) 이러한 모든 태그가 있는 아티팩트만 반환합니다. |

| 반환 |   |
| :--- | :--- |
| 반복 가능한 `Artifacts` 오브젝트입니다. |

### `create_project`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L294-L301)

```python
create_project(
    name: str,
    entity: str
) -> None
```

새 프로젝트를 만듭니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 새 프로젝트의 이름입니다. |
| `entity` | (str) 새 프로젝트의 entity입니다. |

### `create_run`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L303-L323)

```python
create_run(
    *,
    run_id: Optional[str] = None,
    project: Optional[str] = None,
    entity: Optional[str] = None
) -> "public.Run"
```

새 run을 만듭니다.

| ARG |   |
| :--- | :--- |
| `run_id` | (str, 선택 사항) 지정된 경우 run에 할당할 ID입니다. run ID는 기본적으로 자동으로 생성되므로 일반적으로 이를 지정할 필요가 없으며 자신의 책임하에만 수행해야 합니다. |
| `project` | (str, 선택 사항) 지정된 경우 새 run의 프로젝트입니다. |
| `entity` | (str, 선택 사항) 지정된 경우 새 run의 entity입니다. |

| 반환 |   |
| :--- | :--- |
| 새로 생성된 `Run`입니다. |

### `create_run_queue`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L325-L435)

```python
create_run_queue(
    name: str,
    type: "public.RunQueueResourceType",
    entity: Optional[str] = None,
    prioritization_mode: Optional['public.RunQueuePrioritizationMode'] = None,
    config: Optional[dict] = None,
    template_variables: Optional[dict] = None
) -> "public.RunQueue"
```

새 run 대기열(Launch)을 만듭니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 만들 대기열의 이름 |
| `type` | (str) 대기열에 사용할 리소스 유형입니다. "local-container", "local-process", "kubernetes", "sagemaker" 또는 "gcp-vertex" 중 하나입니다. |
| `entity` | (str) 대기열을 만들 entity의 선택적 이름입니다. None이면 구성된 entity 또는 기본 entity가 사용됩니다. |
| `prioritization_mode` | (str) 사용할 우선 순위 지정의 선택적 버전입니다. "V0" 또는 None입니다. |
| `config` | (dict) 대기열에 사용할 선택적 기본 리소스 구성입니다. 핸들바(`{{var}}` 등)를 사용하여 템플릿 변수를 지정합니다. |
| `template_variables` | (dict) 구성과 함께 사용할 템플릿 변수 스키마의 사전입니다. 예상 형식: `{ "var-name": { "schema": { "type": ("string", "number", or "integer"), "default": (optional value), "minimum": (optional minimum), "maximum": (optional maximum), "enum": [..."(options)"] } } }` |

| 반환 |   |
| :--- | :--- |
| 새로 생성된 `RunQueue` |

| 예외 |   |
| :--- | :--- |
| 파라미터가 유효하지 않으면 ValueError wandb API 오류 시 wandb.Error |

### `create_team`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L843-L853)

```python
create_team(
    team, admin_username=None
)
```

새 팀을 만듭니다.

| ARG |   |
| :--- | :--- |
| `team` | (str) 팀의 이름 |
| `admin_username` | (str) 팀의 관리자 사용자의 선택적 사용자 이름이며, 기본값은 현재 사용자입니다. |

| 반환 |   |
| :--- | :--- |
| `Team` 오브젝트 |

### `create_user`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L552-L562)

```python
create_user(
    email, admin=(False)
)
```

새 사용자를 만듭니다.

| ARG |   |
| :--- | :--- |
| `email` | (str) 사용자의 이메일 주소 |
| `admin` | (bool) 이 사용자가 전역 인스턴스 관리자인지 여부 |

| 반환 |   |
| :--- | :--- |
| `User` 오브젝트 |

### `flush`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L629-L636)

```python
flush()
```

로컬 캐시를 플러시합니다.

api 오브젝트는 run의 로컬 캐시를 유지하므로 스크립트를 실행하는 동안 run의 상태가 변경될 수 있는 경우
`api.flush()`로 로컬 캐시를 지워야 합니다. 그래야 run과 관련된 최신 값을 얻을 수 있습니다.

### `from_path`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L638-L692)

```python
from_path(
    path
)
```

경로에서 run, 스윕, 프로젝트 또는 리포트를 반환합니다.

#### 예시:

```
project = api.from_path("my_project")
team_project = api.from_path("my_team/my_project")
run = api.from_path("my_team/my_project/runs/id")
sweep = api.from_path("my_team/my_project/sweeps/id")
report = api.from_path("my_team/my_project/reports/My-Report-Vm11dsdf")
```

| ARG |   |
| :--- | :--- |
| `path` | (str) 프로젝트, run, 스윕 또는 리포트의 경로 |

| 반환 |   |
| :--- | :--- |
| `Project`, `Run`, `Sweep` 또는 `BetaReport` 인스턴스입니다. |

| 예외 |   |
| :--- | :--- |
| 경로가 유효하지 않거나 오브젝트가 존재하지 않으면 wandb.Error |

### `job`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1323-L1340)

```python
job(
    name: Optional[str],
    path: Optional[str] = None
) -> "public.Job"
```

지정된 파라미터에서 `Job`을 반환합니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 작업 이름입니다. |
| `path` | (str, 선택 사항) 지정된 경우 작업 아티팩트를 다운로드할 루트 경로입니다. |

| 반환 |   |
| :--- | :--- |
| `Job` 오브젝트입니다. |

### `list_jobs`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1342-L1418)

```python
list_jobs(
    entity: str,
    project: str
) -> List[Dict[str, Any]]
```

지정된 entity 및 프로젝트에 대한 작업 목록(있는 경우)을 반환합니다.

| ARG |   |
| :--- | :--- |
| `entity` | (str) 나열된 작업의 entity입니다. |
| `project` | (str) 나열된 작업의 프로젝트입니다. |

| 반환 |   |
| :--- | :--- |
| 일치하는 작업 목록입니다. |

### `project`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L785-L808)

```python
project(
    name: str,
    entity: Optional[str] = None
) -> "public.Project"
```

지정된 이름(및 지정된 경우 entity)으로 `Project`를 반환합니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 프로젝트 이름입니다. |
| `entity` | (str) 요청된 entity의 이름입니다. None이면 `Api`에 전달된 기본 entity로 대체됩니다. 기본 entity가 없으면 `ValueError`가 발생합니다. |

| 반환 |   |
| :--- | :--- |
| `Project` 오브젝트입니다. |

### `projects`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L759-L783)

```python
projects(
    entity: Optional[str] = None,
    per_page: Optional[int] = 200
) -> "public.Projects"
```

지정된 entity에 대한 프로젝트를 가져옵니다.

| ARG |   |
| :--- | :--- |
| `entity` | (str) 요청된 entity의 이름입니다. None이면 `Api`에 전달된 기본 entity로 대체됩니다. 기본 entity가 없으면 `ValueError`가 발생합니다. |
| `per_page` | (int) 쿼리 페이지 매김에 대한 페이지 크기를 설정합니다. None은 기본 크기를 사용합니다. 일반적으로 이를 변경할 이유는 없습니다. |

| 반환 |   |
| :--- | :--- |
| `Project` 오브젝트의 반복 가능한 컬렉션인 `Projects` 오브젝트입니다. |

### `queued_run`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1054-L1075)

```python
queued_run(
    entity, project, queue_name, run_queue_item_id, project_queue=None,
    priority=None
)
```

경로를 기반으로 단일 대기열에 있는 run을 반환합니다.

entity/project/queue_id/run_queue_item_id 형식의 경로를 파싱합니다.

### `registries`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1461-L1524)

```python
registries(
    organization: Optional[str] = None,
    filter: Optional[Dict[str, Any]] = None
) -> Registries
```

Registry 반복자를 반환합니다.

반복자를 사용하여 조직의 Registry에서 레지스트리, 컬렉션 또는 아티팩트 버전을 검색하고 필터링합니다.

#### 예시:

이름에 "model"이 포함된 모든 레지스트리 찾기

```python
import wandb

api = wandb.Api()  # entity가 여러 조직에 속한 경우 조직을 지정합니다.
api.registries(filter={"name": {"$regex": "model"}})
```

이름이 "my_collection"이고 태그가 "my_tag"인 레지스트리의 모든 컬렉션 찾기

```python
api.registries().collections(filter={"name": "my_collection", "tag": "my_tag"})
```

"my_collection"이 포함된 컬렉션 이름과 "best" 에일리어스가 있는 버전을 사용하여 레지스트리의 모든 아티팩트 버전 찾기

```python
api.registries().collections(
    filter={"name": {"$regex": "my_collection"}}
).versions(filter={"alias": "best"})
```

"model"을 포함하고 태그 "prod" 또는 에일리어스 "best"가 있는 레지스트리의 모든 아티팩트 버전 찾기

```python
api.registries(filter={"name": {"$regex": "model"}}).versions(
    filter={"$or": [{"tag": "prod"}, {"alias": "best"}]}
)
```

| ARG |   |
| :--- | :--- |
| `organization` | (str, 선택 사항) 가져올 레지스트리의 조직입니다. 지정하지 않으면 사용자 설정에 지정된 조직을 사용합니다. |
| `filter` | (dict, 선택 사항) 레지스트리 반복자의 각 오브젝트에 적용할 MongoDB 스타일 필터입니다. 컬렉션에 대해 필터링할 수 있는 필드는 `name`, `description`, `created_at`, `updated_at`입니다. 컬렉션에 대해 필터링할 수 있는 필드는 `name`, `tag`, `description`, `created_at`, `updated_at`입니다. 버전에 대해 필터링할 수 있는 필드는 `tag`, `alias`, `created_at`, `updated_at`, `metadata`입니다. |

| 반환 |   |
| :--- | :--- |
| 레지스트리 반복기입니다. |

### `reports`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L810-L841)

```python
reports(
    path: str = "",
    name: Optional[str] = None,
    per_page: Optional[int] = 50
) -> "public.Reports"
```

지정된 프로젝트 경로에 대한 리포트를 가져옵니다.

경고: 이 API는 베타 버전이며 향후 릴리스에서 변경될 수 있습니다.

| ARG |   |
| :--- | :--- |
| `path` | (str) 리포트가 있는 프로젝트의 경로이며 "entity/project" 형식이어야 합니다. |
| `name` | (str, 선택 사항) 요청된 리포트의 선택적 이름입니다. |
| `per_page` | (int) 쿼리 페이지 매김에 대한 페이지 크기를 설정합니다. None은 기본 크기를 사용합니다. 일반적으로 이를 변경할 이유는 없습니다. |

| 반환 |   |
| :--- | :--- |
| `BetaReport` 오브젝트의 반복 가능한 컬렉션인 `Reports` 오브젝트입니다. |

### `run`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1037-L1052)

```python
run(
    path=""
)
```

`entity/project/run_id` 형식으로 경로를 파싱하여 단일 run을 반환합니다.

| ARG |   |
| :--- | :--- |
| `path` | (str) `entity/project/run_id` 형식의 run 경로입니다. `api.entity`가 설정된 경우 `project/run_id` 형식일 수 있으며 `api.project`가 설정된 경우 run_id일 수 있습니다. |

| 반환 |   |
| :--- | :--- |
| `Run` 오브젝트입니다. |

### `run_queue`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1077-L1090)

```python
run_queue(
    entity, name
)
```

entity에 대해 이름이 지정된 `RunQueue`를 반환합니다.

새 `RunQueue`를 만들려면 `wandb.Api().create_run_queue(...)`를 사용하세요.

### `runs`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L904-L1035)

```python
runs(
    path: Optional[str] = None,
    filters: Optional[Dict[str, Any]] = None,
    order: str = "+created_at",
    per_page: int = 50,
    include_sweeps: bool = (True)
)
```

제공된 필터와 일치하는 프로젝트에서 run 집합을 반환합니다.

필터링할 수 있는 필드는 다음과 같습니다.

- `createdAt`: run이 생성된 타임스탬프입니다. (ISO 8601 형식, 예: "2023-01-01T12:00:00Z")
- `displayName`: run의 사람이 읽을 수 있는 표시 이름입니다. (예: "eager-fox-1")
- `duration`: run의 총 런타임(초)입니다.
- `group`: 관련 run을 함께 구성하는 데 사용되는 그룹 이름입니다.
- `host`: run이 실행된 호스트 이름입니다.
- `jobType`: run의 작업 유형 또는 목적입니다.
- `name`: run의 고유 식별자입니다. (예: "a1b2cdef")
- `state`: run의 현재 상태입니다.
- `tags`: run과 연결된 태그입니다.
- `username`: run을 시작한 사용자의 사용자 이름입니다.

또한 run 구성 또는 요약 메트릭의 항목으로 필터링할 수 있습니다.
예: `config.experiment_name`, `summary_metrics.loss` 등.

더 복잡한 필터링을 위해 MongoDB 쿼리 연산자를 사용할 수 있습니다.
자세한 내용은 https://docs.mongodb.com/manual/reference/operator/query/ 를 참조하세요.
다음 작업이 지원됩니다.

- `$and`
- `$or`
- `$nor`
- `$eq`
- `$ne`
- `$gt`
- `$gte`
- `$lt`
- `$lte`
- `$in`
- `$nin`
- `$exists`
- `$regex`

#### 예시:

config.experiment_name이 "foo"로 설정된 my_project에서 run 찾기

```
api.runs(
    path="my_entity/my_project",
    filters={"config.experiment_name": "foo"},
)
```

config.experiment_name이 "foo" 또는 "bar"로 설정된 my_project에서 run 찾기

```
api.runs(
    path="my_entity/my_project",
    filters={
        "$or": [
            {"config.experiment_name": "foo"},
            {"config.experiment_name": "bar"},
        ]
    },
)
```

config.experiment_name이 정규식과 일치하는 my_project에서 run 찾기(앵커는 지원되지 않음)

```
api.runs(
    path="my_entity/my_project",
    filters={"config.experiment_name": {"$regex": "b.*"}},
)
```

run 이름이 정규식과 일치하는 my_project에서 run 찾기(앵커는 지원되지 않음)

```
api.runs(
    path="my_entity/my_project",
    filters={"display_name": {"$regex": "^foo.*"}},
)
```

config.experiment에 값 "testing"이 있는 중첩 필드 "category"가 포함된 my_project에서 run 찾기

```
api.runs(
    path="my_entity/my_project",
    filters={"config.experiment.category": "testing"},
)
```

요약 메트릭에서 model1 아래의 사전에 중첩된 손실 값이 0.5인 my_project에서 run 찾기

```
api.runs(
    path="my_entity/my_project",
    filters={"summary_metrics.model1.loss": 0.5},
)
```

오름차순 손실로 정렬된 my_project에서 run 찾기

```
api.runs(path="my_entity/my_project", order="+summary_metrics.loss")
```

| ARG |   |
| :--- | :--- |
| `path` | (str) 프로젝트 경로이며 "entity/project" 형식이어야 합니다. |
| `filters` | (dict) MongoDB 쿼리 언어를 사용하여 특정 run을 쿼리합니다. config.key, summary_metrics.key, state, entity, createdAt 등과 같은 run 속성으로 필터링할 수 있습니다. 예: `{"config.experiment_name": "foo"}`는 experiment name이 "foo"로 설정된 config 항목이 있는 run을 찾습니다. |
| `order` | (str) 순서는 `created_at`, `heartbeat_at`, `config.*.value` 또는 `summary_metrics.*`일 수 있습니다. +를 사용하여 순서를 앞에 추가하면 오름차순입니다. -를 사용하여 순서를 앞에 추가하면 내림차순입니다(기본값). 기본 순서는 run.created_at이며 가장 오래된 것부터 가장 최신 것 순입니다. |
| `per_page` | (int) 쿼리 페이지 매김에 대한 페이지 크기를 설정합니다. |
| `include_sweeps` | (bool) 스윕 run을 결과에 포함할지 여부입니다. |

| 반환 |   |
| :--- | :--- |
| `Run` 오브젝트의 반복 가능한 컬렉션인 `Runs` 오브젝트입니다. |

### `sweep`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L1092-L1107)

```python
sweep(
    path=""
)
```

`entity/project/sweep_id` 형식으로 경로를 파싱하여 스윕을 반환합니다.

| ARG |   |
| :--- | :--- |
| `path` | (str, 선택 사항) entity/project/sweep_id 형식의 스윕 경로입니다. `api.entity`가 설정된 경우 project/sweep_id 형식일 수 있으며 `api.project`가 설정된 경우 sweep_id일 수 있습니다. |

| 반환 |   |
| :--- | :--- |
| `Sweep` 오브젝트입니다. |

### `sync_tensorboard`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L564-L586)

```python
sync_tensorboard(
    root_dir, run_id=None, project=None, entity=None
)
```

tfevent 파일이 포함된 로컬 디렉토리를 wandb와 동기화합니다.

### `team`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L855-L864)

```python
team(
    team: str
) -> "public.Team"
```

지정된 이름으로 일치하는 `Team`을 반환합니다.

| ARG |   |
| :--- | :--- |
| `team` | (str) 팀의 이름입니다. |

| 반환 |   |
| :--- | :--- |
| `Team` 오브젝트입니다. |

### `upsert_run_queue`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L437-L550)

```python
upsert_run_queue(
    name: str,
    resource_config: dict,
    resource_type: "public.RunQueueResourceType",
    entity: Optional[str] = None,
    template_variables: Optional[dict] = None,
    external_links: Optional[dict] = None,
    prioritization_mode: Optional['public.RunQueuePrioritizationMode'] = None
)
```

run 대기열(Launch)을 upsert합니다.

| ARG |   |
| :--- | :--- |
| `name` | (str) 만들 대기열의 이름 |
| `entity` | (str) 대기열을 만들 entity의 선택적 이름입니다. None이면 구성된 entity 또는 기본 entity가 사용됩니다. |
| `resource_config` | (dict) 대기열에 사용할 선택적 기본 리소스 구성입니다. 핸들바(`{{var}}` 등)를 사용하여 템플릿 변수를 지정합니다. |
| `resource_type` | (str) 대기열에 사용할 리소스 유형입니다. "local-container", "local-process", "kubernetes", "sagemaker" 또는 "gcp-vertex" 중 하나입니다. |
| `template_variables` | (dict) 구성과 함께 사용할 템플릿 변수 스키마의 사전입니다. 예상 형식: `{ "var-name": { "schema": { "type": ("string", "number", or "integer"), "default": (optional value), "minimum": (optional minimum), "maximum": (optional maximum), "enum": [..."(options)"] } } }` |
| `external_links` | (dict) 대기열과 함께 사용할 외부 링크의 선택적 사전입니다. 예상 형식: `{ "name": "url" }` |
| `prioritization_mode` | (str) 사용할 우선 순위 지정의 선택적 버전입니다. "V0" 또는 None입니다. |

| 반환 |   |
| :--- | :--- |
| upsert된 `RunQueue`입니다. |

| 예외 |   |
| :--- | :--- |
| 파라미터가 유효하지 않으면 ValueError wandb API 오류 시 wandb.Error |

### `user`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L866-L886)

```python
user(
    username_or_email: str
) -> Optional['public.User']
```

사용자 이름 또는 이메일 주소에서 사용자를 반환합니다.

참고: 이 함수는 로컬 관리자만 사용할 수 있습니다. 자신의 사용자 오브젝트를 가져오려면 `api.viewer`를 사용하세요.

| ARG |   |
| :--- | :--- |
| `username_or_email` | (str) 사용자의 사용자 이름 또는 이메일 주소 |

| 반환 |   |
| :--- | :--- |
| `User` 오브젝트 또는 사용자를 찾을 수 없으면 None |

### `users`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/api.py#L888-L902)

```python
users(
    username_or_email: str
) -> List['public.User']
```

부분 사용자 이름 또는 이메일 주소 쿼리에서 모든 사용자를 반환합니다.

참고: 이 함수는 로컬 관리자만 사용할 수 있습니다. 자신의 사용자 오브젝트를 가져오려면 `api.viewer`를 사용하세요.

| ARG |   |
| :--- | :--- |
| `username_or_email` | (str) 찾을 사용자의 접두사 또는 접미사 |

| 반환 |   |
| :--- | :--- |
| `User` 오브젝트 배열 |

| 클래스 변수 |   |
| :--- | :--- |
| `CREATE_PROJECT`<a id="CREATE_PROJECT"></a> |   |
| `DEFAULT_ENTITY_QUERY`<a id="DEFAULT_ENTITY_QUERY"></a> |   |
| `USERS_QUERY`<a id="USERS_QUERY"></a> |   |
| `VIEWER_QUERY`<a id="VIEWER_QUERY"></a> |   |
