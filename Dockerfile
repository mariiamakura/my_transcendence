FROM python:3.12-alpine3.19

LABEL maintainer="ourpong.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

RUN pythaon -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev && \
	/py/bin/pip install psycopg2-binary && \
    /py/bin/pip install -r /requirements.txt && \
    apk del .tmp-deps && \
	mkdir -p /vol/web/static && \
	mkdir -p /vol/web/media

ENV PATH="/py/bin:$PATH"


