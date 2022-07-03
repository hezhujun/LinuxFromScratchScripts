#!/usr/bin/env bash

echo ""
echo "Coreutils-9.0"
tar -xf coreutils-9.0.tar.xz
cd coreutils-9.0
patch -Np1 -i ../coreutils-9.0-i18n-1.patch
patch -Np1 -i ../coreutils-9.0-chmod_fix-1.patch
autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime
make
echo "Coreutils-9.0 make finished"
read -p "Press any key to continue ..."

make NON_ROOT_USERNAME=tester check-root
echo "dummy:x:102:tester" >> /etc/group
chown -Rv tester . 
su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"
echo "test-getlogin may be failed"
echo "Coreutils-9.0 check finished"
read -p "Press any key to continue ..."

sed -i '/dummy/d' /etc/group
make install
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

echo "Coreutils-9.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf coreutils-9.0
