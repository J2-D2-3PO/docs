---
title: SSO を LDAP で設定
menu:
  default:
    identifier: ja-guides-hosting-iam-authentication-ldap
    parent: authentication
---

資格情報を W&B Server の LDAP サーバーで認証します。次のガイドは W&B Server の設定を行う方法を説明しています。必須およびオプションの設定、システム設定 UI から LDAP 接続を設定する手順をカバーしています。また、アドレス、ベース識別名、属性など、LDAP 設定のさまざまな入力についての情報を提供します。これらの属性は W&B アプリ UI から、または環境変数を使用して指定できます。匿名バインドを設定するか、管理者 DN とパスワードでバインドすることができます。

{{% alert %}}
W&B 管理者ロールのみが LDAP 認証を有効化および設定できます。
{{% /alert %}}

## LDAP 接続の設定

{{< tabpane text=true >}}
{{% tab header="W&B アプリ" value="app" %}}
1. W&B アプリに移動します。
2. 右上のプロフィールアイコンを選択します。ドロップダウンから **System Settings** を選択します。
3. **Configure LDAP Client** を切り替えます。
4. フォームに詳細を追加します。各入力の詳細は、**Configuring Parameters** セクションを参照してください。
5. **Update Settings** をクリックして設定をテストします。これにより、W&B サーバーとのテストクライアント/接続が確立されます。
6. 接続が検証されたら、**Enable LDAP Authentication** を切り替え、**Update Settings** ボタンを選択します。
{{% /tab %}}

{{% tab header="環境変数" value="env"%}}
次の環境変数を使用して LDAP 接続を設定します。

| 環境変数                         | 必須   | 例                              |
| ----------------------------- | ---- | ------------------------------- |
| `LOCAL_LDAP_ADDRESS`          | はい  | `ldaps://ldap.example.com:636`  |
| `LOCAL_LDAP_BASE_DN`          | はい  | `email=mail,group=gidNumber`    |
| `LOCAL_LDAP_BIND_DN`          | いいえ | `cn=admin`, `dc=example,dc=org` |
| `LOCAL_LDAP_BIND_PW`          | いいえ |                                 |
| `LOCAL_LDAP_ATTRIBUTES`       | はい  | `email=mail`, `group=gidNumber` |
| `LOCAL_LDAP_TLS_ENABLE`       | いいえ |                                 |
| `LOCAL_LDAP_GROUP_ALLOW_LIST` | いいえ |                                 |
| `LOCAL_LDAP_LOGIN`            | いいえ |                                 |

各環境変数の定義については [Configuration parameters]({{< relref path="#configuration-parameters" lang="ja" >}}) セクションを参照してください。明確さのために、環境変数の接頭辞 `LOCAL_LDAP` を定義名から省略しました。
{{% /tab %}}
{{< /tabpane >}}

## 設定パラメータ

以下の表には、必須およびオプションの LDAP 設定を一覧し説明しています。

| 環境変数          | 定義                                         | 必須   |
| ---------------- | ------------------------------------------- | ---- |
| `ADDRESS`        | W&B Server をホストする VPC 内の LDAP サーバーのアドレスです。 | はい  |
| `BASE_DN`        | ディレクトリ内で検索を開始するルートパスであり、クエリを行うために必要です。 | はい  |
| `BIND_DN`        | LDAP サーバーに登録された管理者ユーザーのパスです。LDAP サーバーが未認証のバインドをサポートしていない場合、これが必要です。指定された場合、W&B Server はこのユーザーとして LDAP サーバーに接続します。指定されていない場合、W&B Server は匿名バインドを使用して接続します。 | いいえ |
| `BIND_PW`        | 管理者ユーザーのパスワードで、バインドを認証するために使用されます。空白の場合、W&B Server は匿名バインドを使用して接続します。   | いいえ |
| `ATTRIBUTES`     | メールとグループ ID 属性名をコンマ区切りの文字列値として提供します。    | はい  |
| `TLS_ENABLE`     | TLS を有効にします。                              | いいえ |
| `GROUP_ALLOW_LIST` | グループ許可リスト。                                 | いいえ |
| `LOGIN`          | W&B Server に LDAP を使用して認証するかどうかを指定します。`True` または `False` を設定します。オプションとして、LDAP の設定をテストするために false に設定することができます。LDAP 認証を開始するには true に設定します。 | いいえ |