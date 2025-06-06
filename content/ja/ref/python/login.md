---
title: ログイン
menu:
  reference:
    identifier: ja-ref-python-login
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/wandb_login.py#L40-L84 >}}

W&B のログイン資格情報を設定します。

```python
login(
    anonymous: Optional[Literal['must', 'allow', 'never']] = None,
    key: Optional[str] = None,
    relogin: Optional[bool] = None,
    host: Optional[str] = None,
    force: Optional[bool] = None,
    timeout: Optional[int] = None,
    verify: bool = (False)
) -> bool
```

デフォルトでは、資格情報は W&B サーバーに確認せずにローカルにのみ保存されます。資格情報を確認するには `verify=True` を指定してください。

| Args |  |
| :--- | :--- |
|  `anonymous` |  (string, optional) "must"、"allow"、または "never" のいずれかです。"must" に設定すると、常に匿名でユーザーをログインさせます。"allow" に設定すると、ユーザーが既にログインしていない場合にのみ匿名ユーザーを作成します。"never" に設定すると、ユーザーを匿名でログインさせません。デフォルトは "never" に設定されています。 |
|  `key` |  (string, optional) 使用する APIキーです。 |
|  `relogin` |  (bool, optional) true の場合、APIキーの再入力を求めます。 |
|  `host` |  (string, optional) 接続するホストです。 |
|  `force` |  (bool, optional) true の場合、再ログインを強制します。 |
|  `timeout` |  (int, optional) ユーザー入力を待つ秒数です。 |
|  `verify` |  (bool) W&B サーバーで資格情報を確認します。 |

| Returns |  |
| :--- | :--- |
|  `bool` |  key が設定された場合 |

| Raises |  |
| :--- | :--- |
|  AuthenticationError - api_key の検証がサーバーで失敗した場合 UsageError - api_key が設定できず、tty がない場合 |