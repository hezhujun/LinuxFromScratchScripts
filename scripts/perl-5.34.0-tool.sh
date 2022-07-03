#!/usr/bin/env bash

echo ""
echo "Perl-5.34.0"
tar -xf perl-5.34.0.tar.xz
cd perl-5.34.0
sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.34/core_perl     \
             -Darchlib=/usr/lib/perl5/5.34/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.34/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.34/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.34/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.34/vendor_perl

make
echo "Perl-5.34.0 make finished"
read -p "Press any key to continue ..."

make install

echo "Perl-5.34.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf perl-5.34.0
