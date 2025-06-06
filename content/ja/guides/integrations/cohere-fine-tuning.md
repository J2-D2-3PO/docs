---
title: Cohere fine-tuning
description: Cohere モデルをファインチューンする方法（W&B を使用）。
menu:
  default:
    identifier: ja-guides-integrations-cohere-fine-tuning
    parent: integrations
weight: 40
---

Weights & Biases を使用すると、Cohere モデルのファインチューニングメトリクスや設定をログに記録し、モデルのパフォーマンスを分析・理解し、その結果を同僚と共有することができます。

この [Cohere のガイド](https://docs.cohere.com/page/convfinqa-finetuning-wandb) では、ファインチューニング run を開始する方法の完全な例が示されています。また、[Cohere API ドキュメントはこちら](https://docs.cohere.com/reference/createfinetunedmodel#request.body.settings.wandb) で確認できます。

## Cohere ファインチューニング結果のログ

Cohere のファインチューニングログを W&B ワークスペースに追加するには:

1. W&B APIキー、W&B `entity` と `project` 名を用いて `WandbConfig` を作成します。W&B APIキーは https://wandb.ai/authorize で取得できます。

2. この設定を `FinetunedModel` オブジェクトとともに、モデル名、データセット、ハイパーパラメーターとともに渡して、ファインチューニング run を開始します。

    ```python
    from cohere.finetuning import WandbConfig, FinetunedModel

    # W&B の詳細で設定を作成します
    wandb_ft_config = WandbConfig(
        api_key="<wandb_api_key>",
        entity="my-entity", # 提供された API キーに関連した有効な entity である必要があります
        project="cohere-ft",
    )

    ...  # データセットとハイパーパラメーターを設定します

    # cohere でファインチューニング run を開始します
    cmd_r_finetune = co.finetuning.create_finetuned_model(
      request=FinetunedModel(
        name="command-r-ft",
        settings=Settings(
          base_model=...
          dataset_id=...
          hyperparameters=...
          wandb=wandb_ft_config  # ここに W&B の設定を渡します
        ),
      ),
    )
    ```

3. 作成した W&B プロジェクトで、モデルのファインチューニングトレーニングと検証のメトリクスやハイパーパラメーターを確認します。

    {{< img src="/images/integrations/cohere_ft.png" alt="" >}}


## Runsの整理

W&B の runs は自動的に整理され、ジョブタイプ、ベースモデル、学習率、その他のハイパーパラメータなど、任意の設定パラメータに基づいてフィルタリングやソートが可能です。

さらに、runs の名前を変更したり、メモを追加したり、タグを作成してグループ化したりすることができます。

## リソース

* **[Cohere Fine-tuning Example](https://github.com/cohere-ai/notebooks/blob/kkt_ft_cookbooks/notebooks/finetuning/convfinqa_finetuning_wandb.ipynb)**