#!/usr/bin/env bash

echo ""
echo "GDBM-1.23"
tar -xf gdbm-1.23.tar.gz
cd gdbm-1.23
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat
make
echo "GDBM-1.23 make finished"
read -p "Press any key to continue ..."

make check
echo "GDBM-1.23 check finished"
read -p "Press any key to continue ..."

make install

echo "GDBM-1.23 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gdbm-1.23
