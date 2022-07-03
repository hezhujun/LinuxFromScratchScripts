#!/usr/bin/env bash

echo ""
echo "E2fsprogs-1.46.5"
tar -xf e2fsprogs-1.46.5.tar.gz
cd e2fsprogs-1.46.5
mkdir -v build
cd       build
../configure --prefix=/usr           \
             --sysconfdir=/etc       \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck
make
echo "E2fsprogs-1.46.5 make finished"
read -p "Press any key to continue ..."

make check
echo "u_direct_io may fail"
echo "E2fsprogs-1.46.5 check finished"
read -p "Press any key to continue ..."

make install
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

echo "E2fsprogs-1.46.5 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf e2fsprogs-1.46.5
