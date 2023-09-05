#!/bin/bash

echo "installing norminette..."
python3 -m pip install --upgrade pip setuptools
python3 -m pip install --user norminette
echo "norminette is installed."

./scripts/save_to_fileRC.sh "export PATH=\"/home/kali/.local/bin:\$PATH\""
