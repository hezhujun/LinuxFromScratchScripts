#!/usr/bin/env bash

echo ""
echo "Linux-5.16.9 API Headers"
tar -xf linux-5.16.9.tar.xz
cd linux-5.16.9
make mrproper
make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr
echo "Linux-5.16.9 API Headers finished"
read -p "Press any key to continue ..."
cd ..
rm -rf linux-5.16.9
