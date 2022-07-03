#!/usr/bin/env bash

echo ""
echo "OpenSSL-3.0.1"
tar -xf openssl-3.0.1.tar.gz
cd openssl-3.0.1
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic
make
echo "OpenSSL-3.0.1 make finished"
read -p "Press any key to continue ..."

make test
echo "OpenSSL-3.0.1 test finished"
read -p "Press any key to continue ..."

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.1
cp -vfr doc/* /usr/share/doc/openssl-3.0.1

echo "OpenSSL-3.0.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf openssl-3.0.1
