#!/usr/bin/env bash

echo ""
echo "Procps-ng-3.3.17"
tar -xf procps-ng-3.3.17.tar.xz
cd procps-3.3.17
./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-3.3.17 \
            --disable-static                         \
            --disable-kill
make
echo "Procps-ng-3.3.17 make finished"
read -p "Press any key to continue ..."

make check
echo "Procps-ng-3.3.17 check finished"
read -p "Press any key to continue ..."

make install

echo "Procps-ng-3.3.17 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf procps-3.3.17
