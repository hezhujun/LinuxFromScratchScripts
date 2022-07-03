#!/usr/bin/env bash

echo ""
echo "Binutils-2.38"
tar -xf binutils-2.38.tar.xz
cd binutils-2.38
mkdir -v build
cd build
../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror
make
echo "Binutils-2.38 make finished"
read -p "Press any key to continue ..."

make install

echo "Binutils-2.38 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf binutils-2.38
