#!/usr/bin/env bash

echo ""
echo "Xz-5.2.5"
tar -xf xz-5.2.5.tar.xz
cd xz-5.2.5
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5
make
echo "Xz-5.2.5 make finished"
read -p "Press any key to continue ..."

make check
echo "Xz-5.2.5 check finished"
read -p "Press any key to continue ..."

make install

echo "Xz-5.2.5 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf xz-5.2.5
