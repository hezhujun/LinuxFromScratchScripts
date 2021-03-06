#!/usr/bin/env bash

echo ""
echo "Perl-5.34.0"
tar -xf perl-5.34.0.tar.xz
cd perl-5.34.0
patch -Np1 -i ../perl-5.34.0-upstream_fixes-1.patch
export BUILD_ZLIB=False
export BUILD_BZIP2=0
sh Configure -des                                         \
             -Dprefix=/usr                                \
             -Dvendorprefix=/usr                          \
             -Dprivlib=/usr/lib/perl5/5.34/core_perl      \
             -Darchlib=/usr/lib/perl5/5.34/core_perl      \
             -Dsitelib=/usr/lib/perl5/5.34/site_perl      \
             -Dsitearch=/usr/lib/perl5/5.34/site_perl     \
             -Dvendorlib=/usr/lib/perl5/5.34/vendor_perl  \
             -Dvendorarch=/usr/lib/perl5/5.34/vendor_perl \
             -Dman1dir=/usr/share/man/man1                \
             -Dman3dir=/usr/share/man/man3                \
             -Dpager="/usr/bin/less -isR"                 \
             -Duseshrplib                                 \
             -Dusethreads

make
echo "Perl-5.34.0 make finished"
read -p "Press any key to continue ..."

make test
echo "Perl-5.34.0 test finished"
read -p "Press any key to continue ..."

make install
unset BUILD_ZLIB BUILD_BZIP2

echo "Perl-5.34.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf perl-5.34.0
