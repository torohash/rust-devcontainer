FROM rust:1.77.0

RUN apt-get update && apt-get install -y git

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME

# ユーザーを作成
RUN groupadd -g ${GROUP_ID} ${USER_NAME} && \
    useradd -m -u ${USER_ID} -g ${USER_NAME} ${USER_NAME}

USER ${USER_NAME}

WORKDIR /opt/app