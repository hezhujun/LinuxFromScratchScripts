#!/usr/bin/env bash

echo ""
echo "DejaGNU-1.6.3"
tar -xf dejagnu-1.6.3.tar.gz
cd dejagnu-1.6.3
mkdir -v build
cd build
../configure --prefix=/usr
makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi

make install
install -v -dm755  /usr/share/doc/dejagnu-1.6.3
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3

echo "DejaGNU-1.6.3 finished"
read -p "Press any key to continue ..."

make check
echo "DejaGNU-1.6.3 check finished"
read -p "Press any key to continue ..."

cd ../..
rm -rf dejagnu-1.6.3
