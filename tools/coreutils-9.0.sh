#!/usr/bin/env bash

echo ""
echo "Coreutils-9.0"
tar -xf coreutils-9.0.tar.xz
cd coreutils-9.0
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime
make
echo "Coreutils-9.0 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install
mv -v $LFS/usr/bin/chroot              $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                    $LFS/usr/share/man/man8/chroot.8

echo "Coreutils-9.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf coreutils-9.0
