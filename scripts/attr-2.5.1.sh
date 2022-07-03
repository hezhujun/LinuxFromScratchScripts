#!/usr/bin/env bash

echo ""
echo "Attr-2.5.1"
tar -xf attr-2.5.1.tar.gz
cd attr-2.5.1
./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1
make
echo "Attr-2.5.1 make finished"
read -p "Press any key to continue ..."

make check
echo "Attr-2.5.1 check finished"
read -p "Press any key to continue ..."

make install

echo "Attr-2.5.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf attr-2.5.1
