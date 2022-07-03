#!/usr/bin/env bash

echo ""
echo "Libcap-2.63"
tar -xf libcap-2.63.tar.xz
cd libcap-2.63
sed -i '/install -m.*STA/d' libcap/Makefile
make prefix=/usr lib=lib
echo "Libcap-2.63 make finished"
read -p "Press any key to continue ..."

make test
echo "Libcap-2.63 test finished"
read -p "Press any key to continue ..."

make prefix=/usr lib=lib install

echo "Libcap-2.63 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf libcap-2.63
