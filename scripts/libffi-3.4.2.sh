#!/usr/bin/env bash

echo ""
echo "Libffi-3.4.2"
tar -xf libffi-3.4.2.tar.gz
cd libffi-3.4.2
./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native \
            --disable-exec-static-tramp
make
echo "Libffi-3.4.2 make finished"
read -p "Press any key to continue ..."

make check
echo "Libffi-3.4.2 check finished"
read -p "Press any key to continue ..."

make install

echo "Libffi-3.4.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf libffi-3.4.2
