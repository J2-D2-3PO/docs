---
title: エージェント
menu:
  reference:
    identifier: ja-ref-python-agent
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/wandb_agent.py#L532-L576 >}}

1つまたは複数の sweep agent を開始します。

```python
agent(
    sweep_id: str,
    function: Optional[Callable] = None,
    entity: Optional[str] = None,
    project: Optional[str] = None,
    count: Optional[int] = None
) -> None
```

sweep agent は `sweep_id` を使用して、どの sweep の一部であるか、どの関数を実行するか、そして（オプションで）いくつのエージェントを実行するかを知ります。

| Args |  |
| :--- | :--- |
|  `sweep_id` |  sweep のユニークな識別子。sweep ID は W&B CLI または Python SDK によって生成されます。 |
|  `function` |  sweep 設定で指定された「プログラム」の代わりに呼び出す関数。 |
|  `entity` |  sweep によって作成された W&B run を送信するユーザー名またはチーム名。指定する entity が既に存在することを確認してください。entity を指定しない場合、run は通常、ユーザー名であるデフォルトの entity に送信されます。 |
|  `project` |  sweep から作成された W&B run が送信されるプロジェクトの名前。プロジェクトが指定されていない場合、run は「Uncategorized」とラベル付けされたプロジェクトに送信されます。 |
|  `count` |  試す sweep 設定のトライアル数。 |