#!/usr/bin/env bash

echo ""
echo "Gawk-5.1.1"
tar -xf gawk-5.1.1.tar.xz
cd gawk-5.1.1
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
echo "Gawk-5.1.1 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "Gawk-5.1.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gawk-5.1.1
