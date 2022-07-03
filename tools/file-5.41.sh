#!/usr/bin/env bash

echo ""
echo "File-5.41"
tar -xf file-5.41.tar.gz
cd file-5.41
mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd
./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
make FILE_COMPILE=$(pwd)/build/src/file
echo "File-5.41 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install

echo "File-5.41 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf file-5.41
