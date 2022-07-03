#!/usr/bin/env bash

echo ""
echo "Patch-2.7.6"
tar -xf patch-2.7.6.tar.xz
cd  patch-2.7.6
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
echo "Patch-2.7.6 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Patch-2.7.6 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf patch-2.7.6
