FROM rust:1.85.1

# 必要なパッケージのインストール
RUN apt update && \
    apt install -y git bash-completion tree vim curl &&\
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Rustツールのインストール
RUN rustup component add clippy rustfmt

# ホスト名の設定
RUN echo "rust-dev" > /etc/hostname

# vscodeユーザーの作成（1000:1000）
RUN groupadd --gid 1000 vscode && \
    useradd --uid 1000 --gid 1000 -m vscode && \
    mkdir -p /home/vscode/.config && \
    chown -R vscode:vscode /home/vscode

# Gitのタブ補完有効化と__git_ps1コマンドの利用
RUN echo "source /usr/share/bash-completion/completions/git" >> /home/vscode/.bashrc && \
    echo "if [ -f /etc/bash_completion.d/git-prompt ]; then source /etc/bash_completion.d/git-prompt; fi" >> /home/vscode/.bashrc

# プロンプトの設定（ホスト名を固定）
RUN echo "PROMPT_COMMAND='PS1_CMD1=\$(__git_ps1 \" (%s)\")'; PS1='\[\e[38;5;40m\]\u@mcp-dev\[\e[0m\]:\[\e[38;5;39m\]\w\[\e[38;5;214m\]\${PS1_CMD1}\[\e[0m\]\\$ '" >> /home/vscode/.bashrc

# デフォルトシェルをbashに設定
RUN chsh -s /bin/bash vscode

# ホームディレクトリの所有権を確保
RUN chown -R vscode:vscode /home/vscode

USER vscode
WORKDIR /opt/app