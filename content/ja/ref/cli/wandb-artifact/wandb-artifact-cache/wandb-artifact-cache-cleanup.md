---
title: wandb アーティファクト cache cleanup
menu:
  reference:
    identifier: ja-ref-cli-wandb-artifact-wandb-artifact-cache-wandb-artifact-cache-cleanup
---

**使用方法**

`wandb artifact cache cleanup [OPTIONS] TARGET_SIZE`

**概要**

Artifactsのキャッシュから、使用頻度の低いファイルをクリーンアップします


**オプション**

| **オプション** | **説明** |
| :--- | :--- |
| `--remove-temp / --no-remove-temp` | 一時ファイルを削除します |