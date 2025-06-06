---
title: wandb docker
menu:
  reference:
    identifier: ja-ref-cli-wandb-docker
---

**Usage**

`wandb docker [OPTIONS] [DOCKER_RUN_ARGS]... [DOCKER_IMAGE]`

**Summary**

docker コンテナ内でコードを実行します。

W&B docker を使用すると、コードを docker イメージ内で実行し、wandb が適切に設定されていることを確認します。WANDB_DOCKER と WANDB_API_KEY の環境変数をコンテナに追加し、既定では現在のディレクトリーを /app にマウントします。`docker run` の画像名が宣言される前に追加されるその他の args を渡すことができます。指定されない場合は、デフォルトのイメージを選択します：

sh wandb docker -v /mnt/dataset:/app/data wandb docker gcr.io/kubeflow-
images-public/tensorflow-1.12.0-notebook-cpu:v0.4.0 --jupyter wandb docker
wandb/deepo:keras-gpu --no-tty --cmd "python train.py --epochs=5"

デフォルトでは、wandb の存在を確認し、存在しない場合はインストールするために entrypoint をオーバーライドします。--jupyter フラグを渡すと、jupyter がインストールされ、ポート 8888 で jupyter lab が開始されます。システム上で nvidia-docker を検出した場合、nvidia ランタイムを使用します。既存の docker run コマンドに環境変数を設定するだけでよければ、wandb docker-run コマンドを参照してください。

**Options**

| **Option** | **Description** |
| :--- | :--- |
| `--nvidia / --no-nvidia` | nvidia ランタイムを使用します。nvidia-docker が存在する場合、デフォルトで nvidia が使用されます |
| `--digest` | イメージのダイジェストを出力して終了します |
| `--jupyter / --no-jupyter` | コンテナ内で jupyter lab を実行します |
| `--dir` | コンテナ内にコードをマウントするディレクトリー |
| `--no-dir` | 現在のディレクトリーをマウントしません |
| `--shell` | コンテナを開始するシェル |
| `--port` | jupyter をバインドするホストポート |
| `--cmd` | コンテナ内で実行するコマンド |
| `--no-tty` | コマンドを tty なしで実行します |