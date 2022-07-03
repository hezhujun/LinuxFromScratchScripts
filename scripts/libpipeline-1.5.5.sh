#!/usr/bin/env bash

echo ""
echo "Libpipeline-1.5.5"
tar -xf libpipeline-1.5.5.tar.gz
cd libpipeline-1.5.5
./configure --prefix=/usr
make
echo "Libpipeline-1.5.5 make finished"
read -p "Press any key to continue ..."

make check
echo "Libpipeline-1.5.5 check finished"
read -p "Press any key to continue ..."

make install

echo "Libpipeline-1.5.5 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf libpipeline-1.5.5
