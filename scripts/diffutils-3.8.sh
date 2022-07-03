#!/usr/bin/env bash

echo ""
echo "Diffutils-3.8"
tar -xf diffutils-3.8.tar.xz
cd diffutils-3.8
./configure --prefix=/usr
make
echo "Diffutils-3.8 make finished"
read -p "Press any key to continue ..."

make check
echo "Diffutils-3.8 check finished"
read -p "Press any key to continue ..."

make install

echo "Diffutils-3.8 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf diffutils-3.8
