#!/usr/bin/env bash

echo ""
echo "File-5.41"
tar -xf file-5.41.tar.gz
cd file-5.41
./configure --prefix=/usr
make
echo "File-5.41 make finished"
read -p "Press any key to continue ..."

make check
echo "File-5.41 check finished"
read -p "Press any key to continue ..."

make install

echo "File-5.41 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf file-5.41
