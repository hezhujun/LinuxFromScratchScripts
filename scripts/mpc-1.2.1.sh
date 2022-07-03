#!/usr/bin/env bash

echo ""
echo "MPC-1.2.1"
tar -xf mpc-1.2.1.tar.gz
cd mpc-1.2.1
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1
make
make html
echo "MPC-1.2.1 make finished"
read -p "Press any key to continue ..."

make check
echo "MPC-1.2.1 check finished"
read -p "Press any key to continue ..."

make install
make install-html

echo "MPC-1.2.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf mpc-1.2.1
