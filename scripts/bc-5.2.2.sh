#!/usr/bin/env bash

echo ""
echo "Bc-5.2.2"
tar -xf bc-5.2.2.tar.xz
cd bc-5.2.2
CC=gcc ./configure --prefix=/usr -G -O3
make
echo "Bc-5.2.2 make finished"
read -p "Press any key to continue ..."

make test
echo "Bc-5.2.2 test finished"
read -p "Press any key to continue ..."

make install

echo "Bc-5.2.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf bc-5.2.2
