#!/usr/bin/env bash

echo ""
echo "LFS-Bootscripts-20210608"
tar -xf lfs-bootscripts-20210608.tar.xz
cd lfs-bootscripts-20210608

make install

echo "LFS-Bootscripts-20210608 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf lfs-bootscripts-20210608
