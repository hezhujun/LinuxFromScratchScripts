#!/usr/bin/env bash

echo ""
echo "Sed-4.8"
tar -xf sed-4.8.tar.xz
cd sed-4.8
./configure --prefix=/usr   \
            --host=$LFS_TGT
make
echo "Sed-4.8 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Sed-4.8 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf sed-4.8
