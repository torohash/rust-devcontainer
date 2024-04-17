# Rustプロジェクト用のDevContainer設定

このディレクトリには、Rustプロジェクトの開発環境をDockerコンテナ内に構築するための設定ファイルが含まれています。

## 前提条件

- Docker
- Docker Compose
- Visual Studio Code（VSCode）
- VSCodeの拡張機能「Dev Containers」

## 使用方法

1. このリポジトリをgit cloneする際に、クローン先のディレクトリ名を`.devcontainer`にしてください。```git clone <リポジトリのURL> .devcontainer```
2. VSCodeで、このプロジェクトのルートディレクトリを開きます。
3. 「Dev Containers」拡張機能を使用して、コンテナ内で開発環境を開きます。
4. コマンドパレットを開き（`Ctrl+Shift+P`）、「Dev Containers: Reopen in Container...」を選択します。
5. コンテナ内で開発環境が構築されます。これには数分かかる場合があります。
6. 開発環境の準備が完了すると、コンテナ内のワークスペース（`/opt/app`）でターミナルが開きます。
7. ここから、Rustプロジェクトの開発を開始できます。

## 注意点

- SSH鍵の権限に注意してください。必要に応じて、`Dockerfile`内で適切な所有者とパーミッションを設定してください。
- 機密情報（APIキー、データベースの認証情報など）は、`.env`ファイルなどを使用して管理し、`.gitignore`ファイルで除外してください。

## TIPS

- コンテナ内でRustプロジェクトを作成する場合は、`cargo init .`コマンドを使用してください。
- デフォルトのユーザーを変更したい場合は、.envファイルを作成し、docker-compose.ymlでそれを読み込みUSER_IDなどを上書きしてください。