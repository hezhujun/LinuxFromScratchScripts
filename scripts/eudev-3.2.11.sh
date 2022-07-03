#!/usr/bin/env bash

echo ""
echo "Eudev-3.2.11"
tar -xf eudev-3.2.11.tar.gz
cd eudev-3.2.11
./configure --prefix=/usr           \
            --bindir=/usr/sbin      \
            --sysconfdir=/etc       \
            --enable-manpages       \
            --disable-static
make
echo "Eudev-3.2.11 make finished"
read -p "Press any key to continue ..."

mkdir -pv /usr/lib/udev/rules.d
mkdir -pv /etc/udev/rules.d
make check
echo "Eudev-3.2.11 check finished"
read -p "Press any key to continue ..."

make install
tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install
udevadm hwdb --update

echo "Eudev-3.2.11 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf eudev-3.2.11
