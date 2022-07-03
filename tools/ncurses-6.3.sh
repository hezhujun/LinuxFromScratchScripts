#!/usr/bin/env bash

echo ""
echo "Ncurses-6.3"
tar -xf ncurses-6.3.tar.gz
cd ncurses-6.3
sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --disable-stripping          \
            --enable-widec

make
echo "Ncurses-6.3 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so

echo "Ncurses-6.3 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf ncurses-6.3
