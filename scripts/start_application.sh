#!/bin/bash
set -euo pipefail
# Set the BASEDIR variable
BASEDIR="/home/ubuntu/djangocode/django-helloworld-master/"
# Change to the BASEDIR
cd "$BASEDIR"
# Clear static files
python manage.py collectstatic --clear --no-input

# Make migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Restart Gunicorn (assuming it's managed by systemd)
sudo systemctl restart gunicorn
