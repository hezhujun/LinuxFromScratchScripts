#!/usr/bin/env bash

echo ""
echo "Binutils-2.38"
tar -xf binutils-2.38.tar.xz
cd binutils-2.38
expect -c "spawn ls"
echo "Binutils-2.38 check, should output \"spawn ls\""
read -p "Press any key to continue ..."

patch -Np1 -i ../binutils-2.38-lto_fix-1.patch
sed -e '/R_386_TLS_LE /i \   || (TYPE) == R_386_TLS_IE \\' \
    -i ./bfd/elfxx-x86.h
mkdir -v build
cd build
../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

make tooldir=/usr
echo "Binutils-2.38 make finished"
read -p "Press any key to continue ..."

make -k check
echo "Binutils-2.38 check finished"
read -p "Press any key to continue ..."

make tooldir=/usr install
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a

echo "Binutils-2.38 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf binutils-2.38
