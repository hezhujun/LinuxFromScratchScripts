#!/usr/bin/env bash

echo ""
echo "Less-590"
tar -xf less-590.tar.gz
cd less-590
./configure --prefix=/usr --sysconfdir=/etc
make
echo "Less-590 make finished"
read -p "Press any key to continue ..."

make install

echo "Less-590 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf less-590
