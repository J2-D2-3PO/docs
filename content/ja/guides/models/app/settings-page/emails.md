---
title: メール設定を管理する
description: Settings ページからメールを管理します。
menu:
  default:
    identifier: ja-guides-models-app-settings-page-emails
    parent: settings
weight: 40
---

Add, delete, manage email types and primary email addresses in your W&B プロファイル 設定 ページ. Select your profile icon in the upper right corner of the W&B ダッシュボード. From the dropdown, select **設定**. Within the 設定 ページ, scroll down to the Emails ダッシュボード:

{{< img src="/images/app_ui/manage_emails.png" alt="" >}}

## プライマリーメール の管理

プライマリーメール は 😎 絵文字でマークされています。プライマリーメール は、W&B アカウントを作成する際に提供したメールで自動的に定義されます。

Weights And Biases アカウント に関連付けられている プライマリーメール を変更するには、ケバブ ドロップダウン を選択します:

{{% alert %}}
確認済みのメールのみを プライマリー として設定できます
{{% /alert %}}

{{< img src="/images/app_ui/primary_email.png" alt="" >}}

## メールを追加

**+ Add Email** を選択して、メールを追加します。これにより、Auth0 ページに移動します。新しいメールの資格情報を入力するか、シングル サインオン (SSO) を使用して接続できます。

## メールを削除

ケバブ ドロップダウン を選択し、**Delete Emails** を選択して、W&B アカウント に登録されているメールを削除します

{{% alert %}}
プライマリーメール は削除できません。削除する前に、別のメールを プライマリー として設定する必要があります。
{{% /alert %}}

## ログイン メソッド

ログイン メソッド 列には、アカウントに関連付けられているログイン メソッド が表示されます。

W&B アカウントを作成すると、確認メールがアカウント に送信されます。メール アドレス を確認するまで、メール アカウント は確認されていないと見なされます。未確認のメールは赤で表示されます。

元の確認メールがメール アカウントに送信されていない場合、もう一度メール アドレスでログインを試みて、2 回目の確認メールを取得してください。

アカウントのログインの問題がある場合は、support@wandb.com にお問い合わせください。