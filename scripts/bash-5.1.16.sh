#!/usr/bin/env bash

echo ""
echo "Bash-5.1.16"
tar -xf bash-5.1.16.tar.gz
cd bash-5.1.16
./configure --prefix=/usr                      \
            --docdir=/usr/share/doc/bash-5.1.16 \
            --without-bash-malloc              \
            --with-installed-readline
make
echo "Bash-5.1.16 make finished"
read -p "Press any key to continue ..."

chown -Rv tester .
su -s /usr/bin/expect tester << EOF
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF
echo "Bash-5.1.16 check finished"
read -p "Press any key to continue ..."

make install

echo "Bash-5.1.16 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf bash-5.1.16
