---
title: W&B for Julia
description: Julia との W&B 統合方法。
menu:
  default:
    identifier: ja-guides-integrations-w-and-b-for-julia
    parent: integrations
weight: 450
---

機械学習実験をJuliaプログラミング言語で行う場合、コミュニティの貢献者によって作成された非公式なJuliaバインディングセット、[wandb.jl](https://github.com/avik-pal/Wandb.jl)を使用できます。

例は、wandb.jlリポジトリの[ドキュメント](https://github.com/avik-pal/Wandb.jl/tree/main/docs/src/examples)で見つけることができます。彼らの「Getting Started」例は以下の通りです。

```julia
using Wandb, Dates, Logging

# 新しいrunを開始し、ハイパーパラメーターをconfigでトラッキング
lg = WandbLogger(project = "Wandb.jl",
                 name = "wandbjl-demo-$(now())",
                 config = Dict("learning_rate" => 0.01,
                               "dropout" => 0.2,
                               "architecture" => "CNN",
                               "dataset" => "CIFAR-100"))

# LoggingExtras.jlを使用して、複数のロガーに同時にログを記録
global_logger(lg)

# トレーニングまたは評価ループのシミュレーション
for x ∈ 1:50
    acc = log(1 + x + rand() * get_config(lg, "learning_rate") + rand() + get_config(lg, "dropout"))
    loss = 10 - log(1 + x + rand() + x * get_config(lg, "learning_rate") + rand() + get_config(lg, "dropout"))
    # スクリプトからW&Bにメトリクスをログする
    @info "metrics" accuracy=acc loss=loss
end

# runを終了
close(lg)
```