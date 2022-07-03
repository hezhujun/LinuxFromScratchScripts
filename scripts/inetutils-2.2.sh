#!/usr/bin/env bash

echo ""
echo "Inetutils-2.2"
tar -xf inetutils-2.2.tar.xz
cd inetutils-2.2
./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers
make
echo "Inetutils-2.2 make finished"
read -p "Press any key to continue ..."

make check
echo "Inetutils-2.2 check finished"
read -p "Press any key to continue ..."

make install
mv -v /usr/{,s}bin/ifconfig

echo "Inetutils-2.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf inetutils-2.2
