# python3.9のイメージをダウンロード
FROM python:3.9-buster
ENV PYTHONUNBUFFERED=1

WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの定義ファイルをコピー (存在する場合)
COPY pyproject.toml* poetry.lock* ./

# poetryでライブラリをインストール (pyproject.tomlが既にある場合)
RUN poetry config virtualenvs.path ".venv"
RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install --no-dev; fi

EXPOSE 8000
CMD ["poetry", "run", "gunicorn", "-w", "1", "-k", "uvicorn.workers.UvicornWorker", "--capture-output", "--log-level", "warning", "--access-logfile", "-", "--bind", ":8000", "api.main:app"]
