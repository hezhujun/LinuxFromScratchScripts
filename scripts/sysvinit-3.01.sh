#!/usr/bin/env bash

echo ""
echo "Sysvinit-3.01"
tar -xf sysvinit-3.01.tar.xz
cd sysvinit-3.01
patch -Np1 -i ../sysvinit-3.01-consolidated-1.patch
make
echo "Sysvinit-3.01 make finished"
read -p "Press any key to continue ..."

make install

echo "Sysvinit-3.01 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf sysvinit-3.01
