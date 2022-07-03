#!/usr/bin/env bash

echo ""
echo "Pkg-config-0.29.2"
tar -xf pkg-config-0.29.2.tar.gz
cd pkg-config-0.29.2
./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2
make
echo "Pkg-config-0.29.2 make finished"
read -p "Press any key to continue ..."

make check
echo "Pkg-config-0.29.2 check finished"
read -p "Press any key to continue ..."

make install

echo "Pkg-config-0.29.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf pkg-config-0.29.2
