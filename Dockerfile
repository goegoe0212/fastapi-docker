# Pythonは公式イメージ
FROM python:3.10.13-slim-bullseye

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# 必要なツール群のインストール
RUN apt-get update \
    && apt-get install -y git curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Poetryのインストール
RUN pip install poetry

# Poetryが仮想環境を生成しないようにする
RUN poetry config virtualenvs.create false

# git cloneで指定したブランチをチェックアウトする
RUN git clone -b develop https://github.com/goegoe0212/fastapi-poetry.git .

RUN poetry install --no-dev
