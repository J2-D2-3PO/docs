---
title: ローンチは並列化をサポートしていますか？ジョブによって消費されるリソースを制限する方法はありますか？
menu:
  launch:
    identifier: ja-launch-launch-faq-launch_support_parallelization_limit_resources_consumed_job
    parent: launch-faq
---

Launch は、複数の GPU およびノードにわたるジョブのスケーリングをサポートします。詳細については、[このガイド]({{< relref path="/launch/integration-guides/volcano.md" lang="ja" >}})を参照してください。

各 Launch エージェントには `max_jobs` パラメータが設定されており、同時に実行できるジョブの最大数を決定します。適切なローンチ インフラストラクチャーに接続されていれば、複数のエージェントが単一のキューを指すことができます。

リソース設定では、CPU、GPU、メモリ、およびその他のリソースに対してキューまたはジョブ実行レベルでの制限を設定できます。Kubernetes でリソース制限付きのキューを設定する方法については、[このガイド]({{< relref path="/launch/set-up-launch/setup-launch-kubernetes.md" lang="ja" >}})を参照してください。

スイープの場合、以下のブロックをキュー設定に含めて、同時に実行される run の数を制限してください。

```yaml title="queue config"
  scheduler:
    num_workers: 4
```