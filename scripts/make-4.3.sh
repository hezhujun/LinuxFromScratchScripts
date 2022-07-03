#!/usr/bin/env bash

echo ""
echo "Make-4.3"
tar -xf make-4.3.tar.gz
cd make-4.3
./configure --prefix=/usr
make
echo "Make-4.3 make finished"
read -p "Press any key to continue ..."

make check
echo "Make-4.3 check finished"
read -p "Press any key to continue ..."

make install

echo "Make-4.3 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf make-4.3
