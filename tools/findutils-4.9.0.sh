#!/usr/bin/env bash

echo ""
echo "Findutils-4.9.0"
tar -xf findutils-4.9.0.tar.xz
cd findutils-4.9.0
./configure --prefix=/usr   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
echo "Findutils-4.9.0 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Findutils-4.9.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf findutils-4.9.0
