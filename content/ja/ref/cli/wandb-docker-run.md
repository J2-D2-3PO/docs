---
title: wandb docker-run
menu:
  reference:
    identifier: ja-ref-cli-wandb-docker-run
---

**使用方法**

`wandb docker-run [OPTIONS] [DOCKER_RUN_ARGS]...`

**概要**

`docker run` をラップし、WANDB_API_KEY と WANDB_DOCKER 環境変数を追加します。

nvidia-docker 実行ファイルがシステム上に存在し、--runtime が設定されていない場合は、ランタイムを nvidia に設定します。

詳細については、`docker run --help` を参照してください。

**オプション**

| **オプション** | **説明** |
| :--- | :--- |