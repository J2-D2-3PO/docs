---
title: WandbMetricsLogger
menu:
  reference:
    identifier: ja-ref-python-integrations-keras-wandbmetricslogger
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/integration/keras/callbacks/metrics_logger.py#L16-L129 >}}

システムメトリクスを W&B に送信するロガー。

```python
WandbMetricsLogger(
    log_freq: Union[LogStrategy, int] = "epoch",
    initial_global_step: int = 0,
    *args,
    **kwargs
) -> None
```

`WandbMetricsLogger` は、コールバックメソッドが引数として取る `logs` 辞書を自動的に wandb にログします。

このコールバックは、次の情報を W&B の run ページに自動的にログします:

* システム (CPU/GPU/TPU) メトリクス、
* `model.compile` で定義されたトレーニングと検証メトリクス、
* 学習率（固定値または学習率スケジューラのどちらも）

#### 注釈:

`initial_epoch` を `model.fit` に渡してトレーニングを再開し、かつ学習率スケジューラを使用している場合、`initial_global_step` を `WandbMetricsLogger` に渡すことを確認してください。`initial_global_step`は `step_size * initial_step` であり、ここで `step_size` はエポックごとのトレーニングステップ数です。`step_size` はトレーニングデータセットの基数とバッチサイズの積として計算できます。

| 引数 |  |
| :--- | :--- |
|  `log_freq` |  ("epoch", "batch", または int) "epoch" の場合、各エポックの終了時にメトリクスをログします。"batch" の場合、各バッチの終了時にメトリクスをログします。整数の場合、そのバッチ数の終了時にメトリクスをログします。デフォルトは "epoch" です。 |
|  `initial_global_step` |  (int) ある `initial_epoch` からトレーニングを再開し、学習率スケジューラを使用している場合に、学習率を正しくログするためにこの引数を使用します。これは `step_size * initial_step` として計算できます。デフォルトは 0 です。 |

## メソッド

### `set_model`

```python
set_model(
    model
)
```

### `set_params`

```python
set_params(
    params
)
```