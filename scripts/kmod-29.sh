#!/usr/bin/env bash

echo ""
echo "Kmod-29"
tar -xf kmod-29.tar.xz
cd kmod-29
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib
make
echo "Kmod-29 make finished"
read -p "Press any key to continue ..."

make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

echo "Kmod-29 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf kmod-29
