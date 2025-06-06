---
title: ローンチ
menu:
  reference:
    identifier: ja-ref-python-launch-library-launch
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/_launch.py#L249-L331 >}}

W&B ローンンチ実験をローンンチする。

```python
launch(
    api: Api,
    job: Optional[str] = None,
    entry_point: Optional[List[str]] = None,
    version: Optional[str] = None,
    name: Optional[str] = None,
    resource: Optional[str] = None,
    resource_args: Optional[Dict[str, Any]] = None,
    project: Optional[str] = None,
    entity: Optional[str] = None,
    docker_image: Optional[str] = None,
    config: Optional[Dict[str, Any]] = None,
    synchronous: Optional[bool] = (True),
    run_id: Optional[str] = None,
    repository: Optional[str] = None
) -> AbstractRun
```

| 引数 |  |
| :--- | :--- |
|  `job` |  wandb.Job への文字列参照 例: wandb/test/my-job:latest |
|  `api` |  wandb.apis.internal からの wandb Api のインスタンス。 |
|  `entry_point` |  プロジェクト内で run するエントリーポイント。デフォルトは wandb URI のオリジナル run で使用されたエントリーポイント、または git リポジトリ URI の場合は main.py を使用します。 |
|  `version` |  Git ベースのプロジェクトのためのコミットハッシュまたはブランチ名。 |
|  `name` |  ローンンチする run の名前。 |
|  `resource` |  run の実行バックエンド。 |
|  `resource_args` |  リモートバックエンドに run をローンンチするためのリソース関連の引数。`resource_args` 内のコンストラクトされたローンンチ設定に保存されます。 |
|  `project` |  ローンンチされた run を送信する対象プロジェクト |
|  `entity` |  ローンンチされた run を送信する対象エンティティ |
|  `config` |  run のための設定を含む辞書。リソース固有の引数を "resource_args" キーの下に含めることもできます。 |
|  `synchronous` |  run の完了を待つ間ブロックするかどうか。デフォルトは True です。注意: `synchronous` が False で `backend` が "local-container" の場合、このメソッドは返されますが、現在のプロセスはローカル run が完了するまで終了時にブロックします。現在のプロセスが中断された場合、このメソッドを通じてローンンチされた非同期 run は終了されます。`synchronous` が True で run が失敗した場合、現在のプロセスもエラーになります。 |
|  `run_id` |  run の ID (最終的に :name: フィールドを置き換えます) |
|  `repository` |  リモートレジストリのリポジトリパスの文字列名 |

#### 例:

```python
from wandb.sdk.launch import launch

job = "wandb/jobs/Hello World:latest"
params = {"epochs": 5}
# W&B プロジェクトを実行し、再現可能な Docker 環境を作成
# ローカルホストで
api = wandb.apis.internal.Api()
launch(api, job, parameters=params)
```

| 戻り値 |  |
| :--- | :--- |
|  `wandb.launch.SubmittedRun` のインスタンスで、ローンンチされた run に関する情報（例: run ID）を公開します。 |

| 例外 |  |
| :--- | :--- |
|  `wandb.exceptions.ExecutionError` ブロックモードでローンンチされた run が不成功の場合。 |