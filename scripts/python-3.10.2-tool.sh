#!/usr/bin/env bash

echo ""
echo "Python-3.10.2"
tar -xf Python-3.10.2.tar.xz
cd Python-3.10.2
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make
echo "Python-3.10.2 make finished"
read -p "Press any key to continue ..."

make install

echo "Python-3.10.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf Python-3.10.2
