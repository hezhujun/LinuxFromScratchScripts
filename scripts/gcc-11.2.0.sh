#!/usr/bin/env bash

echo ""
echo "GCC-11.2.0"
tar -xf gcc-11.2.0.tar.xz
cd gcc-11.2.0
sed -e '/static.*SIGSTKSZ/d' \
    -e 's/return kAltStackSize/return SIGSTKSZ * 4/' \
    -i libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build
cd build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib
make
echo "GCC-11.2.0 make finished"
read -p "Press any key to continue ..."

ulimit -s 32768
chown -Rv tester .
su tester -c "PATH=$PATH make -k check -j$(nproc)"
../contrib/test_summary
echo "may fail items: analyzer related; asan_test.c; 49745.cc; get_time related"
echo "GCC-11.2.0 check finished"
echo "Go to https://lfs.xry111.site/zh_CN/11.1/chapter08/gcc.html to compare"
read -p "Press any key to continue ..."

make install
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/11.2.0/include-fixed/bits/
chown -v -R root:root /usr/lib/gcc/*linux-gnu/11.2.0/include{,-fixed}
ln -svr /usr/bin/cpp /usr/lib
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/11.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
echo "GCC-11.2.0 dummy test"

echo "readelf -l a.out | grep ': /lib'"
readelf -l a.out | grep ': /lib'
echo "should output: [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]"
read -p "Press any key to continue ..."

echo "grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log"
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
echo "should output:"
echo "/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../lib/crt1.o succeeded"
echo "/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../lib/crti.o succeeded"
echo "/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/../../../../lib/crtn.o succeeded"
read -p "Press any key to continue ..."

echo "grep -B4 '^ /usr/include' dummy.log"
grep -B4 '^ /usr/include' dummy.log
echo "should output:"
echo "#include <...> search starts here:"
echo " /usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/include"
echo "/usr/local/include"
echo "/usr/lib/gcc/x86_64-pc-linux-gnu/11.2.0/include-fixed"
echo "/usr/include"
read -p "Press any key to continue ..."

echo "grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'"
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
echo "should output:"
echo 'SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")'
echo 'SEARCH_DIR("/usr/local/lib64")'
echo 'SEARCH_DIR("/lib64")'
echo 'SEARCH_DIR("/usr/lib64")'
echo 'SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")'
echo 'SEARCH_DIR("/usr/local/lib")'
echo 'SEARCH_DIR("/lib")'
echo 'SEARCH_DIR("/usr/lib");'
read -p "Press any key to continue ..."

echo "grep "/lib.*/libc.so.6 " dummy.log"
grep "/lib.*/libc.so.6 " dummy.log
echo "should output: attempt to open /usr/lib/libc.so.6 succeeded"
read -p "Press any key to continue ..."

echo "grep found dummy.log"
grep found dummy.log
echo "should output: found ld-linux-x86-64.so.2 at /usr/lib/ld-linux-x86-64.so.2"
read -p "Press any key to continue ..."

rm -v dummy.c a.out dummy.log
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

echo "GCC-11.2.0 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf gcc-11.2.0
