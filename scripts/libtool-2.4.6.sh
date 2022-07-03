#!/usr/bin/env bash

echo ""
echo "Libtool-2.4.6"
tar -xf libtool-2.4.6.tar.xz
cd libtool-2.4.6
./configure --prefix=/usr
make
echo "Libtool-2.4.6 make finished"
read -p "Press any key to continue ..."

make check TESTSUITEFLAGS=-j`nproc`
echo "Libtool-2.4.6 check finished"
read -p "Press any key to continue ..."

make install
rm -fv /usr/lib/libltdl.a

echo "Libtool-2.4.6 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf libtool-2.4.6
