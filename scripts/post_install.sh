#!/bin/bash
set -euo pipefail
# Set the BASEDIR variable
BASEDIR="/home/ubuntu/djangocode/django-helloworld-master/"
cd "$BASEDIR"
# Install Python 3.9
sudo apt-get install python3.9

# Create and activate virtual environment
python3.9 -m venv env
source "${BASEDIR}env/bin/activate"

# Change to the source code directory
cd "$BASEDIR"
echo "Yes"
# Install required packages
pip install -r requirements.txt  --yes
