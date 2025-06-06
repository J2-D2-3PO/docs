---
title: バージョンをタグで整理する
description: コレクションやコレクション内のアーティファクト バージョンを整理するためにタグを使用します。タグは、Python SDK または W&B
  アプリ UI で追加、削除、編集が可能です。
menu:
  default:
    identifier: ja-guides-core-registry-organize-with-tags
    parent: registry
weight: 7
---

コレクションやアーティファクトバージョンをレジストリ内で整理するためにタグを作成し追加します。W&B アプリ UI または W&B Python SDK を使用して、コレクションまたはアーティファクトバージョンにタグを追加、変更、表示、削除できます。

{{% alert title="エイリアスとタグの使い分け" %}}
特定のアーティファクトバージョンを一意に参照する必要がある場合は、エイリアスを使用します。例えば、`artifact_name:alias` が常に単一で特定のバージョンを指すように、「production」や「latest」といったエイリアスを使用します。

より自由にグループ化や検索をしたい場合は、タグを使用します。タグは複数のバージョンやコレクションが同じラベルを共有できるときに理想的で、特定の識別子に関連付けられるバージョンが一つだけである保証は必要ありません。
{{% /alert %}}

## コレクションにタグを追加する

W&B アプリ UI または Python SDK を使用してコレクションにタグを追加します。

{{< tabpane text=true >}}
{{% tab header="W&B App" %}}

W&B アプリ UI を使用してコレクションにタグを追加します。

1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. コレクション名の横にある **View details** をクリックします
4. コレクションカード内で、**Tags** フィールドの隣にあるプラスアイコン (**+**) をクリックし、タグの名前を入力します
5. キーボードの **Enter** を押します

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

## コレクションに属するタグを更新する

`tags` 属性を再割り当てするか、変更することでプログラム上でタグを更新します。W&B は `tags` 属性をインプレースで変更するのではなく、再割り当てすることを推奨しており、これは良い Python の習慣でもあります。

例えば、以下のコードスニペットは、再割り当てを用いてリストを更新する一般的な方法を示しています。簡潔にするために、このコード例は [コレクションにタグを追加するセクション]({{< relref path="#add-a-tag-to-a-collection" lang="ja" >}}) から続いています。

```python
collection.tags = [*collection.tags, "new-tag", "other-tag"]
collection.tags = collection.tags + ["new-tag", "other-tag"]

collection.tags = set(collection.tags) - set(tags_to_delete)
collection.tags = []  # すべてのタグを削除
```

次のコードスニペットは、インプレースでの変更を使用してアーティファクトバージョンに属するタグを更新する方法を示しています。

```python
collection.tags += ["new-tag", "other-tag"]
collection.tags.append("new-tag")

collection.tags.extend(["new-tag", "other-tag"])
collection.tags[:] = ["new-tag", "other-tag"]
collection.tags.remove("existing-tag")
collection.tags.pop()
collection.tags.clear()
```

## コレクションに属するタグを表示する

W&B アプリ UI を使用してコレクションに追加されたタグを表示します。

1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. コレクション名の横にある **View details** をクリックします

コレクションに 1 つ以上のタグがある場合、それらのタグはコレクションカード内の **Tags** フィールドの隣に表示されます。

{{< img src="/images/registry/tag_collection_selected.png" alt="" >}}

コレクションに追加されたタグは、コレクション名の隣にも表示されます。

例えば、以下の画像では、「zoo-dataset-tensors」コレクションに "tag1" というタグが追加されています。

{{< img src="/images/registry/tag_collection.png" alt="" >}}

## コレクションからタグを削除する

W&B アプリ UI を使用してコレクションからタグを削除します。

1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. コレクション名の横にある **View details** をクリックします
4. コレクションカード内で、削除したいタグの名前の上にマウスを移動してください
5. キャンセルボタン（**X** アイコン）をクリックします

## アーティファクトバージョンにタグを追加する

W&B アプリ UI または Python SDK を使用して、コレクションにリンクされたアーティファクトバージョンにタグを追加します。

{{< tabpane text=true >}}
{{% tab header="W&B App" %}}
1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. タグを追加したいコレクションの名前の横にある **View details** をクリックします
4. 下にスクロールして **Versions** を表示します
5. アーティファクトバージョンの横にある **View** をクリックします
6. **Version** タブ内で、**Tags** フィールドの隣にあるプラスアイコン (**+**) をクリックし、タグの名前を入力します
7. キーボードの **Enter** を押します

{{< img src="/images/registry/add_tag_linked_artifact_version.gif" alt="" >}}

{{% /tab %}}
{{% tab header="Python SDK" %}}
タグを追加または更新したいアーティファクトバージョンを取得します。アーティファクトバージョンを取得したら、アーティファクトオブジェクトの `tag` 属性にアクセスして、そのアーティファクトのタグを追加または変更します。1 つ以上のタグをリストとして `tag` 属性に渡します。

他のアーティファクト同様、W&B からアーティファクトを取得するのに run を作成する必要はありませんが、run を作成し、その run の中でアーティファクトを取得することもできます。どちらの場合でも、W&B サーバー上でアーティファクトを更新するために、アーティファクトオブジェクトの `save` メソッドを呼び出すことを確認してください。

以下のコードセルをコピーして、アーティファクトバージョンのタグを追加または変更します。`<>` 内の値を自分のものに置き換えてください。

次のコードスニペットは、新しい run を作成せずにアーティファクトを取得してタグを追加する方法を示しています。

```python title="Add a tag to an artifact version without creating a new run"
import wandb

ARTIFACT_TYPE = "<TYPE>"
ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"
VERSION = "<artifact_version>"

artifact_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}:v{VERSION}"

artifact = wandb.Api().artifact(name = artifact_name, type = ARTIFACT_TYPE)
artifact.tags = ["tag2"] # リストに 1 つ以上のタグを提供
artifact.save()
```

次のコードスニペットは、新しい run を作成してアーティファクトを取得し、タグを追加する方法を示しています。

```python title="Add a tag to an artifact version during a run"
import wandb

ORG_NAME = "<org_name>"
REGISTRY_NAME = "<registry_name>"
COLLECTION_NAME = "<collection_name>"
VERSION = "<artifact_version>"

run = wandb.init(entity = "<entity>", project="<project>")

artifact_name = f"{ORG_NAME}/wandb-registry-{REGISTRY_NAME}/{COLLECTION_NAME}:v{VERSION}"

artifact = run.use_artifact(artifact_or_name = artifact_name)
artifact.tags = ["tag2"] # リストに 1 つ以上のタグを提供
artifact.save()
```

{{% /tab %}}
{{< /tabpane >}}

## アーティファクトバージョンに属するタグを更新する

`tags` 属性を再割り当てするか、変更することでプログラム上でタグを更新します。W&B は `tags` 属性をインプレースで変更するのではなく、再割り当てすることを推奨しており、これは良い Python の習慣でもあります。

例えば、以下のコードスニペットは、再割り当てを用いてリストを更新する一般的な方法を示しています。簡潔にするために、このコード例は [アーティファクトバージョンにタグを追加するセクション]({{< relref path="#add-a-tag-to-an-artifact-version" lang="ja" >}}) から続いています。

```python
artifact.tags = [*artifact.tags, "new-tag", "other-tag"]
artifact.tags = artifact.tags + ["new-tag", "other-tag"]

artifact.tags = set(artifact.tags) - set(tags_to_delete)
artifact.tags = []  # すべてのタグを削除
```

次のコードスニペットは、インプレースでの変更を使用してアーティファクトバージョンに属するタグを更新する方法を示しています。

```python
artifact.tags += ["new-tag", "other-tag"]
artifact.tags.append("new-tag")

artifact.tags.extend(["new-tag", "other-tag"])
artifact.tags[:] = ["new-tag", "other-tag"]
artifact.tags.remove("existing-tag")
artifact.tags.pop()
artifact.tags.clear()
```

## アーティファクトバージョンに属するタグを表示する

W&B アプリ UI または Python SDK を使用して、レジストリにリンクされたアーティファクトバージョンに属するタグを表示します。

{{< tabpane text=true >}}
{{% tab header="W&B App" %}}

1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. タグを追加したいコレクションの名前の横にある **View details** をクリックします
4. 下にスクロールして **Versions** セクションを表示します

アーティファクトバージョンに 1 つ以上のタグがある場合、それらのタグは **Tags** 列に表示されます。

{{< img src="/images/registry/tag_artifact_version.png" alt="" >}}

{{% /tab %}}
{{% tab header="Python SDK" %}}

アーティファクトバージョンを取得して、そのタグを表示します。アーティファクトバージョンを取得したら、アーティファクトオブジェクトの `tag` 属性を表示して、そのアーティファクトに属するタグを表示します。

他のアーティファクト同様、W&B からアーティファクトを取得するのに run を作成する必要はありませんが、run を作成し、その run の中でアーティファクトを取得することもできます。

以下のコードセルをコピーして、アーティファクトバージョンのタグを追加または変更します。`<>` 内の値を自分のものに置き換えてください。

次のコードスニペットは、新しい run を作成せずにアーティファクトバージョンを取得して表示する方法を示しています。

```python title="Add a tag to an artifact version without creating a new run"
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

次のコードスニペットは、新しい run を作成してアーティファクトバージョンのタグを取得して表示する方法を示しています。

```python title="Add a tag to an artifact version during a run"
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


## アーティファクトバージョンからタグを削除する

1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. タグを追加したいコレクションの名前の横にある **View details** をクリックします
4. 下にスクロールして **Versions** を表示します
5. アーティファクトバージョンの横にある **View** をクリックします
6. **Version** タブ内でタグの名前の上にマウスを移動してください
7. キャンセルボタン（**X** アイコン）をクリックします

## 既存のタグを検索する

W&B アプリ UI を使用して、コレクションやアーティファクトバージョン内の既存のタグを検索します。

1. W&B レジストリに移動します: https://wandb.ai/registry
2. レジストリカードをクリックします
3. 検索バー内にタグの名前を入力します

{{< img src="/images/registry/search_tags.gif" alt="" >}}

## 特定のタグを持つアーティファクトバージョンを見つける

W&B Python SDK を使用して、特定のタグセットを持つアーティファクトバージョンを見つけます。

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