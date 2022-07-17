#!/usr/bin/env bash

echo ""
echo "MarkupSafe-2.0.1"
tar -xf MarkupSafe-2.0.1.tar.gz
cd MarkupSafe-2.0.1
python3 setup.py build
echo "MarkupSafe-2.0.1 make finished"
read -p "Press any key to continue ..."

python3 setup.py install --optimize=1

echo "MarkupSafe-2.0.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf MarkupSafe-2.0.1
