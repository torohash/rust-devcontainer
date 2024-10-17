FROM rust:1.81.0

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME

RUN groupadd -g ${GROUP_ID} ${USER_NAME} && \
    useradd -m -u ${USER_ID} -g ${USER_NAME} ${USER_NAME}

RUN apt update && apt install git bash-completion tree -y && apt clean

# Clippyをインストール
RUN rustup component add clippy

# Gitのタブ補完有効化と__git_ps1コマンドの利用
RUN echo "source /usr/share/bash-completion/completions/git" >> /home/${USER_NAME}/.bashrc && \
    echo "source /etc/bash_completion.d/git-prompt" >> /home/${USER_NAME}/.bashrc

# プロンプトの設定
RUN echo "PROMPT_COMMAND='PS1_CMD1=\$(__git_ps1 \" (%s)\")'; PS1='\[\e[38;5;40m\]\u@\h\[\e[0m\]:\[\e[38;5;39m\]\w\[\e[38;5;214m\]\${PS1_CMD1}\[\e[0m\]\\$ '" >> /home/${USER_NAME}/.bashrc

# デフォルトシェルをbashに設定
RUN chsh -s /bin/bash ${USER_NAME}

USER ${USER_NAME}

WORKDIR /opt/app