#!/usr/bin/env bash

echo ""
echo "M4-1.4.19"
tar -xf m4-1.4.19.tar.xz
cd m4-1.4.19
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
echo "M4-1.4.19 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "M4-1.4.19 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf m4-1.4.19
