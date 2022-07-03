#!/usr/bin/env bash

echo ""
echo "Kbd-2.4.0"
tar -xf kbd-2.4.0.tar.xz
cd kbd-2.4.0
patch -Np1 -i ../kbd-2.4.0-backspace-1.patch
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
./configure --prefix=/usr --disable-vlock
make
echo "Kbd-2.4.0 make finished"
read -p "Press any key to continue ..."

make check
echo "Kbd-2.4.0 check finished"
read -p "Press any key to continue ..."

make install
mkdir -pv           /usr/share/doc/kbd-2.4.0
cp -R -v docs/doc/* /usr/share/doc/kbd-2.4.0

echo "Kbd-2.4.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf kbd-2.4.0
