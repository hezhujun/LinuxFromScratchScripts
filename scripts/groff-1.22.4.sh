#!/usr/bin/env bash

echo ""
echo "Groff-1.22.4"
tar -xf groff-1.22.4.tar.gz
cd groff-1.22.4
PAGE=A4 ./configure --prefix=/usr

make -j1
echo "Groff-1.22.4 make finished"
read -p "Press any key to continue ..."

make install

echo "Groff-1.22.4 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf groff-1.22.4
