#!/usr/bin/env bash

echo ""
echo "Libstdc++"
tar -xf gcc-11.2.0.tar.xz
cd gcc-11.2.0
ln -s gthr-posix.h libgcc/gthr-default.h
mkdir -v build
cd build
../libstdc++-v3/configure            \
    CXXFLAGS="-g -O2 -D_GNU_SOURCE"  \
    --prefix=/usr                    \
    --disable-multilib               \
    --disable-nls                    \
    --host=$(uname -m)-lfs-linux-gnu \
    --disable-libstdcxx-pch

make
echo "Libstdc++ make finished"
read -p "Press any key to continue ..."

make install

echo "Libstdc++ finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf gcc-11.2.0
