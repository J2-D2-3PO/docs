---
title: Organize versions with tags
description: 태그를 사용하여 컬렉션 내에서 컬렉션 또는 아티팩트 버전을 구성할 수 있습니다. Python SDK 또는 W&B App UI를
  사용하여 태그를 추가, 제거, 편집할 수 있습니다.
menu:
  default:
    identifier: ko-guides-core-registry-organize-with-tags
    parent: registry
weight: 7
---

레지스트리 내에서 컬렉션 또는 아티팩트 버전을 구성하기 위해 태그를 생성하고 추가합니다. W&B App UI 또는 W&B Python SDK를 사용하여 컬렉션 또는 아티팩트 버전에 태그를 추가, 수정, 보기 또는 제거합니다.

{{% alert title="태그와 에일리어스 사용 시점" %}}
특정 아티팩트 버전을 고유하게 참조해야 하는 경우 에일리어스를 사용하세요. 예를 들어, `artifact_name:alias`가 항상 단일하고 특정 버전을 가리키도록 하기 위해 'production' 또는 'latest'와 같은 에일리어스를 사용합니다.

그룹화 또는 검색에 더 많은 유연성이 필요한 경우 태그를 사용하세요. 여러 버전 또는 컬렉션이 동일한 레이블을 공유할 수 있고 특정 식별자와 연결된 버전이 하나만 있어야 한다는 보장이 필요하지 않은 경우 태그가 이상적입니다.
{{% /alert %}}

## 컬렉션에 태그 추가

W&B App UI 또는 Python SDK를 사용하여 컬렉션에 태그를 추가합니다.

{{< tabpane text=true >}}
{{% tab header="W&B App" %}}

W&B App UI를 사용하여 컬렉션에 태그를 추가합니다.

1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 컬렉션 이름 옆에 있는 **세부 정보 보기**를 클릭합니다.
4. 컬렉션 카드 내에서 **태그** 필드 옆에 있는 더하기 아이콘(**+**)을 클릭하고 태그 이름을 입력합니다.
5. 키보드에서 **Enter** 키를 누릅니다.

{{< img src="/images/registry/add_tag_collection.gif" alt="" >}}

{{% /tab %}}
{{% tab header="Python SDK" %}}

```python
import wandb

COLLECTION_TYPE = "<collection_type>"
ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"

full_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}"

collection = wandb.Api().artifact_collection(
  type_name = COLLECTION_TYPE, 
  name = full_name
  )

collection.tags = ["your-tag"]
collection.save()
```

{{% /tab %}}
{{< /tabpane >}}

## 컬렉션에 속한 태그 업데이트

`tags` 속성을 재할당하거나 변경하여 프로그래밍 방식으로 태그를 업데이트합니다. W&B는 제자리 변경 대신 `tags` 속성을 재할당하는 것을 권장하며, 이는 좋은 Python 방식입니다.

예를 들어, 다음 코드 조각은 재할당을 통해 목록을 업데이트하는 일반적인 방법을 보여줍니다. 간결성을 위해 [컬렉션에 태그 추가 섹션]({{< relref path="#add-a-tag-to-a-collection" lang="ko" >}})의 코드 예제를 계속합니다.

```python
collection.tags = [*collection.tags, "new-tag", "other-tag"]
collection.tags = collection.tags + ["new-tag", "other-tag"]

collection.tags = set(collection.tags) - set(tags_to_delete)
collection.tags = []  # deletes all tags
```

다음 코드 조각은 제자리 변경을 사용하여 아티팩트 버전에 속한 태그를 업데이트하는 방법을 보여줍니다.

```python
collection.tags += ["new-tag", "other-tag"]
collection.tags.append("new-tag")

collection.tags.extend(["new-tag", "other-tag"])
collection.tags[:] = ["new-tag", "other-tag"]
collection.tags.remove("existing-tag")
collection.tags.pop()
collection.tags.clear()
```

## 컬렉션에 속한 태그 보기

W&B App UI를 사용하여 컬렉션에 추가된 태그를 봅니다.

1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 컬렉션 이름 옆에 있는 **세부 정보 보기**를 클릭합니다.

컬렉션에 하나 이상의 태그가 있는 경우 **태그** 필드 옆의 컬렉션 카드 내에서 해당 태그를 볼 수 있습니다.

{{< img src="/images/registry/tag_collection_selected.png" alt="" >}}

컬렉션에 추가된 태그는 해당 컬렉션 이름 옆에도 나타납니다.

예를 들어, 다음 이미지에서 "tag1"이라는 태그가 "zoo-dataset-tensors" 컬렉션에 추가되었습니다.

{{< img src="/images/registry/tag_collection.png" alt="" >}}

## 컬렉션에서 태그 제거

W&B App UI를 사용하여 컬렉션에서 태그를 제거합니다.

1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 컬렉션 이름 옆에 있는 **세부 정보 보기**를 클릭합니다.
4. 컬렉션 카드 내에서 제거하려는 태그 이름 위로 마우스를 가져갑니다.
5. 취소 버튼(**X** 아이콘)을 클릭합니다.

## 아티팩트 버전에 태그 추가

W&B App UI 또는 Python SDK를 사용하여 컬렉션에 연결된 아티팩트 버전에 태그를 추가합니다.

{{< tabpane text=true >}}
{{% tab header="W&B App" %}}
1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 태그를 추가하려는 컬렉션 이름 옆에 있는 **세부 정보 보기**를 클릭합니다.
4. **버전**으로 스크롤합니다.
5. 아티팩트 버전 옆에 있는 **보기**를 클릭합니다.
6. **버전** 탭 내에서 **태그** 필드 옆에 있는 더하기 아이콘(**+**)을 클릭하고 태그 이름을 입력합니다.
7. 키보드에서 **Enter** 키를 누릅니다.

{{< img src="/images/registry/add_tag_linked_artifact_version.gif" alt="" >}}

{{% /tab %}}
{{% tab header="Python SDK" %}}
태그를 추가하거나 업데이트하려는 아티팩트 버전을 가져옵니다. 아티팩트 버전을 가져왔으면 아티팩트 오브젝트의 `tag` 속성에 액세스하여 해당 아티팩트에 태그를 추가하거나 수정할 수 있습니다. 하나 이상의 태그를 목록으로 아티팩트의 `tag` 속성에 전달합니다.

다른 Artifacts와 마찬가지로 run을 생성하지 않고도 W&B에서 Artifact를 가져오거나 run을 생성하고 해당 run 내에서 Artifact를 가져올 수 있습니다. 어느 경우든 W&B 서버에서 Artifact를 업데이트하려면 Artifact 오브젝트의 `save` 메소드를 호출해야 합니다.

아래의 적절한 코드 셀을 복사하여 붙여넣어 아티팩트 버전의 태그를 추가하거나 수정합니다. `<>` 안의 값을 자신의 값으로 바꿉니다.

다음 코드 조각은 새 run을 생성하지 않고 Artifact를 가져와서 태그를 추가하는 방법을 보여줍니다.
```python title="새 run을 생성하지 않고 아티팩트 버전에 태그 추가"
import wandb

ARTIFACT_TYPE = "<TYPE>"
ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"
VERSION = "<artifact_version>"

artifact_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}:v{VERSION}"

artifact = wandb.Api().artifact(name = artifact_name, type = ARTIFACT_TYPE)
artifact.tags = ["tag2"] # 목록에 하나 이상의 태그 제공
artifact.save()
```


다음 코드 조각은 새 run을 생성하여 Artifact를 가져와서 태그를 추가하는 방법을 보여줍니다.

```python title="run 중에 아티팩트 버전에 태그 추가"
import wandb

ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"
VERSION = "<artifact_version>"

run = wandb.init(entity = "<entity>", project="<project>")

artifact_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}:v{VERSION}"

artifact = run.use_artifact(artifact_or_name = artifact_name)
artifact.tags = ["tag2"] # 목록에 하나 이상의 태그 제공
artifact.save()
```

{{% /tab %}}
{{< /tabpane >}}

## 아티팩트 버전에 속한 태그 업데이트

`tags` 속성을 재할당하거나 변경하여 프로그래밍 방식으로 태그를 업데이트합니다. W&B는 제자리 변경 대신 `tags` 속성을 재할당하는 것을 권장하며, 이는 좋은 Python 방식입니다.

예를 들어, 다음 코드 조각은 재할당을 통해 목록을 업데이트하는 일반적인 방법을 보여줍니다. 간결성을 위해 [아티팩트 버전에 태그 추가 섹션]({{< relref path="#add-a-tag-to-an-artifact-version" lang="ko" >}})의 코드 예제를 계속합니다.

```python
artifact.tags = [*artifact.tags, "new-tag", "other-tag"]
artifact.tags = artifact.tags + ["new-tag", "other-tag"]

artifact.tags = set(artifact.tags) - set(tags_to_delete)
artifact.tags = []  # deletes all tags
```

다음 코드 조각은 제자리 변경을 사용하여 아티팩트 버전에 속한 태그를 업데이트하는 방법을 보여줍니다.

```python
artifact.tags += ["new-tag", "other-tag"]
artifact.tags.append("new-tag")

artifact.tags.extend(["new-tag", "other-tag"])
artifact.tags[:] = ["new-tag", "other-tag"]
artifact.tags.remove("existing-tag")
artifact.tags.pop()
artifact.tags.clear()
```

## 아티팩트 버전에 속한 태그 보기

W&B App UI 또는 Python SDK를 사용하여 레지스트리에 연결된 아티팩트 버전에 속한 태그를 봅니다.

{{< tabpane text=true >}}
{{% tab header="W&B App" %}}

1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 태그를 추가하려는 컬렉션 이름 옆에 있는 **세부 정보 보기**를 클릭합니다.
4. **버전** 섹션으로 스크롤합니다.

아티팩트 버전에 하나 이상의 태그가 있는 경우 **태그** 열 내에서 해당 태그를 볼 수 있습니다.

{{< img src="/images/registry/tag_artifact_version.png" alt="" >}}

{{% /tab %}}
{{% tab header="Python SDK" %}}

태그를 보려면 아티팩트 버전을 가져옵니다. 아티팩트 버전을 가져왔으면 아티팩트 오브젝트의 `tag` 속성을 확인하여 해당 아티팩트에 속한 태그를 볼 수 있습니다.

다른 Artifacts와 마찬가지로 run을 생성하지 않고도 W&B에서 Artifact를 가져오거나 run을 생성하고 해당 run 내에서 Artifact를 가져올 수 있습니다.

아래의 적절한 코드 셀을 복사하여 붙여넣어 아티팩트 버전의 태그를 추가하거나 수정합니다. `<>` 안의 값을 자신의 값으로 바꿉니다.

다음 코드 조각은 새 run을 생성하지 않고 아티팩트 버전의 태그를 가져와서 보는 방법을 보여줍니다.

```python title="새 run을 생성하지 않고 아티팩트 버전에 태그 추가"
import wandb

ARTIFACT_TYPE = "<TYPE>"
ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"
VERSION = "<artifact_version>"

artifact_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}:v{VERSION}"

artifact = wandb.Api().artifact(name = artifact_name, type = artifact_type)
print(artifact.tags)
```


다음 코드 조각은 새 run을 생성하여 아티팩트 버전의 태그를 가져와서 보는 방법을 보여줍니다.

```python title="run 중에 아티팩트 버전에 태그 추가"
import wandb

ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"
VERSION = "<artifact_version>"

run = wandb.init(entity = "<entity>", project="<project>")

artifact_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}:v{VERSION}"

artifact = run.use_artifact(artifact_or_name = artifact_name)
print(artifact.tags)
```

{{% /tab %}}
{{< /tabpane >}}

## 아티팩트 버전에서 태그 제거

1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 태그를 추가하려는 컬렉션 이름 옆에 있는 **세부 정보 보기**를 클릭합니다.
4. **버전**으로 스크롤합니다.
5. 아티팩트 버전 옆에 있는 **보기**를 클릭합니다.
6. **버전** 탭 내에서 태그 이름 위로 마우스를 가져갑니다.
7. 취소 버튼(**X** 아이콘)을 클릭합니다.

## 기존 태그 검색

W&B App UI를 사용하여 컬렉션 및 아티팩트 버전에서 기존 태그를 검색합니다.

1. W&B Registry(https://wandb.ai/registry)로 이동합니다.
2. 레지스트리 카드를 클릭합니다.
3. 검색 창에 태그 이름을 입력합니다.

{{< img src="/images/registry/search_tags.gif" alt="" >}}

## 특정 태그가 있는 아티팩트 버전 찾기

W&B Python SDK를 사용하여 태그 집합이 있는 아티팩트 버전을 찾습니다.

```python
import wandb

api = wandb.Api()
tagged_artifact_versions = api.artifacts(
    type_name = "<artifact_type>",
    name = "<artifact_name>",
    tags = ["<tag_1>", "<tag_2>"]
)

for artifact_version in tagged_artifact_versions:
    print(artifact_version.tags)
```
