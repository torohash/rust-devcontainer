# MCP Rust開発プロジェクト

## 開発環境のセットアップ

このプロジェクトは VS Code Remote Containers を使用して開発環境を構築します。

### 前提条件

- Docker
- Visual Studio Code
- Remote - Containers 拡張機能

### セットアップ手順

1. リポジトリをクローン

```
git clone <repository-url> .devcontainer
```

2. VS Code のコマンドパレットから Remote-Containers: Reopen in Container を選択

3. コンテナ内で初期化

Cargoプロジェクトを新規作成する場合：
```
cargo init
```

既存のCargoプロジェクトを使用する場合：
```
cargo build
```

## ネットワーク設定

この DevContainer は以下のネットワーク設定を持っています：

- **MCP ネットワーク** (`--network=mcp-network`)

  - 専用の Docker ネットワーク
  - 他の MCP 関連コンテナとの通信用
  - 自動ネットワーク作成: コンテナ起動前に自動的に作成されるため、手動での作成は不要です
  - 既にネットワークが存在する場合は、既存のものが使用されます


## 権限設定

この DevContainer は以下の権限設定を持っています：

- **ユーザー ID 同期** (`updateRemoteUserUID: true`)

  - コンテナ内のユーザー ID をホスト側のユーザー ID に自動的に合わせる
  - これにより、ファイル所有権の問題を防止

- **SSH キーのマウント**
  - ホストの`~/.ssh`ディレクトリをコンテナ内の`/home/vscode/.ssh`に読み取り専用でマウント
  - これにより、コンテナ内で git コマンドを使用する際にホストの SSH 鍵を使用可能
  - セキュリティのため読み取り専用でマウントされる