#!/usr/bin/env bash

echo ""
echo "Grep-3.7"
tar -xf grep-3.7.tar.xz
cd grep-3.7
./configure --prefix=/usr   \
            --host=$LFS_TGT
make
echo "Grep-3.7 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Grep-3.7 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf grep-3.7
