#!/usr/bin/env bash

echo ""
echo "Tar-1.34"
tar -xf tar-1.34.tar.xz
cd tar-1.34
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr
make
echo "Tar-1.34 make finished"
read -p "Press any key to continue ..."

make check
echo "capabilities: binary store/restore may fail"
echo "Tar-1.34 check finished"
read -p "Press any key to continue ..."

make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34

echo "Tar-1.34 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf tar-1.34
