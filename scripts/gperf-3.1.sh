#!/usr/bin/env bash

echo ""
echo "Gperf-3.1"
tar -xf gperf-3.1.tar.gz
cd gperf-3.1
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
make
echo "Gperf-3.1 make finished"
read -p "Press any key to continue ..."

make -j1 check
echo "Gperf-3.1 check finished"
read -p "Press any key to continue ..."

make install

echo "Gperf-3.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gperf-3.1
