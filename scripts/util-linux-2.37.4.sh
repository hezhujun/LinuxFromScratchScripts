#!/usr/bin/env bash

echo ""
echo "Util-linux-2.37.4"
tar -xf util-linux-2.37.4.tar.xz
cd util-linux-2.37.4
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --bindir=/usr/bin    \
            --libdir=/usr/lib    \
            --sbindir=/usr/sbin  \
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
            --without-systemd    \
            --without-systemdsystemunitdir
make
echo "Util-linux-2.37.4 make finished"
read -p "Press any key to continue ..."

rm tests/ts/lsns/ioctl_ns
chown -Rv tester .
su tester -c "make -k check"
echo "Util-linux-2.37.4 check finished"
read -p "Press any key to continue ..."

make install

echo "Util-linux-2.37.4 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf util-linux-2.37.4
