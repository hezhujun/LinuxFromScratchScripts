#!/usr/bin/env bash

echo ""
echo "Autoconf-2.71"
tar -xf autoconf-2.71.tar.xz
cd autoconf-2.71
./configure --prefix=/usr
make
echo "Autoconf-2.71 make finished"
read -p "Press any key to continue ..."

make check
echo "Autoconf-2.71 check finished"
read -p "Press any key to continue ..."

make install

echo "Autoconf-2.71 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf autoconf-2.71
