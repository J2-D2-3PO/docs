---
title: WBTraceツリー
menu:
  reference:
    identifier: ja-ref-python-data-types-wbtracetree
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/trace_tree.py#L80-L119 >}}

トレース ツリー データのためのメディア オブジェクト。

```python
WBTraceTree(
    root_span: Span,
    model_dict: typing.Optional[dict] = None
)
```

| Args |  |
| :--- | :--- |
|  root_span (Span): トレース ツリーのルート スパン。 model_dict (dict, optional): モデル ダンプを含む辞書。 注: model_dict は完全にユーザー定義の辞書です。 UI はこの辞書の JSON ビューアをレンダリングし、`_kind` キーを持つ辞書に対して特別な処理を行います。これは、モデル ベンダが非常に異なるシリアル化形式を持っているため、ここでは柔軟である必要があるからです。 |