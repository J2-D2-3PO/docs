---
title: グラフ
menu:
  reference:
    identifier: ja-ref-python-data-types-graph
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/graph.py#L245-L405 >}}

グラフ用の Wandb クラス。

```python
Graph(
    format="keras"
)
```

このクラスは通常、ニューラルネットモデルを保存し表示するために使用されます。ツリーをノードとエッジの配列として表現します。ノードには、wandb で可視化できるラベルを持たせることができます。

#### 例:

Keras モデルをインポート:

```
Graph.from_keras(keras_model)
```

## メソッド

### `add_edge`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/graph.py#L330-L334)

```python
add_edge(
    from_node, to_node
)
```

### `add_node`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/graph.py#L318-L328)

```python
add_node(
    node=None, **node_kwargs
)
```

### `from_keras`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/graph.py#L336-L366)

```python
@classmethod
from_keras(
    model
)
```

### `pprint`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/graph.py#L312-L316)

```python
pprint()
```

### `__getitem__`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/graph.py#L309-L310)

```python
__getitem__(
    nid
)
```