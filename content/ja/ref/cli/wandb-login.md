---
title: wandb ログイン
menu:
  reference:
    identifier: ja-ref-cli-wandb-login
---

**使用方法**

`wandb login [OPTIONS] [KEY]...`

**概要**

Weights & Biases へログイン


**オプション**

| **オプション** | **説明** |
| :--- | :--- |
| `--cloud` | ローカルではなくクラウドにログイン |
| `--host, --base-url` | W&B の特定のインスタンスにログイン |
| `--relogin` | すでにログインしている場合でも再ログインを強制 |
| `--anonymously` | 匿名でログイン |
| `--verify / --no-verify` | ログイン資格情報を確認 |