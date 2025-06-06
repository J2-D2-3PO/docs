---
title: アラートと通知を作成する
description: 新しいモデルバージョンがモデルレジストリにリンクされた時に Slack 通知を受け取る。
menu:
  default:
    identifier: ja-guides-core-registry-model_registry-notifications
    parent: model-registry
weight: 9
---

新しいモデルバージョンがモデルレジストリにリンクされたときに、Slack 通知を受け取る。

1. [https://wandb.ai/registry/model](https://wandb.ai/registry/model) で W&B Model Registry アプリを開きます。
2. 通知を受け取りたい登録済みモデルを選択します。
3. **Connect Slack** ボタンをクリックします。
    {{< img src="/images/models/connect_to_slack.png" alt="" >}}
4. OAuth ページに表示される Slack ワークスペースで W&B を有効にするための指示に従います。

チームのために Slack 通知を設定すると、通知を受け取る登録済みモデルを選択できます。

{{% alert %}}
チームのために Slack 通知を設定した場合、**Connect Slack** ボタンの代わりに **New model version linked to...** と書かれたトグルが表示されます。
{{% /alert %}}

下のスクリーンショットは Slack 通知が設定された FMNIST 分類器の登録済みモデルを示しています。

{{< img src="/images/models/conect_to_slack_fmnist.png" alt="" >}}

新しいモデルバージョンが FMNIST 分類器の登録済みモデルにリンクされるたびに、接続された Slack チャンネルにメッセージが自動的に投稿されます。