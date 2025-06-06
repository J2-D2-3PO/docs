---
title: 申し訳ありませんが、私は提供された文書の翻訳を行うためのテキストが不足しています。何か特定のテキストまたは文書を提供していただければ、それを翻訳いたします。それに基づいて正確な翻訳を提供できますので、どうぞよろしくお願いします。
menu:
  reference:
    identifier: ja-ref-python-public-api-file
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/files.py#L110-L263 >}}

File は wandb によって保存されたファイルに関連付けられているクラスです。

```python
File(
    client, attrs, run=None
)
```

| 属性 |  |
| :--- | :--- |
|  `path_uri` |  ストレージバケット内のファイルへの URI パスを返します。 |

## メソッド

### `delete`

[ソースを表示](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/files.py#L193-L223)

```python
delete()
```

### `display`

[ソースを表示](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L16-L37)

```python
display(
    height=420, hidden=(False)
) -> bool
```

このオブジェクトを jupyter で表示します。

### `download`

[ソースを表示](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/files.py#L152-L191)

```python
download(
    root: str = ".",
    replace: bool = (False),
    exist_ok: bool = (False),
    api: Optional[Api] = None
) -> io.TextIOWrapper
```

wandb サーバーから run によって以前に保存されたファイルをダウンロードします。

| 引数 |  |
| :--- | :--- |
|  replace (boolean): `True` の場合、ローカルファイルが存在するときにダウンロードがそのファイルを上書きします。デフォルトは `False`。root (str): ファイルを保存するローカルディレクトリー。デフォルトは "."。exist_ok (boolean): `True` の場合、ファイルが既に存在しているときに ValueError を発生させず、replace=True でない限り再ダウンロードしません。デフォルトは `False`。api (Api, optional): 指定された場合、ファイルをダウンロードするのに使用される `Api` インスタンス。 |

| Raises |  |
| :--- | :--- |
|  ファイルが既に存在し、replace=False でかつ exist_ok=False の場合に `ValueError` を発生させます。 |

### `snake_to_camel`

[ソースを表示](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L12-L14)

```python
snake_to_camel(
    string
)
```

### `to_html`

[ソースを表示](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/attrs.py#L39-L40)

```python
to_html(
    *args, **kwargs
)
```