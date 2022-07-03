#!/usr/bin/env bash

echo ""
echo "Acl-2.3.1"
tar -xf m4-1.4.19.tar.xz
cd m4-1.4.19
./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1
make
echo "Acl-2.3.1 make finished"
read -p "Press any key to continue ..."

make install

echo "Acl-2.3.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf m4-1.4.19
