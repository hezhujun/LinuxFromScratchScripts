#!/usr/bin/env bash

echo ""
echo "Util-linux-2.37.4"
tar -xf util-linux-2.37.4.tar.xz
cd util-linux-2.37.4
mkdir -pv /var/lib/hwclock
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --libdir=/usr/lib    \
            --docdir=/usr/share/doc/util-linux-2.37.4 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            runstatedir=/run

make
echo "Util-linux-2.37.4 make finished"
read -p "Press any key to continue ..."

make install

echo "Util-linux-2.37.4 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf util-linux-2.37.4
