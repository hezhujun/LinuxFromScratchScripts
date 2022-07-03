#!/usr/bin/env bash

echo ""
echo "Gawk-5.1.1"
tar -xf gawk-5.1.1.tar.xz
cd gawk-5.1.1
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr
make
echo "Gawk-5.1.1 make finished"
read -p "Press any key to continue ..."

make check
echo "Gawk-5.1.1 check finished"
read -p "Press any key to continue ..."

make install
mkdir -pv                                   /usr/share/doc/gawk-5.1.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.1

echo "Gawk-5.1.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gawk-5.1.1
