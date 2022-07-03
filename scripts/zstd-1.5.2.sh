#!/usr/bin/env bash

echo ""
echo "Zstd-1.5.2"
tar -xf zstd-1.5.2.tar.gz
cd zstd-1.5.2
make
echo "Zstd-1.5.2 make finished"
read -p "Press any key to continue ..."

make check
echo "Zstd-1.5.2 check finished"
read -p "Press any key to continue ..."

make prefix=/usr install
rm -v /usr/lib/libzstd.a

echo "Zstd-1.5.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf zstd-1.5.2
