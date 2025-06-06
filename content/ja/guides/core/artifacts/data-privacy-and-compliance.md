---
title: アーティファクトのデータプライバシーとコンプライアンス
description: デフォルトで W&B ファイルが保存される場所を学びましょう。機密情報の保存方法について探索します。
menu:
  default:
    identifier: ja-guides-core-artifacts-data-privacy-and-compliance
    parent: artifacts
---

ファイルは、Artifacts をログするときに W&B が管理する Google Cloud バケットにアップロードされます。バケットの内容は、保存中および転送中の両方で暗号化されます。Artifact ファイルは、対応するプロジェクトへのアクセス権を持つユーザーにのみ表示されます。

{{< img src="/images/artifacts/data_and_privacy_compliance_1.png" alt="GCS W&B クライアントサーバー図" >}}

アーティファクトのバージョンを削除すると、そのバージョンはデータベースでソフト削除としてマークされ、ストレージコストからも除外されます。アーティファクト全体を削除すると、それは完全削除のためにキューに入れられ、その内容はすべて W&B バケットから削除されます。ファイル削除に関する特定のニーズがある場合は、[Customer Support](mailto:support@wandb.com) にお問い合わせください。

マルチテナント環境に存在できない機密データセットには、クラウドバケットに接続されたプライベート W&B サーバーまたは _reference artifacts_ を使用することができます。Reference artifacts は、ファイル内容を W&B に送信せずに、プライベートバケットへの参照を追跡します。Reference artifacts は、バケットやサーバー上のファイルへのリンクを維持します。つまり、W&B はファイルそのものではなく、ファイルに関連するメタデータのみを追跡します。

{{< img src="/images/artifacts/data_and_privacy_compliance_2.png" alt="W&B クライアントサーバークラウド図" >}}

リファレンスアーティファクトは、通常のアーティファクトを作成する方法と似ています。

```python
import wandb

run = wandb.init()
artifact = wandb.Artifact("animals", type="dataset")
artifact.add_reference("s3://my-bucket/animals")
```

代替案については、[contact@wandb.com](mailto:contact@wandb.com) にお問い合わせいただき、プライベートクラウドおよびオンプレミスのインストールについてご相談ください。