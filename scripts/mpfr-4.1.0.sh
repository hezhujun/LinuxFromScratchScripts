#!/usr/bin/env bash

echo ""
echo "MPFR-4.1.0"
tar -xf mpfr-4.1.0.tar.xz
cd mpfr-4.1.0
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0
make
make html
echo "MPFR-4.1.0 make finished"
read -p "Press any key to continue ..."

make check
echo "all test should be passed"
echo "MPFR-4.1.0 check finished"
read -p "Press any key to continue ..."

make install
make install-html

echo "MPFR-4.1.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf mpfr-4.1.0
