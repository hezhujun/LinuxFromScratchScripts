#!/usr/bin/env bash

echo ""
echo "Zlib-1.2.11"
tar -xf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=/usr
make
echo "Zlib-1.2.11 make finished"
read -p "Press any key to continue ..."

make check
echo "Zlib-1.2.11 check finished"
read -p "Press any key to continue ..."

make install
rm -fv /usr/lib/libz.a

echo "Zlib-1.2.11 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf zlib-1.2.11
