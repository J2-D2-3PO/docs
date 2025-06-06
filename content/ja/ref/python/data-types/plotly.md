---
title: Plotly
menu:
  reference:
    identifier: ja-ref-python-data-types-plotly
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/plotly.py#L33-L82 >}}

Wandb クラスは plotly のプロット用です。

```python
Plotly(
    val: Union['plotly.Figure', 'matplotlib.artist.Artist']
)
```

| Arg |  |
| :--- | :--- |
|  `val` |  matplotlib または plotly の図 |

## メソッド

### `make_plot_media`

[ソースを表示](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/plotly.py#L42-L50)

```python
@classmethod
make_plot_media(
    val: Union['plotly.Figure', 'matplotlib.artist.Artist']
) -> Union[Image, 'Plotly']
```