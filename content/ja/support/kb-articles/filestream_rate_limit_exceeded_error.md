---
title: Filestream のレート制限を超えたエラーをどのように解決できますか？
menu:
  support:
    identifier: ja-support-kb-articles-filestream_rate_limit_exceeded_error
support:
  - connectivity
  - outage
toc_hide: true
type: docs
url: /ja/support/:filename
---
To resolve the "Filestream rate limit exceeded" error in Weights & Biases (W&B), follow these steps:

**ログの最適化**:
  - API リクエストを減らすために、ログの頻度を減らすか、バッチログを使用します。
  - 実験の開始時間をずらして、API リクエストが同時に発生しないようにします。

**障害の確認**:
  - [W&B status updates](https://status.wandb.com) を確認し、一時的なサーバー側の問題でないことを確認します。

**サポートに連絡**:
  - Rate limit の増加をリクエストするために、実験のセットアップの詳細を記載して、W&B サポート (support@wandb.com) に連絡します。