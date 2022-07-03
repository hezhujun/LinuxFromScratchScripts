#!/usr/bin/env bash

echo ""
echo "Binutils-2.38"
tar -xf binutils-2.38.tar.xz
cd binutils-2.38
sed '6009s/$add_dir//' -i ltmain.sh
mkdir -v build
cd build
../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd
make
echo "Binutils-2.38 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Binutils-2.38 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf binutils-2.38
