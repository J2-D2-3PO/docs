---
title: DeepChecks
description: W&B を DeepChecks と統合する方法。
menu:
  default:
    identifier: ja-guides-integrations-deepchecks
    parent: integrations
weight: 60
---

{{< cta-button colabLink="https://colab.research.google.com/github/deepchecks/deepchecks/blob/0.5.0-1-g5380093/docs/source/examples/guides/export_outputs_to_wandb.ipynb" >}}

DeepChecks は、データの整合性の検証、分布の確認、データ分割の検証、モデルの評価、および異なるモデル間の比較など、機械学習モデルとデータの検証を最小限の労力で行うことができます。

[DeepChecks と wandb のインテグレーションについて詳しく読む ->](https://docs.deepchecks.com/stable/general/usage/exporting_results/auto_examples/plot_exports_output_to_wandb.html)

## はじめに

DeepChecks を Weights & Biases と共に使用するには、まず [こちら](https://wandb.ai/site) で Weights & Biases のアカウントにサインアップする必要があります。DeepChecks における Weights & Biases のインテグレーションにより、以下のように素早く始めることができます。

```python
import wandb

wandb.login()

# deepchecks からチェックをインポート
from deepchecks.checks import ModelErrorAnalysis

# チェックを実行
result = ModelErrorAnalysis()

# 結果を wandb にプッシュ
result.to_wandb()
```

また、Weights & Biases に DeepChecks のテストスイート全体をログすることもできます。

```python
import wandb

wandb.login()

# deepchecks から full_suite テストをインポート
from deepchecks.suites import full_suite

# DeepChecks テストスイートを作成して実行
suite_result = full_suite().run(...)

# 結果を wandb にプッシュ
# ここで必要な wandb.init の設定や引数を渡すことができます
suite_result.to_wandb(project="my-suite-project", config={"suite-name": "full-suite"})
```

## 例

``[**このレポート**](https://wandb.ai/cayush/deepchecks/reports/Validate-your-Data-and-Models-with-Deepchecks-and-W-B--VmlldzoxNjY0ODc5) は、DeepChecks と Weights & Biases を使用することの強力さを示しています

{{< img src="/images/integrations/deepchecks_example.png" alt="" >}}

この Weights & Biases インテグレーションに関して質問や問題がある場合は、[DeepChecks github リポジトリ](https://github.com/deepchecks/deepchecks)にイシューを開いてください。対応し、ご回答いたします :)