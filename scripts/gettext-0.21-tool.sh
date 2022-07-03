#!/usr/bin/env bash

echo ""
echo "Gettext-0.21"
tar -xf gettext-0.21.tar.xz
cd gettext-0.21
./configure --disable-shared

make
echo "Gettext-0.21 make finished"
read -p "Press any key to continue ..."

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

echo "Gettext-0.21 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf gettext-0.21
