#!/usr/bin/env bash

echo ""
echo "Psmisc-23.4"
tar -xf psmisc-23.4.tar.xz
cd psmisc-23.4
./configure --prefix=/usr
make
echo "Psmisc-23.4 make finished"
read -p "Press any key to continue ..."

make install

echo "Psmisc-23.4 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf psmisc-23.4
