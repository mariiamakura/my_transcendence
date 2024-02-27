FROM python:3.13.0a4-alpine3.19

LABEL maintainer="ourpong.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

# Install system dependencies
RUN apk update --no-cache && \
    apk add build-base postgresql-dev libpq --no-cache --virtual .build-deps && \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt

ENV PATH="/py/bin:$PATH"


