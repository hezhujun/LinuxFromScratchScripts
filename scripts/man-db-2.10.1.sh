#!/usr/bin/env bash

echo ""
echo "Man-DB-2.10.1"
tar -xf man-db-2.10.1.tar.xz
cd man-db-2.10.1
./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.10.1 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap
make
echo "Man-DB-2.10.1 make finished"
read -p "Press any key to continue ..."

make check
echo "Man-DB-2.10.1 check finished"
read -p "Press any key to continue ..."

make install

echo "Man-DB-2.10.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf man-db-2.10.1
