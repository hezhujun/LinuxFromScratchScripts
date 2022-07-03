#!/usr/bin/env bash

echo ""
echo " IPRoute2-5.16.0"
tar -xf iproute2-5.16.0.tar.xz
cd iproute2-5.16.0
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
make
echo " IPRoute2-5.16.0 make finished"
read -p "Press any key to continue ..."

make SBINDIR=/usr/sbin install
mkdir -pv             /usr/share/doc/iproute2-5.16.0
cp -v COPYING README* /usr/share/doc/iproute2-5.16.0

echo " IPRoute2-5.16.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf iproute2-5.16.0
