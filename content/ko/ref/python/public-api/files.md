---
title: Files
menu:
  reference:
    identifier: ko-ref-python-public-api-files
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/files.py#L44-L107 >}}

`File` 오브젝트의 반복 가능한 컬렉션입니다.

```python
Files(
    client, run, names=None, per_page=50, upload=(False)
)
```

| 속성 |  |
| :--- | :--- |

## 메소드

### `convert_objects`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/files.py#L100-L104)

```python
convert_objects()
```

### `next`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L72-L79)

```python
next()
```

### `update_variables`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/public/files.py#L97-L98)

```python
update_variables()
```

### `__getitem__`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L65-L70)

```python
__getitem__(
    index
)
```

### `__iter__`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L26-L28)

```python
__iter__()
```

### `__len__`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/apis/paginator.py#L30-L35)

```python
__len__()
```

| 클래스 변수 |  |
| :--- | :--- |
| `QUERY`<a id="QUERY"></a> |   |
