#!/usr/bin/env bash

echo ""
echo "Check-0.15.2"
tar -xf check-0.15.2.tar.gz
cd check-0.15.2
./configure --prefix=/usr --disable-static
make
echo "Check-0.15.2 make finished"
read -p "Press any key to continue ..."

make check
echo "Check-0.15.2 check finished"
read -p "Press any key to continue ..."

make docdir=/usr/share/doc/check-0.15.2 install

echo "Check-0.15.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf check-0.15.2
