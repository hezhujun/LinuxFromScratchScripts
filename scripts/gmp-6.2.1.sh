#!/usr/bin/env bash

echo ""
echo "GMP-6.2.1"
tar -xf gmp-6.2.1.tar.xz
cd gmp-6.2.1
cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1
make
make html
echo "GMP-6.2.1 make finished"
read -p "Press any key to continue ..."

make check 2>&1 | tee gmp-check-log
echo "197 tests should pass, actually pass:"
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
echo "GMP-6.2.1 check finished"
read -p "Press any key to continue ..."

make install
make install-html

echo "GMP-6.2.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gmp-6.2.1
