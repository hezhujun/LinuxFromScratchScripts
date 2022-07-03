#!/usr/bin/env bash

echo ""
echo "Gettext-0.21"
tar -xf gettext-0.21.tar.xz
cd gettext-0.21
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21
make
echo "Gettext-0.21 make finished"
read -p "Press any key to continue ..."

make check
echo "Gettext-0.21 check finished"
read -p "Press any key to continue ..."

make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

echo "Gettext-0.21 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gettext-0.21
