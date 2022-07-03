#!/usr/bin/env bash

echo ""
echo "Findutils-4.9.0"
tar -xf findutils-4.9.0.tar.xz
cd findutils-4.9.0
case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

make
echo "Findutils-4.9.0 make finished"
read -p "Press any key to continue ..."

chown -Rv tester .
su tester -c "PATH=$PATH make check"
echo "Findutils-4.9.0 check finished"
read -p "Press any key to continue ..."

make install

echo "Findutils-4.9.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf findutils-4.9.0
