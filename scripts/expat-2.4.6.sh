#!/usr/bin/env bash

echo ""
echo "Expat-2.4.6"
tar -xf expat-2.4.6.tar.xz
cd expat-2.4.6
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.6
make
echo "Expat-2.4.6 make finished"
read -p "Press any key to continue ..."

make check
echo "Expat-2.4.6 check finished"
read -p "Press any key to continue ..."

make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.6

echo "Expat-2.4.6 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf expat-2.4.6
