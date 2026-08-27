# syntax=docker/dockerfile:1
FROM python:3.14-slim

WORKDIR /app

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

COPY . .

RUN chmod +x entry_point.sh

ENTRYPOINT ["/bin/sh", "/app/entry_point.sh"]