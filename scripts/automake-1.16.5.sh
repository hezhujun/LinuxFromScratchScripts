#!/usr/bin/env bash

echo ""
echo "Automake-1.16.5"
tar -xf automake-1.16.5.tar.xz
cd automake-1.16.5
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5
make
echo "Automake-1.16.5 make finished"
read -p "Press any key to continue ..."

make -j4 check
echo "Automake-1.16.5 check finished"
read -p "Press any key to continue ..."

make install

echo "Automake-1.16.5 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf automake-1.16.5
