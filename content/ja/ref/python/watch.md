---
title: watch
menu:
  reference:
    identifier: ja-ref-python-watch
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/wandb_run.py#L2801-L2836 >}}

指定された PyTorch モデルにフックし、勾配やモデルの計算グラフを監視します。

```python
watch(
    models: (torch.nn.Module | Sequence[torch.nn.Module]),
    criterion: (torch.F | None) = None,
    log: (Literal['gradients', 'parameters', 'all'] | None) = "gradients",
    log_freq: int = 1000,
    idx: (int | None) = None,
    log_graph: bool = (False)
) -> None
```

この関数はトレーニング中にパラメータと勾配、またはその両方を追跡できます。将来的には任意の機械学習モデルをサポートするように拡張されるべきです。

| Args |  |
| :--- | :--- |
|  models (Union[torch.nn.Module, Sequence[torch.nn.Module]]): 監視する単一のモデルまたは複数のモデルのシーケンス。 criterion (Optional[torch.F]): 最適化される損失関数（オプション）。 log (Optional[Literal["gradients", "parameters", "all"]]): "gradients", "parameters", または "all" をログに記録するかどうかを指定します。None に設定するとログは無効になります。 (default="gradients") log_freq (int): 勾配とパラメータをログに記録する頻度（バッチごと）。 (default=1000) idx (Optional[int]): `wandb.watch` を使って複数モデルを追跡する際に使用されるインデックス。 (default=None) log_graph (bool): モデルの計算グラフをログに記録するかどうか。 (default=False) |

| Raises |  |
| :--- | :--- |
|  `ValueError` |  `wandb.init` が呼び出されていない場合、またはモデルが `torch.nn.Module` のインスタンスでない場合に発生します。 |