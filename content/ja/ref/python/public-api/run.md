---
title: Run
menu:
  reference:
    identifier: ja-ref-python-public-api-run
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L276-L1007 >}}

エンティティおよびプロジェクトに関連付けられた単一の run。

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

| 属性 |  |
| :--- | :--- |

## メソッド

### `create`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L377-L417)

```python
@classmethod
create(
    api, run_id=None, project=None, entity=None
)
```

指定されたプロジェクトのために run を作成します。

### `delete`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L540-L568)

```python
delete(
    delete_artifacts=(False)
)
```

指定された run を wandb バックエンドから削除します。

### `display`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L16-L37)

```python
display(
    height=420, hidden=(False)
) -> bool
```

このオブジェクトを Jupyter で表示します。

### `file`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L632-L642)

```python
file(
    name
)
```

指定された名前のファイルのパスをアーティファクトで返します。

| 引数 |  |
| :--- | :--- |
|  name (str): 要求されたファイルの名前。 |

| 戻り値 |  |
| :--- | :--- |
|  指定された name 引数と一致する `File`。 |

### `files`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L619-L630)

```python
files(
    names=None, per_page=50
)
```

指定された名前のすべてのファイルのファイルパスを返します。

| 引数 |  |
| :--- | :--- |
|  names (list): 要求されたファイルの名前、指定されていない場合はすべてのファイルを返す。 per_page (int): ページあたりの結果数。 |

| 戻り値 |  |
| :--- | :--- |
|  `Files` オブジェクトで、これは `File` オブジェクトのイテレータです。 |

### `history`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L668-L708)

```python
history(
    samples=500, keys=None, x_axis="_step", pandas=(True), stream="default"
)
```

run のサンプル化された履歴メトリクスを返します。

履歴レコードがサンプリングされることを許容できる場合、こちらの方が簡単で高速です。

| 引数 |  |
| :--- | :--- |
|  `samples` |  (int, オプション) 返すサンプル数 |
|  `pandas` |  (bool, オプション) パンダのデータフレームを返す |
|  `keys` |  (list, オプション) 特定のキーのメトリクスのみを返す |
|  `x_axis` |  (str, オプション) xAxis として使用するメトリクス、デフォルトは _step |
|  `stream` |  (str, オプション) メトリクス用の "default"、マシンメトリクス用の "system" |

| 戻り値 |  |
| :--- | :--- |
|  `pandas.DataFrame` |  pandas=True の場合は歴史メトリクスの `pandas.DataFrame` を返します。 pandas=False の場合は歴史メトリクスの辞書のリストを返します。 |

### `load`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L419-L488)

```python
load(
    force=(False)
)
```

### `log_artifact`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L860-L905)

```python
log_artifact(
    artifact: "wandb.Artifact",
    aliases: Optional[Collection[str]] = None,
    tags: Optional[Collection[str]] = None
)
```

アーティファクトを run の出力として宣言します。

| 引数 |  |
| :--- | :--- |
|  artifact (`Artifact`): `wandb.Api().artifact(name)` から返されたアーティファクト。 aliases (list, オプション): このアーティファクトに適用するエイリアス。 |
|  `tags` |  (list, オプション) このアーティファクトに適用するタグ。 |

| 戻り値 |  |
| :--- | :--- |
|  `Artifact` オブジェクト。 |

### `logged_artifacts`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L766-L798)

```python
logged_artifacts(
    per_page: int = 100
) -> public.RunArtifacts
```

この run によってログされているすべてのアーティファクトを取得します。

run 中にログされたすべての出力アーティファクトを取得します。取得した結果はページネーションされ、イテレートするか、単一のリストにまとめることができます。

| 引数 |  |
| :--- | :--- |
|  `per_page` |  API リクエストごとに取得するアーティファクトの数。 |

| 戻り値 |  |
| :--- | :--- |
|  この run 中に出力として記録されたすべての Artifact オブジェクトのイテレート可能なコレクション。 |

#### 例:

```
>>> import wandb
>>> import tempfile
>>> with tempfile.NamedTemporaryFile(
...     mode="w", delete=False, suffix=".txt"
... ) as tmp:
...     tmp.write("これはテストアーティファクトです")
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

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L570-L571)

```python
save()
```

### `scan_history`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L710-L764)

```python
scan_history(
    keys=None, page_size=1000, min_step=None, max_step=None
)
```

run のすべての履歴レコードをイテレート可能なコレクションで返します。

#### 例:

例として全ての損失値をエクスポート

```python
run = api.run("l2k2/examples-numpy-boston/i0wt6xua")
history = run.scan_history(keys=["Loss"])
losses = [row["Loss"] for row in history]
```

| 引数 |  |
| :--- | :--- |
|  keys ([str], オプション): これらのキーのみをフェッチし、これらの定義されたすべてのキーを含む行のみをフェッチします。 page_size (int, オプション): API からフェッチするページのサイズ。 min_step (int, オプション): 一度にスキャンするページの最小数。 max_step (int, オプション): 一度にスキャンするページの最大数。 |

| 戻り値 |  |
| :--- | :--- |
|  履歴レコード (辞書) のイテレート可能なコレクション。 |

### `snake_to_camel`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L12-L14)

```python
snake_to_camel(
    string
)
```

### `to_html`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L993-L1001)

```python
to_html(
    height=420, hidden=(False)
)
```

この run を表示する iframe を含む HTML を生成します。

### `update`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L512-L538)

```python
update()
```

run オブジェクトに対する変更を wandb バックエンドに保存します。

### `upload_file`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L644-L666)

```python
upload_file(
    path, root="."
)
```

ファイルをアップロードします。

| 引数 |  |
| :--- | :--- |
|  path (str): アップロードするファイルの名前。 root (str): ファイルを保存するルートパス。例: ファイルを "my_dir/file.txt" として保存したい場合で、現在 "my_dir" にいる場合は、 root を "../" に設定します。 |

| 戻り値 |  |
| :--- | :--- |
|  指定された name 引数に一致する `File`。 |

### `use_artifact`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L827-L858)

```python
use_artifact(
    artifact, use_as=None
)
```

アーティファクトを run への入力として宣言します。

| 引数 |  |
| :--- | :--- |
|  artifact (`Artifact`): `wandb.Api().artifact(name)` から返されたアーティファクト。 use_as (string, オプション): スクリプトでアーティファクトがどのように使用されるかを識別する文字列。 run で使用されるアーティファクトを簡単に識別するために、ベータ版の wandb launch 機能のアーティファクト交換機能を使用します。 |

| 戻り値 |  |
| :--- | :--- |
|  `Artifact` オブジェクト。 |

### `used_artifacts`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L800-L825)

```python
used_artifacts(
    per_page: int = 100
) -> public.RunArtifacts
```

この run で明示的に使用されているアーティファクトを取得します。

run 中に明示的に使用された入力アーティファクトのみを取得します。通常は `run.use_artifact()` を通じて宣言される。取得した結果はページネーションされ、イテレートするか、単一のリストにまとめることができます。

| 引数 |  |
| :--- | :--- |
|  `per_page` |  API リクエストごとに取得するアーティファクトの数。 |

| 戻り値 |  |
| :--- | :--- |
|  この run 中に入力として明示的に使用された Artifact オブジェクトのイテレート可能なコレクション。 |

#### 例:

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

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/runs.py#L490-L510)

```python
wait_until_finished()
```