#!/usr/bin/env bash

echo ""
echo "Flex-2.6.4"
tar -xf flex-2.6.4.tar.gz
cd flex-2.6.4
./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static
make
echo "Flex-2.6.4 make finished"
read -p "Press any key to continue ..."

make check
echo "Flex-2.6.4 check finished"
read -p "Press any key to continue ..."

make install
ln -sv flex /usr/bin/lex

echo "Flex-2.6.4 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf flex-2.6.4
