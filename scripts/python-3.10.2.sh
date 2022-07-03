#!/usr/bin/env bash

echo ""
echo "Python-3.10.2"
tar -xf Python-3.10.2.tar.xz
cd Python-3.10.2
./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes \
            --enable-optimizations

make
echo "Python-3.10.2 make finished"
read -p "Press any key to continue ..."

make install
install -v -dm755 /usr/share/doc/python-3.10.2/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.10.2/html \
    -xvf ../python-3.10.2-docs-html.tar.bz2

echo "Python-3.10.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf Python-3.10.2
