#!/usr/bin/env bash

echo ""
echo "Expect-5.45.4"
tar -xf expect5.45.4.tar.gz
cd expect5.45.4
./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include
make
echo "Expect-5.45.4 make finished"
read -p "Press any key to continue ..."

make test
echo "Expect-5.45.4 test finished"
read -p "Press any key to continue ..."

make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

echo "Expect-5.45.4 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf expect5.45.4
