#!/usr/bin/env bash

echo ""
echo "Bash-5.1.16"
tar -xf bash-5.1.16.tar.gz
cd bash-5.1.16
./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc
make
echo "Bash-5.1.16 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

echo "Bash-5.1.16 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf bash-5.1.16
