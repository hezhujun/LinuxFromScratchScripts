#!/usr/bin/env bash

echo ""
echo "Tar-1.34"
tar -xf tar-1.34.tar.xz
cd tar-1.34
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)
make
echo "Tar-1.34 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Tar-1.34 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf tar-1.34
