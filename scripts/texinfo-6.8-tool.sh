#!/usr/bin/env bash

echo ""
echo "Texinfo-6.8"
tar -xf texinfo-6.8.tar.xz
cd texinfo-6.8
sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c
./configure --prefix=/usr

make
echo "Texinfo-6.8 make finished"
read -p "Press any key to continue ..."

make install

echo "Texinfo-6.8 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf texinfo-6.8
