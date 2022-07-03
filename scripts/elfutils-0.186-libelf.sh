#!/usr/bin/env bash

echo ""
echo "Libelf"
tar -xf elfutils-0.186.tar.bz2
cd elfutils-0.186
./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy
make
echo "Libelf make finished"
read -p "Press any key to continue ..."

make check
echo "Libelf check finished"
read -p "Press any key to continue ..."

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a

echo "Libelf finished"
read -p "Press any key to continue ..."
cd ..
rm -rf elfutils-0.186
