---
title: 機械学習モデルを文書化する
description: モデル カードに説明を追加して、モデルをドキュメント化する
menu:
  default:
    identifier: ja-guides-core-registry-model_registry-create-model-cards
    parent: model-registry
weight: 8
---

モデルレジストリに登録されたモデルのモデルカードに説明を追加して、機械学習モデルの側面を文書化します。文書化する価値があるトピックには以下のものがあります：

* **Summary**: モデルの概要。モデルの目的。モデルが使用する機械学習フレームワークなど。
* **Training data**: 使用したトレーニングデータについて、トレーニングデータセットで行ったプロセッシング、そのデータがどこに保存されているかなどを説明します。
* **Architecture**: モデルのアーキテクチャー、レイヤー、および特定の設計選択に関する情報。
* **Deserialize the model**: チームの誰かがモデルをメモリにロードする方法についての情報を提供します。
* **Task**: 機械学習モデルが実行するよう設計された特定のタスクや問題のタイプ。モデルの意図された能力の分類です。
* **License**: 機械学習モデルの使用に関連する法的条件と許可。モデルユーザーが法的な枠組みのもとでモデルを利用できることを理解するのに役立ちます。
* **References**: 関連する研究論文、データセット、または外部リソースへの引用や参照。
* **Deployment**: モデルがどのように、そしてどこにデプロイメントされているのか、他の企業システムにどのように統合されているかに関するガイダンスを含む詳細。

## モデルカードに説明を追加する

1. [https://wandb.ai/registry/model](https://wandb.ai/registry/model) で W&B モデルレジストリ アプリに移動します。
2. モデルカードを作成したい登録済みモデル名の横にある **View details** を選択します。
3. **Model card** セクションに移動します。
{{< img src="/images/models/model_card_example.png" alt="" >}}
4. **Description** フィールド内に、機械学習モデルに関する情報を入力します。モデルカード内のテキストは [Markdown マークアップ言語](https://www.markdownguide.org/) でフォーマットします。

例えば、次の画像は **Credit-card Default Prediction** という登録済みモデルのモデルカードを示しています。
{{< img src="/images/models/model_card_credit_example.png" alt="" >}}