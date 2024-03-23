#!/usr/bin/env bash
set -euo pipefail

echo "Downloading Python dependencies"
python3 -m pip wheel --wheel-dir=./dependencies/python -r requirements.txt

# echo "Installing Python dependencies"
# python3 -m pip install --user --no-index --find-links=./dependencies/python -r requirements.txt

echo "Downloading Ansible collections"
ansible-galaxy collection download -r requirements.yml -p ./dependencies/ansible

# echo "Installing Ansible collections"
# ansible-galaxy collection install -r ./dependencies/ansible/requirements.yml
