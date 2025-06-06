---
title: オブジェクトを埋め込む
description: W&B の Embedding Projector を使用すると、ユーザー は PCA、UMAP、t-SNE などの一般的な次元削減アルゴリズムを用いて多次元埋め込みを
  2D 平面上にプロットできます。
menu:
  default:
    identifier: ja-guides-models-app-features-panels-query-panels-embedding-projector
    parent: query-panels
---

{{< img src="/images/weave/embedding_projector.png" alt="" >}}

[Embeddings](https://developers.google.com/machine-learning/crash-course/embeddings/video-lecture) はオブジェクト（人物、画像、投稿、単語など）を数字のリストで表現するために使用されます。これを _ベクトル_ と呼ぶこともあります。機械学習やデータサイエンスのユースケースでは、Embeddings は様々な手法を用いて生成でき、幅広いアプリケーションで利用されます。このページでは、読者が Embeddings に精通しており、W&B 内でそれらを視覚的に分析することに関心があることを前提としています。

## Embedding の例

- [ライブインタラクティブデモレポート](https://wandb.ai/timssweeney/toy_datasets/reports/Feature-Report-W-B-Embeddings-Projector--VmlldzoxMjg2MjY4?accessToken=bo36zrgl0gref1th5nj59nrft9rc4r71s53zr2qvqlz68jwn8d8yyjdz73cqfyhq) 
- [Colab の例](https://colab.research.google.com/drive/1DaKL4lZVh3ETyYEM1oJ46ffjpGs8glXA#scrollTo=D--9i6-gXBm_).

### ハローワールド

W&B を使用すると、`wandb.Table` クラスを使用して Embeddings をログできます。以下は、5 次元からなる 3 つの Embeddings の例です。

```python
import wandb

wandb.init(project="embedding_tutorial")
embeddings = [
    # D1   D2   D3   D4   D5
    [0.2, 0.4, 0.1, 0.7, 0.5],  # embedding 1
    [0.3, 0.1, 0.9, 0.2, 0.7],  # embedding 2
    [0.4, 0.5, 0.2, 0.2, 0.1],  # embedding 3
]
wandb.log(
    {"embeddings": wandb.Table(columns=["D1", "D2", "D3", "D4", "D5"], data=embeddings)}
)
wandb.finish()
```

上記のコードを実行すると、W&B ダッシュボードにデータを含む新しいテーブルが作成されます。右上のパネルセレクタから `2D Projection` を選択して Embeddings を 2 次元でプロットすることができます。デフォルトで賢明な設定が自動的に選択されますが、設定メニューから簡単に上書きできます。この例では、利用可能な 5 つの数値次元をすべて自動的に使用しています。

{{< img src="/images/app_ui/weave_hello_world.png" alt="" >}}

### 数字のMNIST

上記の例では Embeddings の基本的なログ方法を示しましたが、通常はもっと多くの次元とサンプルを扱います。UCI の手書き数字データセット [UCI ML hand-written digits dataset](https://archive.ics.uci.edu/ml/datasets/Optical+Recognition+of+Handwritten+Digits)を使って、[SciKit-Learn](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.load_digits.html) を通じて提供される MNIST 数字データセットを考えてみましょう。このデータセットには 64 次元を持つ 1797 のレコードが含まれています。この問題は10クラスの分類ユースケースです。また、可視化のために入力データを画像に変換することもできます。

```python
import wandb
from sklearn.datasets import load_digits

wandb.init(project="embedding_tutorial")

# データセットをロードする
ds = load_digits(as_frame=True)
df = ds.data

# "target" カラムを作成する
df["target"] = ds.target.astype(str)
cols = df.columns.tolist()
df = df[cols[-1:] + cols[:-1]]

# "image" カラムを作成する
df["image"] = df.apply(
    lambda row: wandb.Image(row[1:].values.reshape(8, 8) / 16.0), axis=1
)
cols = df.columns.tolist()
df = df[cols[-1:] + cols[:-1]]

wandb.log({"digits": df})
wandb.finish()
```

上記のコードを実行した後、再び UI にテーブルが表示されます。 `2D Projection` を選択することで、Embedding の定義、色付け、アルゴリズム（PCA, UMAP, t-SNE）、アルゴリズムのパラメータ、さらにはオーバーレイ（この場合、点の上にマウスを置くと画像が表示されます）の設定を行うことができます。この特定のケースでは、すべて「スマートデフォルト」が設定されており、`2D Projection` をクリックするだけで非常に類似したものが見えるはずです。([この例を試してみてください](https://wandb.ai/timssweeney/embedding_tutorial/runs/k6guxhum?workspace=user-timssweeney))。

{{< img src="/images/weave/embedding_projector.png" alt="" >}}

## ログオプション

Embeddings はさまざまなフォーマットでログすることができます:

1. **単一の埋め込みカラム:** データがすでに「行列」形式になっていることが多いです。この場合、カラムのデータ型は `list[int]`, `list[float]`, または `np.ndarray` にすることができます。
2. **複数の数値カラム:** 上記の2つの例では、各次元に対してカラムを作成するこの方法を使用します。現在、セルには Python の `int` または `float` が受け入れられます。

{{< img src="/images/weave/logging_options.png" alt="Single Embedding Column" >}}
{{< img src="/images/weave/logging_option_image_right.png" alt="Many Numeric Columns" >}}

さらに、他のすべてのテーブルと同様に、テーブルを構築する方法について多くのオプションがあります:

1. **データフレーム** から直接 `wandb.Table(dataframe=df)` を使用して
2. **データのリスト** から直接 `wandb.Table(data=[...], columns=[...])` を使用して
3. **行単位で段階的に** テーブルを構築する（コード内にループがある場合に最適）。`table.add_data(...)` を使ってテーブルに行を追加します。
4. テーブルに **埋め込みカラム** を追加する（Embedding の形式で予測のリストがある場合に最適）: `table.add_col("col_name", ...)`
5. **計算済みカラム** を追加する（関数やモデルをテーブル全体に適用したい場合に最適）: `table.add_computed_columns(lambda row, ndx: {"embedding": model.predict(row)})`

## プロットオプション

`2D Projection` を選択した後、ギアアイコンをクリックしてレンダリング設定を編集できます。上記のカラムの選択に加えて、興味のあるアルゴリズム（および必要なパラメータ）を選ぶことができます。以下に、UMAP と t-SNE の各パラメータが表示されています。

{{< img src="/images/weave/plotting_options_left.png" alt="" >}} 
{{< img src="/images/weave/plotting_options_right.png" alt="" >}}

{{% alert %}}
注: 現在、すべての 3 つのアルゴリズムに対して、ランダムなサブセット 1000 行と 50 次元にダウンサンプリングされます。
{{% /alert %}}