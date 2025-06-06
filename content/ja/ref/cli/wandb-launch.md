---
title: wandb ローンンチ
menu:
  reference:
    identifier: ja-ref-cli-wandb-launch
---

**Usage**

`wandb launch [OPTIONS]`

**Summary**

W&B ジョブ をローンンチまたはキューに追加します。詳細は https://wandb.me/launch を参照してください。

**Options**

| **Option** | **Description** |
| :--- | :--- |
| `-u, --uri (str)` | ローカルパスまたはローンンチする git リポジトリ uri 。指定された場合、このコマンドは指定された uri からジョブを作成します。 |
| `-j, --job (str)` | ローンンチするジョブの名前。指定されると、ローンンチには uri が不要です。 |
| `--entry-point` | プロジェクト内のエントリーポイント。[デフォルト: main]。エントリーポイントが見つからない場合、指定された名前のプロジェクトファイルをスクリプトとして実行しようとします。'.py' ファイルは 'python' を使用し、'.sh' ファイルは環境変数 $SHELL によって指定されたデフォルトのシェルを使用して実行します。指定された場合、設定ファイルを使用して渡されたエントリーポイントの値を上書きします。 |
| `--build-context (str)` | ソースコード内のビルドコンテキストのパス。デフォルトはソースコードのルート。-u と互換性があります。 |
| `--name` | run を実行する際に使用する run の名前。指定されない場合、ランダムな run 名が割り当てられます。指定された場合、設定ファイルを使用して渡された名前を上書きします。 |
| `-e, --entity (str)` | 新しい run が送信されるターゲットエンティティの名前。デフォルトは、ローカルの wandb/settings フォルダで設定されたエンティティを使用します。指定された場合、設定ファイルを使用して渡されたエンティティの値を上書きします。 |
| `-p, --project (str)` | 新しい run が送信されるターゲットプロジェクトの名前。デフォルトは、ソース uri または Github run の場合、git リポジトリ名を使用します。指定された場合、設定ファイルを使用して渡されたプロジェクトの値を上書きします。 |
| `-r, --resource` | run に使用する実行リソース。サポートされている値: 'local-process', 'local-container', 'kubernetes', 'sagemaker', 'gcp-vertex'。リソース設定のないキューにプッシュする場合、これは必須のパラメータです。指定された場合、設定ファイルを使用して渡されたリソースの値を上書きします。 |
| `-d, --docker-image` | 使用したい特定の Docker イメージ。形式は name:tag 。指定された場合、設定ファイルを使用して渡された Docker イメージの値を上書きします。 |
| `--base-image` | ジョブコードを実行する Docker イメージ。--docker-image と互換性がありません。 |
| `-c, --config` | JSON ファイル（'.json' で終わる必要があります）または JSON 文字列のパス。ローンンチ設定として渡されます。launch run がどのように設定されるかの指示。 |
| `-v, --set-var` | 許可リストが有効になっているキューのために、キーと値のペアとしてテンプレート変数の値を設定します。例: `--set-var key1=value1 --set-var key2=value2` |
| `-q, --queue` | プッシュする run キューの名前。指定されない場合、単一の run を直接ローンンチします。引数なしで指定された場合 (`--queue`)、キュー 'default' がデフォルトとなります。それ以外の場合、指定された名前が引数として供給されたプロジェクトとエンティティの下に存在する必要があります。 |
| `--async` | ジョブを非同期に実行するためのフラグ。デフォルトは false です。つまり、--async が設定されていない限り、wandb launch はジョブの終了を待ちます。このオプションは --queue と互換性がありません。エージェントを使用して非同期オプションを実行する場合は、wandb launch-agent で設定する必要があります。 |
| `--resource-args` | JSON ファイル（'.json' で終わる必要があります）または計算リソースに引数として渡される JSON 文字列のパス。提供されるべき正確な内容は実行バックエンドごとに異なります。このファイルのレイアウトについてはドキュメントを参照してください。 |
| `--dockerfile` | ジョブをビルドするために使用される Dockerfile のパス。ジョブのルートに対する相対パス。 |
| `--priority [critical|high|medium|low]` | --queue が指定された場合、ジョブの優先度を設定します。優先度の高いジョブから優先的にローンンチされます。優先度の順序は、最も高い順に、critical、high、medium、low です。 |