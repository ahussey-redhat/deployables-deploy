#!/usr/bin/env bash
set -euo pipefail

echo "Downloading Python dependencies"
python3 -m pip download --dest=./dependencies/python -r requirements.txt

echo "Downloading Ansible collections"
ansible-galaxy collection download -r requirements.yml -p ./dependencies/ansible
