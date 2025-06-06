---
title: プロジェクト
menu:
  reference:
    identifier: ja-ref-python-public-api-projects
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/projects.py#L20-L76 >}}

`Project` オブジェクトの反復可能なコレクション。

```python
Projects(
    client, entity, per_page=50
)
```

| 属性 |  |
| :--- | :--- |

## メソッド

### `convert_objects`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/projects.py#L69-L73)

```python
convert_objects()
```

### `next`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L72-L79)

```python
next()
```

### `update_variables`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L52-L53)

```python
update_variables()
```

### `__getitem__`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L65-L70)

```python
__getitem__(
    index
)
```

### `__iter__`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L26-L28)

```python
__iter__()
```

### `__len__`

[ソースを見る](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L30-L35)

```python
__len__()
```

| クラス変数 |  |
| :--- | :--- |
|  `QUERY`<a id="QUERY"></a> |   |