---
title: Ray チューニング
description: W&B を Ray Tune と統合する方法。
menu:
  default:
    identifier: ja-guides-integrations-ray-tune
    parent: integrations
weight: 360
---

W&B は、2 つの軽量なインテグレーションを提供することで [Ray](https://github.com/ray-project/ray) と統合します。

- `WandbLoggerCallback` 関数は、Tune に報告されたメトリクスを Wandb API に自動的にログします。
- `setup_wandb()` 関数は、関数 API で使用でき、Tune のトレーニング情報を使用して Wandb API を自動的に初期化します。通常どおり Wandb API を使用できます。例えば、`wandb.log()` を使用してトレーニングプロセスをログすることができます。

## インテグレーションを設定

```python
from ray.air.integrations.wandb import WandbLoggerCallback
```

Wandb の設定は、`tune.run()` の `config` 引数に wandb キーを渡すことで行います（以下の例を参照）。

wandb の設定エントリの内容は、`wandb.init()` にキーワード引数として渡されます。以下の設定は例外で、`WandbLoggerCallback` 自体を設定するために使用されます:

### パラメータ

`project (str)`: Wandb プロジェクトの名前。必須。

`api_key_file (str)`: Wandb API キーを含むファイルへのパス。

`api_key (str)`: Wandb API キー。`api_key_file` の設定に代わるものです。

`excludes (list)`: ログから除外するメトリクスのリスト。

`log_config (bool)`: 結果辞書の設定パラメータをログするかどうか。デフォルトは False です。

`upload_checkpoints (bool)`: True の場合、モデルのチェックポイントがアーティファクトとしてアップロードされます。デフォルトは False です。

### 例

```python
from ray import tune, train
from ray.air.integrations.wandb import WandbLoggerCallback


def train_fc(config):
    for i in range(10):
        train.report({"mean_accuracy": (i + config["alpha"]) / 10})


tuner = tune.Tuner(
    train_fc,
    param_space={
        "alpha": tune.grid_search([0.1, 0.2, 0.3]),
        "beta": tune.uniform(0.5, 1.0),
    },
    run_config=train.RunConfig(
        callbacks=[
            WandbLoggerCallback(
                project="<your-project>", api_key="<your-api-key>", log_config=True
            )
        ]
    ),
)

results = tuner.fit()
```

## setup_wandb

```python
from ray.air.integrations.wandb import setup_wandb
```

このユーティリティ関数は、Ray Tune で Wandb を使用するための初期化を支援します。基本的な使用法として、トレーニング関数内で `setup_wandb()` を呼び出します:

```python
from ray.air.integrations.wandb import setup_wandb


def train_fn(config):
    # Wandb を初期化
    wandb = setup_wandb(config)

    for i in range(10):
        loss = config["a"] + config["b"]
        wandb.log({"loss": loss})
        tune.report(loss=loss)


tuner = tune.Tuner(
    train_fn,
    param_space={
        # 検索スペースをここに定義
        "a": tune.choice([1, 2, 3]),
        "b": tune.choice([4, 5, 6]),
        # wandb の設定
        "wandb": {"project": "Optimization_Project", "api_key_file": "/path/to/file"},
    },
)
results = tuner.fit()
```

## 例コード

インテグレーションがどのように機能するかを見るためにいくつかの例を作成しました：

* [Colab](http://wandb.me/raytune-colab): インテグレーションを試すためのシンプルなデモ。
* [Dashboard](https://wandb.ai/anmolmann/ray_tune): 例から生成されたダッシュボードを表示。