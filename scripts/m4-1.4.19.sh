#!/usr/bin/env bash

echo ""
echo "M4-1.4.19"
tar -xf m4-1.4.19.tar.xz
cd m4-1.4.19
./configure --prefix=/usr
make
echo "M4-1.4.19 make finished"
read -p "Press any key to continue ..."

make check
echo "M4-1.4.19 check finished"
read -p "Press any key to continue ..."

make install

echo "M4-1.4.19 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf m4-1.4.19
