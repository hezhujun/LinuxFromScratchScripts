#!/usr/bin/env bash

echo ""
echo "Libstdc++"
tar -xf gcc-11.2.0.tar.xz
cd gcc-11.2.0
mkdir -v build
cd build
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/11.2.0

make
echo "Libstdc++ make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Libstdc++ finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf gcc-11.2.0
