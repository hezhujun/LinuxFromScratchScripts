#!/usr/bin/env bash

echo ""
echo "Jinja2-3.0.3"
tar -xf Jinja2-3.0.3.tar.gz
cd Jinja2-3.0.3

python3 setup.py install --optimize=1

echo "Jinja2-3.0.3 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf Jinja2-3.0.3
