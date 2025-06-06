---
title: TensorBoard
menu:
  default:
    identifier: ja-guides-integrations-tensorboard
    parent: integrations
weight: 430
---

{{< cta-button colabLink="https://github.com/wandb/examples/blob/master/colabs/tensorboard/TensorBoard_and_Weights_and_Biases.ipynb" >}}

{{% alert %}}
W&B は、W&B マルチテナント SaaS のために埋め込まれた TensorBoard をサポートしています。
{{% /alert %}}

あなたの TensorBoard ログをクラウドにアップロードし、同僚やクラスメートと迅速に結果を共有し、分析を一元化された場所に保つことができます。

{{< img src="/images/integrations/tensorboard_oneline_code.webp" alt="" >}}

## 始めましょう

```python
import wandb

# `sync_tensorboard=True` で wandb run を開始
wandb.init(project="my-project", sync_tensorboard=True)

# TensorBoard を使用した トレーニング コード
...

# [オプション]wandb run を終了して tensorboard ログを W&B にアップロード（ノートブックの場合）
wandb.finish()
```

[例](https://wandb.ai/rymc/simple-tensorboard-example/runs/oab614zf/tensorboard)を確認してください。

run が終了すると、W&B で TensorBoard イベントファイルに アクセス でき、W&B ネイティブチャートでメトリクスを視覚化できます。システムの CPU や GPU の利用状況、`git` の状態、run が使用したターミナルコマンドなどの追加情報と一緒に表示されます。

{{% alert %}}
W&B はすべての バージョン の TensorFlow を使用した TensorBoard をサポートしています。また、W&B は TensorFlow 1.14 以上の バージョン で PyTorch および TensorBoardX もサポートしています。
{{% /alert %}}

## よくある質問

### TensorBoard に ログ されていないメトリクスを W&B に ログ するにはどうすればよいですか？

TensorBoard にログされていないカスタムメトリクスを追加でログする必要がある場合、`wandb.log`をコード内で呼び出すことができます。`wandb.log({"custom": 0.8})`

Tensorboard を同期する際、`wandb.log` でステップ引数を設定することはできません。異なるステップ数を設定したい場合は、次のようにステップメトリクスを使ってメトリクスをログできます。

`wandb.log({"custom": 0.8, "global_step": global_step})`

### `wandb` で Tensorboard を使用する場合、どのように設定すれば良いですか？

TensorBoard のパッチに対する制御をもっと持ちたい場合、`wandb.init` に `sync_tensorboard=True` を渡す代わりに `wandb.tensorboard.patch` を呼び出すことができます。

```python
import wandb

wandb.tensorboard.patch(root_logdir="<logging_directory>")
wandb.init()

# ノートブックの場合、wandb run を終了して tensorboard ログを W&B にアップロード
wandb.finish()
```

このメソッドに `tensorboard_x=False` を渡すことで、バニラ TensorBoard がパッチされるように確保できます。PyTorch で TensorBoard > 1.14 を使用している場合は、 `pytorch=True` を渡して確保することができます。これらのオプションは、インポートされたこれらのライブラリの バージョン に応じて、賢いデフォルトを持っています。

デフォルトでは、`tfevents` ファイルと `.pbtxt` ファイルを同期します。これによりあなたのために TensorBoard インスタンスをローンンチできるようになります。run ページには [TensorBoard タブ](https://www.wandb.com/articles/hosted-tensorboard) が表示されます。この振る舞いは、`wandb.tensorboard.patch` に `save=False` を渡すことで無効にできます。

```python
import wandb

wandb.init()
wandb.tensorboard.patch(save=False, tensorboard_x=True)

# ノートブックの場合、wandb run を終了して tensorboard ログを W&B にアップロード
wandb.finish()
```

{{% alert color="secondary" %}}
`tf.summary.create_file_writer` または `torch.utils.tensorboard` 経由で `SummaryWriter` を構築する**前**に、`wandb.init` または `wandb.tensorboard.patch` のいずれかを呼び出す必要があります。
{{% /alert %}}

### 過去の TensorBoard runs を同期するにはどうすればよいですか?

ローカルに保存されている既存の `tfevents` ファイルを W&B にインポートしたい場合は、`wandb sync log_dir` を実行できます。ここで `log_dir` は `tfevents` ファイルを含むローカルディレクトリーです。

### Google Colab や Jupyter を TensorBoard で使用するにはどうすればよいですか？

Jupyter または Colab ノートブックでコードを実行する場合、トレーニングの終了時に `wandb.finish()` を呼び出してください。これにより wandb run は完了し、tensorboard ログを W&B にアップロードして視覚化できるようになります。 `.py` スクリプトを実行する場合、スクリプトが終了すると自動的に wandb も終了するため、これは必要ありません。

ノートブック 環境 でシェル コマンド を実行するには、`!` を先頭に付ける必要があります。例：`!wandb sync directoryname`。

### PyTorch を TensorBoard で使用するにはどうすればよいですか？

もし PyTorch の TensorBoard インテグレーションを使用している場合、PyTorch Profiler JSON ファイルを手動でアップロードする必要があります。

```python
wandb.save(glob.glob(f"runs/*.pt.trace.json")[0], base_path=f"runs")
```