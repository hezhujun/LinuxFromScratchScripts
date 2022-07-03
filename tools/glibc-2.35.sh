#!/usr/bin/env bash

echo ""
echo "Glibc-2.35"
tar -xf glibc-2.35.tar.xz
cd glibc-2.35
case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-2.35-fhs-1.patch
mkdir -v build
cd build
echo "rootsbindir=/usr/sbin" > configparms
../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/usr/lib
make
echo "Glibc-2.35 make finished"
read -p "Press any key to continue ..."

make DESTDIR=$LFS install
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd


echo "Should output [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]"
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep '/ld-linux'
read -p "Press any key to continue ..."
rm -v dummy.c a.out

$LFS/tools/libexec/gcc/$LFS_TGT/11.2.0/install-tools/mkheaders

echo "Glibc-2.35 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf glibc-2.35
