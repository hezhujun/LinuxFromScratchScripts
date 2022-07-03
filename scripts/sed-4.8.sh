#!/usr/bin/env bash

echo ""
echo "Sed-4.8"
tar -xf sed-4.8.tar.xz
cd sed-4.8
./configure --prefix=/usr
make
make html
echo "Sed-4.8 make finished"
read -p "Press any key to continue ..."

chown -Rv tester .
su tester -c "PATH=$PATH make check"
echo "Sed-4.8 test finished"
read -p "Press any key to continue ..."

make install
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8

echo "Sed-4.8 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf sed-4.8
