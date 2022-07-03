#!/usr/bin/env bash

echo ""
echo "Intltool-0.51.0"
tar -xf intltool-0.51.0.tar.gz
cd intltool-0.51.0
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make
echo "Intltool-0.51.0 make finished"
read -p "Press any key to continue ..."

make check
echo "Intltool-0.51.0 check finished"
read -p "Press any key to continue ..."

make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

echo "Intltool-0.51.0 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf intltool-0.51.0
