#!/usr/bin/env bash

echo ""
echo "Grep-3.7"
tar -xf grep-3.7.tar.xz
cd grep-3.7
./configure --prefix=/usr
make
echo "Grep-3.7 make finished"
read -p "Press any key to continue ..."

make check
echo "Grep-3.7 check finished"
read -p "Press any key to continue ..."

make install

echo "Grep-3.7 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf grep-3.7
