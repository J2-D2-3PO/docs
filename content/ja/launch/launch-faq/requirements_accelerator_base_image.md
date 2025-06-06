---
title: アクセラレータベースイメージにはどのような要件がありますか？
menu:
  launch:
    identifier: ja-launch-launch-faq-requirements_accelerator_base_image
    parent: launch-faq
---

アクセラレータを使用するジョブには、必要なアクセラレータコンポーネントを含む基本イメージを提供してください。アクセラレータイメージに関しては、以下の要件を確認してください:

- Debian との互換性（Launch Dockerfile は Python をインストールするために apt-get を使用します）
- サポートされている CPU と GPU ハードウェアの命令セット（意図した GPU に対する CUDA バージョンの互換性を確認）
- 提供されるアクセラレータバージョンと機械学習アルゴリズム内のパッケージとの互換性
- ハードウェアとの互換性のために追加のステップが必要なパッケージのインストール 