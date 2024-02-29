#!/bin/sh

set -e

python manage.py wait_for_db

#collect all static files to STATIC_ROOT direction (specifyed in app settings.py)
python manage.py collectstatic --noinput

python manage.py migrate

uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi

