---
title: TensorFlow
menu:
  default:
    identifier: ja-guides-integrations-tensorflow
    parent: integrations
weight: 440
---

{{< cta-button colabLink="https://colab.research.google.com/drive/1JCpAbjkCFhYMT7LCQ399y35TS3jlMpvM" >}}

## 始めましょう

すでにTensorBoardを使用している場合は、wandbと簡単に統合できます。

```python
import tensorflow as tf
import wandb
wandb.init(config=tf.flags.FLAGS, sync_tensorboard=True)
```

## カスタムメトリクスをログする

TensorBoardにログされていない追加のカスタムメトリクスをログする必要がある場合、コード内で `wandb.log` を呼び出せます `wandb.log({"custom": 0.8}) `

Tensorboardとの同期時には、`wandb.log` のステップ引数はオフになっています。異なるステップカウントを設定したい場合、次のようにステップメトリクスとしてメトリクスをログできます：

``` python
wandb.log({"custom": 0.8, "global_step":global_step}, step=global_step)
```

## TensorFlowエスティメーターフック

ログする内容をより詳細に制御したい場合、wandbはTensorFlowエスティメーター用のフックも提供しています。これにより、グラフ内のすべての `tf.summary` 値をログします。

```python
import tensorflow as tf
import wandb

wandb.init(config=tf.FLAGS)

estimator.train(hooks=[wandb.tensorflow.WandbHook(steps_per_log=1000)])
```

## 手動でログする

TensorFlowでメトリクスをログする最も簡単な方法は、TensorFlowロガーで `tf.summary` をログすることです：

```python
import wandb

with tf.Session() as sess:
    # ...
    wandb.tensorflow.log(tf.summary.merge_all())
```

TensorFlow 2 においてカスタムループでモデルをトレーニングする推奨方法は、`tf.GradientTape` を使用することです。詳しくは[こちら](https://www.tensorflow.org/tutorials/customization/custom_training_walkthrough)で読むことができます。TensorFlowのカスタムトレーニングループに `wandb` を組み込んでメトリクスをログしたい場合、次のコードスニペットに従ってください：

```python
    with tf.GradientTape() as tape:
        # 確率を取得
        predictions = model(features)
        # 損失を計算
        loss = loss_func(labels, predictions)

    # メトリクスをログ
    wandb.log("loss": loss.numpy())
    # 勾配を取得
    gradients = tape.gradient(loss, model.trainable_variables)
    # 重みを更新
    optimizer.apply_gradients(zip(gradients, model.trainable_variables))
```

完全な例は[こちら](https://www.wandb.com/articles/wandb-customizing-training-loops-in-tensorflow-2)で入手可能です。

## W&BはTensorBoardとどう違うのか？

共同創業者がW&Bの開発を始めたとき、OpenAIのフラストレーションを抱えたTensorBoardユーザーのためのツールを作ることにインスパイアされました。ここに、私たちが改善に注力したいくつかのポイントがあります：

1. **モデルの再現**: Weights & Biasesは実験管理、探査、およびモデルを後で再現するのに優れています。私たちはメトリクスだけでなく、ハイパーパラメーターやコードのバージョンもキャプチャし、プロジェクトが再現可能であるように、バージョン管理の状態やモデルのチェックポイントを保存できます。
2. **自動整理**: コラボレーターからプロジェクトを引き継いだり、休暇から戻ったり、古いプロジェクトを再開する際に、W&Bは試されたすべてのモデルを見るのを簡単にします。こうして、誰も何時間も無駄にせず、GPUサイクルや二酸化炭素を消費して実験をやり直すことを避けられます。
3. **迅速で柔軟なインテグレーション**: あなたのプロジェクトに5分でW&Bを追加できます。オープンソースのPythonパッケージを無料でインストールし、コードに数行追加することで、モデルを実行するたびに素晴らしいログメトリクスと記録が得られます。
4. **持続可能で中央集権的なダッシュボード**: どこでモデルをトレーニングしても、あなたのローカルマシン、共有ラボクラスター、クラウドのスポットインスタンスであっても結果は同じ中央ダッシュボードに共有されます。異なるマシンからTensorBoardファイルをコピーして整理するのに時間を費やす必要はありません。
5. **強力なテーブル**: 異なるモデルの結果を検索、フィルタ、ソートし、グループ化できます。数千のモデルバージョンを簡単に見渡し、異なるタスクに対して最もパフォーマンスの良いモデルを見つけることができます。TensorBoardは大規模なプロジェクトに対してはうまく機能しません。
6. **コラボレーションのためのツール**: 複雑な機械学習プロジェクトを整理するためにW&Bを利用できます。W&Bへのリンクを簡単に共有でき、プライベートチームを活用して皆が共通のプロジェクトに結果を送信できるようにできます。また、レポートを通じてのコラボレーションもサポートされています— インタラクティブな可視化を追加したり、仕事の内容をmarkdownで説明できます。これにより、作業ログを保持したり、上司と学びを共有したり、研究室やチームに学びを提示したりするのに最適です。

[無料アカウント](https://wandb.ai)で始めましょう

## 例

インテグレーションがどのように機能するかを見るためにいくつかの例を作成しました：

* [Githubの例](https://github.com/wandb/examples/blob/master/examples/tensorflow/tf-estimator-mnist/mnist.py): TensorFlow Estimatorsを使用したMNISTの例
* [Githubの例](https://github.com/wandb/examples/blob/master/examples/tensorflow/tf-cnn-fashion/train.py): Raw TensorFlowを使用したFashion MNISTの例
* [Wandb ダッシュボード](https://app.wandb.ai/l2k2/examples-tf-estimator-mnist/runs/p0ifowcb): W&Bでの結果を表示
* TensorFlow 2でのトレーニングループのカスタマイズ - [記事](https://www.wandb.com/articles/wandb-customizing-training-loops-in-tensorflow-2) | [ダッシュボード](https://app.wandb.ai/sayakpaul/custom_training_loops_tf)