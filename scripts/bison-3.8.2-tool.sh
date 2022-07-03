#!/usr/bin/env bash

echo ""
echo "Bison-3.8.2"
tar -xf bison-3.8.2.tar.xz
cd bison-3.8.2
./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

make
echo "Bison-3.8.2 make finished"
read -p "Press any key to continue ..."

make install

echo "Bison-3.8.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf bison-3.8.2
