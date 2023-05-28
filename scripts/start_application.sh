#!/bin/bash
set -euo pipefail
# Set the BASEDIR variable
BASEDIR="/home/ubuntu/djangocode/django-helloworld-master/"
# Change to the BASEDIR
cd "$BASEDIR"
# Clear static files
python3 manage.py collectstatic --clear --no-input

# Make migrations
python3 manage.py makemigrations

# Apply migrations
python3 manage.py migrate

# Restart Gunicorn (assuming it's managed by systemd)
#sudo systemctl restart gunicorn
sudo systemctl restart my-django.service
