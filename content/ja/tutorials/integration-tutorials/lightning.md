---
title: PyTorch Lightning
menu:
  tutorials:
    identifier: ja-tutorials-integration-tutorials-lightning
    parent: integration-tutorials
weight: 2
---

{{< cta-button colabLink="https://colab.research.google.com/github/wandb/examples/blob/master/colabs/pytorch-lightning/Image_Classification_using_PyTorch_Lightning.ipynb" >}}
私たちは PyTorch Lightning を使用して画像分類パイプラインを構築します。この[スタイルガイド](https://lightning.ai/docs/pytorch/stable/starter/style_guide.html)に従って、コードの読みやすさと再現性を高めます。このすばらしい説明は[こちら](https://wandb.ai/wandb/wandb-lightning/reports/Image-Classification-using-PyTorch-Lightning--VmlldzoyODk1NzY)で利用可能です。

## PyTorch Lightning と W&B のセットアップ

このチュートリアルでは、PyTorch Lightning と Weights & Biases が必要です。

```shell
pip install lightning -q
pip install wandb -qU
```

```python
import lightning.pytorch as pl

# あなたのお気に入りの機械学習トラッキングツール
from lightning.pytorch.loggers import WandbLogger

import torch
from torch import nn
from torch.nn import functional as F
from torch.utils.data import random_split, DataLoader

from torchmetrics import Accuracy

from torchvision import transforms
from torchvision.datasets import CIFAR10

import wandb
```

これで、wandb アカウントにログインする必要があります。

```
wandb.login()
```

## DataModule - 私たちが求めるデータパイプライン

DataModules は、データに関連するフックを LightningModule から分離する方法であり、データセットに依存しないモデルを開発できます。

これは、データパイプラインを1つの共有可能で再利用可能なクラスにまとめます。データモジュールは PyTorch のデータプロセッシングに関わる5つのステップをカプセル化します：
- ダウンロード / トークン化 / プロセス。
- クリーンし、（場合によっては）ディスクに保存。
- データセット内にロード。
- 変換を適用（回転、トークン化など）。
- DataLoader 内にラップ。

データモジュールについて詳しくは[こちら](https://lightning.ai/docs/pytorch/stable/data/datamodule.html)をご覧ください。Cifar-10 データセット用のデータモジュールを構築しましょう。

```
class CIFAR10DataModule(pl.LightningDataModule):
    def __init__(self, batch_size, data_dir: str = './'):
        super().__init__()
        self.data_dir = data_dir
        self.batch_size = batch_size

        self.transform = transforms.Compose([
            transforms.ToTensor(),
            transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
        ])
        
        self.num_classes = 10
    
    def prepare_data(self):
        CIFAR10(self.data_dir, train=True, download=True)
        CIFAR10(self.data_dir, train=False, download=True)
    
    def setup(self, stage=None):
        # データローダーで使用する train/val データセットを割り当て
        if stage == 'fit' or stage is None:
            cifar_full = CIFAR10(self.data_dir, train=True, transform=self.transform)
            self.cifar_train, self.cifar_val = random_split(cifar_full, [45000, 5000])

        # データローダーで使用するテストデータセットを割り当て
        if stage == 'test' or stage is None:
            self.cifar_test = CIFAR10(self.data_dir, train=False, transform=self.transform)
    
    def train_dataloader(self):
        return DataLoader(self.cifar_train, batch_size=self.batch_size, shuffle=True)

    def val_dataloader(self):
        return DataLoader(self.cifar_val, batch_size=self.batch_size)

    def test_dataloader(self):
        return DataLoader(self.cifar_test, batch_size=self.batch_size)
```

## コールバック

コールバックは、プロジェクト間で再利用可能な自己完結型プログラムです。PyTorch Lightning は、定期的に使用されるいくつかの[組み込みコールバック](https://lightning.ai/docs/pytorch/latest/extensions/callbacks.html#built-in-callbacks)を提供しています。
PyTorch Lightning のコールバックについて詳しくは[こちら](https://lightning.ai/docs/pytorch/latest/extensions/callbacks.html)をご覧ください。

### 組み込みコールバック

このチュートリアルでは、[Early Stopping](https://lightning.ai/docs/pytorch/latest/api/lightning.pytorch.callbacks.EarlyStopping.html#lightning.callbacks.EarlyStopping) と [Model Checkpoint](https://lightning.ai/docs/pytorch/latest/api/lightning.pytorch.callbacks.ModelCheckpoint.html#pytorch_lightning.callbacks.ModelCheckpoint) の組み込みコールバックを使用します。それらは `Trainer` に渡すことができます。

### カスタムコールバック
カスタム Keras コールバックに慣れている場合、PyTorch パイプラインで同じことができる能力は、まさにケーキの上のさくらんぼです。

画像分類を実行しているため、モデルのいくつかの画像サンプルに対する予測を視覚化する能力は役立つかもしれません。このコールバックの形式で提供されることで、モデルを早期段階でデバッグするのに役立ちます。

```
class ImagePredictionLogger(pl.callbacks.Callback):
    def __init__(self, val_samples, num_samples=32):
        super().__init__()
        self.num_samples = num_samples
        self.val_imgs, self.val_labels = val_samples
    
    def on_validation_epoch_end(self, trainer, pl_module):
        # テンソルを CPU に移動
        val_imgs = self.val_imgs.to(device=pl_module.device)
        val_labels = self.val_labels.to(device=pl_module.device)
        # モデル予測を取得
        logits = pl_module(val_imgs)
        preds = torch.argmax(logits, -1)
        # wandb Image として画像をログ
        trainer.logger.experiment.log({
            "examples":[wandb.Image(x, caption=f"Pred:{pred}, Label:{y}") 
                           for x, pred, y in zip(val_imgs[:self.num_samples], 
                                                 preds[:self.num_samples], 
                                                 val_labels[:self.num_samples])]
            })
        
```

## LightningModule - システムの定義

LightningModule はシステムを定義し、モデルではありません。ここでシステムはすべての研究コードを1つのクラスにまとめて自己完結型にします。`LightningModule` は PyTorch コードを5つのセクションに整理します：
- 計算（`__init__`）
- トレーニングループ（`training_step`）
- 検証ループ（`validation_step`）
- テストループ（`test_step`）
- オプティマイザー（`configure_optimizers`）

このようにして、容易に共有できるデータセットに依存しないモデルを構築できます。Cifar-10 分類のためのシステムを構築しましょう。

```
class LitModel(pl.LightningModule):
    def __init__(self, input_shape, num_classes, learning_rate=2e-4):
        super().__init__()
        
        # ハイパーパラメーターをログ
        self.save_hyperparameters()
        self.learning_rate = learning_rate
        
        self.conv1 = nn.Conv2d(3, 32, 3, 1)
        self.conv2 = nn.Conv2d(32, 32, 3, 1)
        self.conv3 = nn.Conv2d(32, 64, 3, 1)
        self.conv4 = nn.Conv2d(64, 64, 3, 1)

        self.pool1 = torch.nn.MaxPool2d(2)
        self.pool2 = torch.nn.MaxPool2d(2)
        
        n_sizes = self._get_conv_output(input_shape)

        self.fc1 = nn.Linear(n_sizes, 512)
        self.fc2 = nn.Linear(512, 128)
        self.fc3 = nn.Linear(128, num_classes)

        self.accuracy = Accuracy(task='multiclass', num_classes=num_classes)

    # convブロックからLinear層に渡される出力テンソルのサイズを返します。
    def _get_conv_output(self, shape):
        batch_size = 1
        input = torch.autograd.Variable(torch.rand(batch_size, *shape))

        output_feat = self._forward_features(input) 
        n_size = output_feat.data.view(batch_size, -1).size(1)
        return n_size
        
    # convブロックからの特徴テンソルを返します
    def _forward_features(self, x):
        x = F.relu(self.conv1(x))
        x = self.pool1(F.relu(self.conv2(x)))
        x = F.relu(self.conv3(x))
        x = self.pool2(F.relu(self.conv4(x)))
        return x
    
    # 推論中に使用されます
    def forward(self, x):
       x = self._forward_features(x)
       x = x.view(x.size(0), -1)
       x = F.relu(self.fc1(x))
       x = F.relu(self.fc2(x))
       x = F.log_softmax(self.fc3(x), dim=1)
       
       return x
    
    def training_step(self, batch, batch_idx):
        x, y = batch
        logits = self(x)
        loss = F.nll_loss(logits, y)
        
        # トレーニングメトリクス
        preds = torch.argmax(logits, dim=1)
        acc = self.accuracy(preds, y)
        self.log('train_loss', loss, on_step=True, on_epoch=True, logger=True)
        self.log('train_acc', acc, on_step=True, on_epoch=True, logger=True)
        
        return loss
    
    def validation_step(self, batch, batch_idx):
        x, y = batch
        logits = self(x)
        loss = F.nll_loss(logits, y)

        # 検証メトリクス
        preds = torch.argmax(logits, dim=1)
        acc = self.accuracy(preds, y)
        self.log('val_loss', loss, prog_bar=True)
        self.log('val_acc', acc, prog_bar=True)
        return loss
    
    def test_step(self, batch, batch_idx):
        x, y = batch
        logits = self(x)
        loss = F.nll_loss(logits, y)
        
        # 検証メトリクス
        preds = torch.argmax(logits, dim=1)
        acc = self.accuracy(preds, y)
        self.log('test_loss', loss, prog_bar=True)
        self.log('test_acc', acc, prog_bar=True)
        return loss
    
    def configure_optimizers(self):
        optimizer = torch.optim.Adam(self.parameters(), lr=self.learning_rate)
        return optimizer

```

## トレーニングと評価

`DataModule` を使用してデータパイプラインを整理し、 `LightningModule` を使用してモデルアーキテクチャ＋トレーニングループを整理したので、PyTorch Lightning の `Trainer` が他のすべてを自動化します。

Trainer は次のことを自動化します：
- エポックとバッチの反復
- `optimizer.step()`, `backward`, `zero_grad()` の呼び出し
- `.eval()` の呼び出し、グラッドの有効化/無効化
- 重みの保存と読み込み
- Weights & Biases ログ
- マルチ GPU トレーニングサポート
- TPU サポート
- 16 ビットトレーニングサポート

```
dm = CIFAR10DataModule(batch_size=32)
# x_dataloader にアクセスするには、prepare_data および setup を呼び出す必要があります。
dm.prepare_data()
dm.setup()

# 画像予測をログするカスタム ImagePredictionLogger コールバックに必要なサンプル。
val_samples = next(iter(dm.val_dataloader()))
val_imgs, val_labels = val_samples[0], val_samples[1]
val_imgs.shape, val_labels.shape
```

```
model = LitModel((3, 32, 32), dm.num_classes)

# wandb ロガーを初期化
wandb_logger = WandbLogger(project='wandb-lightning', job_type='train')

# コールバックを初期化
early_stop_callback = pl.callbacks.EarlyStopping(monitor="val_loss")
checkpoint_callback = pl.callbacks.ModelCheckpoint()

# トレーナーを初期化
trainer = pl.Trainer(max_epochs=2,
                     logger=wandb_logger,
                     callbacks=[early_stop_callback,
                                ImagePredictionLogger(val_samples),
                                checkpoint_callback],
                     )

# モデルのトレーニング
trainer.fit(model, dm)

# 保留中のテストセットでモデルを評価 ⚡⚡
trainer.test(dataloaders=dm.test_dataloader())

# wandb run を閉じる
wandb.finish()
```

## 最終的な考え

私は TensorFlow/Keras エコシステムから来ており、PyTorch は洗練されたフレームワークであるにもかかわらず、ちょっと難しいと感じています。個人的な経験にすぎませんが。PyTorch Lightning を探索して、私が PyTorch から遠ざけていた理由のほとんどが解消されていることに気づきました。ここに私の興奮の概要があります：
- 以前: 従来の PyTorch モデル定義はバラバラでした。モデルは `model.py` スクリプトに、トレーニングループは `train.py` ファイルにありました。パイプラインを理解するためには多くの見直しが必要でした。
- 現在: `LightningModule` は、モデルが `training_step`、`validation_step` などと共に定義されているシステムとして機能します。今ではモジュール化され、共有可能です。
- 以前: TensorFlow/Keras の最良の部分は入力データパイプラインでした。彼らのデータセットカタログは豊富で成長しています。PyTorch のデータパイプラインは、かつて最大の痛点でした。通常の PyTorch コードでは、データのダウンロード/クリーニング/準備は通常、多くのファイルに分散しています。
- 現在: DataModule は、データパイプラインを1つの共有可能で再利用可能なクラスに組織します。それは単に `train_dataloader`、`val_dataloader`(s)、`test_dataloader`(s) と、必要な変換やデータプロセッシング/ダウンロードステップの集まりです。
- 以前: Keras では `model.fit` を呼び出してモデルをトレーニングし、 `model.predict` で推論を実行することができました。`model.evaluate` は、テストデータに基づく昔ながらのシンプルな評価を提供しましたが、これは PyTorch ではありませんでした。通常、別々の `train.py` および `test.py` ファイルが見つかります。
- 現在: `LightningModule` が整備されることで、`Trainer` がすべてを自動化します。ただ `trainer.fit` と `trainer.test` を呼び出してモデルをトレーニングと評価すればよいのです。
- 以前: TensorFlow は TPU を好む、PyTorch は...
- 現在: PyTorch Lightning では、複数の GPU で同じモデルをトレーニングするのがとても簡単ですし、TPU でも可能です。
- 以前: 私はコールバックの大ファンで、カスタムコールバックを書くことを好んでいます。従来の PyTorch では、Early Stopping のような些細なことが議論の対象になることがありました。
- 現在: PyTorch Lightning を使用すると、Early Stopping と Model Checkpointing が簡単です。カスタムコールバックを書くことさえもできます。

## 🎨 結論とリソース

このレポートが役に立つことを願っています。コードを試して、好きなデータセットで画像分類器をトレーニングすることをお勧めします。

PyTorch Lightningについてもっと学ぶためのリソース：
- [ステップバイステップのガイド](https://lightning.ai/docs/pytorch/latest/starter/introduction.html) - これは公式のチュートリアルの１つです。そのドキュメントは非常によく書かれており、良い学習リソースとして強くお勧めします。
- [Weighs & Biases で Pytorch Lightning を使う](https://wandb.me/lightning) - W&B を PyTorch Lightning で使用する方法について学ぶために実行できる短い colab です。