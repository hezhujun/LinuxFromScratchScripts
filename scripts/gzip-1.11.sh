#!/usr/bin/env bash

echo ""
echo "Gzip-1.11"
tar -xf gzip-1.11.tar.xz
cd gzip-1.11
./configure --prefix=/usr
make
echo "Gzip-1.11 make finished"
read -p "Press any key to continue ..."

make check
echo "Gzip-1.11 check finished"
read -p "Press any key to continue ..."

make install

echo "Gzip-1.11 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gzip-1.11
